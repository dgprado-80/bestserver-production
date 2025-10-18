local autoloot = {
    talkaction = "!autoloot",
    storageBase = 70000,
    limit = 30
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
            local newCache = {unpack(itemsCache, 1, limits)}
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
            if not item:moveTo(corpseOwner) then
                corpseOwner:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have no capacity.")
                break
            end
        end
    end
    return true
end
autolootDropLootCallback:register()

-- Definindo o CreatureEvent para o evento de logout
local creatureEvent = CreatureEvent("autolootCleanCache")

function creatureEvent.onLogout(player)
    local guid = player:getGuid()
    local items = getPlayerAutolootItems(player)
    setPlayerAutolootItems(player, items) -- Atualiza os itens no storage antes do logout
    autolootCache[guid] = nil -- Remove o jogador do cache
    return true
end

creatureEvent:register()

-- Configuração do TalkAction
local talkAction = TalkAction(autoloot.talkaction)

function talkAction.onSay(player, words, param, type)
    local split = param:splitTrimmed(",")
    local action = split[1]
    if not action then
        player:showTextDialog(3043, string.format("Examples of use:\n%s add,gold coin\n%s remove,gold coin\n%s clear\n%s show\n\n~Available slots~\nlimit: %d", words, words, words, words, autoloot.limit), false)
        return false
    end

    if action == "clear" then
        autolootCache[player:getGuid()] = {} -- Limpa o cache dos itens do jogador
        setPlayerAutolootItems(player, {}) -- Limpa os itens no storage do jogador
        player:sendCancelMessage("Autoloot list cleared.")
        return false
    elseif action == "show" then
        local items = getPlayerAutolootItems(player)
        local description = {string.format('~ Your autoloot list, capacity: %d/%d ~\n', #items, autoloot.limit)}
        for i, itemId in pairs(items) do
            description[#description + 1] = string.format("%d) %s", i, ItemType(itemId):getName())
        end
        player:showTextDialog(3043, table.concat(description, '\n'), false)
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
