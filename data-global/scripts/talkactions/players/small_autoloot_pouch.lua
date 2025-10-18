local autoloot = {
    talkaction = "!autoloot",
    storageBase = 70000,
    limit = 30,
    lootPouchId = 23721, -- ID da loot pouch
    lootPouchStorage = 70100 -- Storage para armazenar o estado da loot pouch
}

local autolootCache = {}

local function getPlayerLimit(player)
    return player:isPremium() and autoloot.limit or autoloot.limit
end

local function getPlayerAutolootItems(player)
    local limits = getPlayerLimit(player)
    local guid = player:getGuid()
    local itemsCache = autolootCache[guid]
    if itemsCache then
        if #itemsCache > limits then
            local newCache = { unpack(itemsCache, 1, limits) }
            autolootCache[guid] = newCache
            return newCache
        end
        return itemsCache
    end

    local items = {}
    for i = 1, limits do
        local itemType = ItemType(tonumber(player:getStorageValue(autoloot.storageBase + i)) or 0)
        if itemType and itemType:getId() ~= 0 then
            items[#items + 1] = itemType:getId()
        end
    end

    autolootCache[guid] = items
    return items
end

local function setPlayerAutolootItems(player, items)
    for i = 1, autoloot.limit do
        local itemId = items[i] or -1
        player:setStorageValue(autoloot.storageBase + i, itemId)
    end
    return true
end

local function addPlayerAutolootItem(player, itemId)
    local items = getPlayerAutolootItems(player)
    for _, id in pairs(items) do
        if itemId == id then
            return false
        end
    end
    items[#items + 1] = itemId
    return setPlayerAutolootItems(player, items)
end

local function removePlayerAutolootItem(player, itemId)
    local items = getPlayerAutolootItems(player)
    for i, id in pairs(items) do
        if itemId == id then
            table.remove(items, i)
            return setPlayerAutolootItems(player, items)
        end
    end
    return false
end

local function hasPlayerAutolootItem(player, itemId)
    for _, id in pairs(getPlayerAutolootItems(player)) do
        if itemId == id then
            return true
        end
    end
    return false
end

-- Função para verificar se o jogador ativou a loot pouch
local function isLootPouchEnabled(player)
    return player:getStorageValue(autoloot.lootPouchStorage) == 1
end

-- Função para mover itens para a loot pouch
local function moveToLootPouch(player, item)
    local storeInbox = player:getStoreInbox()
    if not storeInbox then
        return false
    end

    -- Procura a loot pouch na store inbox
    local lootPouch = nil
    for _, containerItem in ipairs(storeInbox:getItems()) do
        if containerItem:getId() == autoloot.lootPouchId then
            lootPouch = containerItem
            break
        end
    end

    if not lootPouch then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have a loot pouch in your store inbox.")
        return false
    end

    -- Função auxiliar para encontrar a última página com espaço disponível
    local function findAvailablePage(pouch)
        local currentPage = pouch
        while true do
            if currentPage:getEmptySlots() > 0 then
                return currentPage
            end

            -- Verifica se há uma próxima página usando pagination
            local nextPage = nil
            for _, subContainer in ipairs(currentPage:getItems()) do
                if subContainer:isContainer() and subContainer:getId() == autoloot.lootPouchId then
                    nextPage = subContainer
                    break
                end
            end

            if not nextPage then
                -- Cria uma nova página usando o sistema de pagination
                nextPage = currentPage:addItem(autoloot.lootPouchId, INDEX_WHERE_NOT_MOVABLE)
                if not nextPage then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed to expand the loot pouch.")
                    return nil
                end
            end

            currentPage = nextPage
        end
    end

    -- Encontra a página disponível
    local targetPage = findAvailablePage(lootPouch)
    if not targetPage then
        return false
    end

    -- Move o item para a página encontrada
    if not item:moveTo(targetPage) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed to move item to loot pouch.")
        return false
    end

    -- Remove qualquer pouch duplicada dentro da loot pouch principal
    for _, subContainer in ipairs(lootPouch:getItems()) do
        if subContainer:isContainer() and subContainer ~= targetPage then
            subContainer:remove() -- Remove qualquer container duplicado
        end
    end

    return true
end

-- Definindo o EventCallback para o evento de loot
local autolootDropLootCallback = EventCallback("autolootDropLoot")
function autolootDropLootCallback.monsterOnDropLoot(monster, corpse)
    if not corpse:getType():isContainer() then
        return true
    end

    local corpseOwner = Player(corpse:getCorpseOwner())
    if not corpseOwner then
        return true
    end

    local items = corpse:getItems()
    for _, item in pairs(items) do
        if hasPlayerAutolootItem(corpseOwner, item:getId()) then
            if isLootPouchEnabled(corpseOwner) then
                if not moveToLootPouch(corpseOwner, item) then
                    corpseOwner:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed to move item to loot pouch.")
                end
            else
                if not item:moveTo(corpseOwner) then
                    corpseOwner:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no capacity.")
                    break
                end
            end
        end
    end
    return true
end
autolootDropLootCallback:register()

-- Configuração do TalkAction
local talkAction = TalkAction(autoloot.talkaction)

function talkAction.onSay(player, words, param, type)
    local split = param:splitTrimmed(",")
    local action = split[1]
    if not action then
        player:showTextDialog(3043, string.format("Examples of use:\n%s add,gold coin\n%s remove,gold coin\n%s clear\n%s show\n%s pouch, on/off\n\n~Available slots~\nlimit: %d", words, words, words, words, words, autoloot.limit), false)
        return false
    end

    if action == "clear" then
        autolootCache[player:getGuid()] = {} -- Limpa o cache dos itens do jogador
        setPlayerAutolootItems(player, {}) -- Limpa os itens no storage do jogador
        player:sendCancelMessage("Autoloot list cleared.")
        return false
    elseif action == "show" then
        local items = getPlayerAutolootItems(player)
        local description = { string.format('~ Your autoloot list, capacity: %d/%d ~\n', #items, autoloot.limit) }
        for i, itemId in pairs(items) do
            description[#description + 1] = string.format("%d) %s", i, ItemType(itemId):getName())
        end
        player:showTextDialog(3043, table.concat(description, '\n'), false)
        return false
    elseif action == "pouch" then
        local state = split[2]
        if state == "on" then
            player:setStorageValue(autoloot.lootPouchStorage, 1)
            player:sendCancelMessage("Loot pouch enabled.")
        elseif state == "off" then
            player:setStorageValue(autoloot.lootPouchStorage, 0)
            player:sendCancelMessage("Loot pouch disabled.")
        else
            player:sendCancelMessage("Invalid parameter. Use 'on' or 'off'.")
        end
        return false
    end

    local function getItemType()
        local itemType = ItemType(split[2])
        if not itemType or itemType:getId() == 0 then
            itemType = ItemType(tonumber(split[2]) or 0)
            if not itemType or itemType:getId() == 0 then
                player:sendCancelMessage(string.format("The item %s does not exist!", split[2]))
                return false
            end
        end
        return itemType
    end

    if action == "add" then
        local itemType = getItemType()
        if itemType then
            if #getPlayerAutolootItems(player) >= autoloot.limit then
                player:sendCancelMessage(string.format("Your autoloot only allows you to add %d items.", autoloot.limit))
                return false
            end

            if addPlayerAutolootItem(player, itemType:getId()) then
                player:sendCancelMessage(string.format("You have added %s to the list.", itemType:getName()))
            else
                player:sendCancelMessage(string.format("The item %s already exists!", itemType:getName()))
            end
        end
        return false
    elseif action == "remove" then
        local itemType = getItemType()
        if itemType then
            if removePlayerAutolootItem(player, itemType:getId()) then
                player:sendCancelMessage(string.format("You have removed %s from the list.", itemType:getName()))
            else
                player:sendCancelMessage(string.format("The item %s does not exist in the list.", itemType:getName()))
            end
        end
        return false
    end

    return false
end

talkAction:groupType("normal")
talkAction:separator(" ")
talkAction:register()