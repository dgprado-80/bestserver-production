local internalNpcName = "Attribute Trader"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "Trades items for attribute boosts."

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 150,
    lookHead = 95,
    lookBody = 9,
    lookLegs = 87,
    lookFeet = 95,
    lookAddons = 0,
}

npcConfig.flags = {
    floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
    npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
    npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
    npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
    npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
    npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
    npcHandler:onCloseChannel(npc, creature)
end

-- Definição dos itens e valores de pontos
local sanguineItems = {
    [43864] = 13, [43865] = 13, [43866] = 13, [43867] = 13, [43868] = 13, [43869] = 13,
    [43870] = 13, [43871] = 13, [43872] = 13, [43873] = 13, [43874] = 13, [43875] = 13,
    [43876] = 13, [43877] = 13, [43878] = 13, [43879] = 13, [43880] = 13, [43881] = 13,
    [43882] = 13, [43883] = 13, [43884] = 13, [43885] = 13, [43886] = 13, [43887] = 13
}

local soulItems = {
    [34083] = 7, [34084] = 7, [34085] = 7, [34086] = 7, [34087] = 7, [34088] = 7,
    [34089] = 7, [34090] = 7, [34091] = 7, [34092] = 7, [34093] = 7, [34094] = 7,
    [34095] = 7, [34096] = 7, [34097] = 7, [34098] = 7, [34099] = 7, [34082] = 7
}

local primalItems = {
    [39147] = 3, [39148] = 3, [39149] = 3, [39150] = 3, [39151] = 3,
    [39152] = 3, [39153] = 3, [39154] = 3, [39183] = 3, [39186] = 3
}

local tradeOptions = {
    ["health"] = {points = 10, item = 49163, message = "health/mana boost"},
    ["regen"] = {points = 5, item = 49162, message = "regeneration boost"},
    ["skill"] = {points = 7, item = 47978, message = "skill boost"},
    ["critical"] = {points = 15, item = 47976, message = "critical hit boost"}  -- Nova runa de Critical Hit Boost
}

local confirmationTopic = {}

-- Função auxiliar para verificar se o item possui tier
local function hasTier(item)
    return item:getTier() > 0  -- Se o tier for maior que 0, o item possui um tier
end

-- Função para calcular pontos disponíveis apenas dos containers
local function calculatePointsFromContainers(player)
    local totalPoints = player:getStorageValue(1840000) -- Storage para pontos restantes
    if totalPoints < 0 then totalPoints = 0 end

    -- Função auxiliar para calcular os pontos dentro de um container
    local function calculatePointsInContainer(container)
        for i = 0, container:getSize() - 1 do
            local item = container:getItem(i)
            if item and not hasTier(item) then  -- Verifica se o item não possui tier
                local itemId = item:getId()
                -- Verificar se o item está na lista de itens válidos
                local itemValue = sanguineItems[itemId] or soulItems[itemId] or primalItems[itemId]
                if itemValue then
                    totalPoints = totalPoints + (item:getCount() * itemValue)
                elseif item:isContainer() then
                    calculatePointsInContainer(item) -- Recursivo para containers dentro de containers
                end
            end
        end
    end

    -- Iterar sobre os containers (mochilas)
    for i = CONST_SLOT_BACKPACK, CONST_SLOT_LAST do
        local container = player:getSlotItem(i)
        if container and container:isContainer() then
            calculatePointsInContainer(container)
        end
    end

    return totalPoints
end

-- Função para remover itens apenas de containers que não possuem tier
local function removeItemsFromBackpack(player, requiredPoints)
    local currentPoints = 0

    -- Função auxiliar para iterar sobre containers e remover itens
    local function removeFromContainer(container)
        for i = 0, container:getSize() - 1 do
            local item = container:getItem(i)
            if item and not hasTier(item) then  -- Apenas remover itens sem tier
                local itemId = item:getId()

                -- Verificar se o item está na lista de itens válidos
                local itemValue = sanguineItems[itemId] or soulItems[itemId] or primalItems[itemId]
                if itemValue then
                    while currentPoints < requiredPoints and item:getCount() > 0 do
                        item:remove(1)
                        currentPoints = currentPoints + itemValue
                    end
                    if currentPoints >= requiredPoints then return true end
                elseif item:isContainer() then
                    if removeFromContainer(item) then return true end
                end
            end
        end
        return false
    end

    -- Remover itens de todos os containers do jogador
    for i = CONST_SLOT_BACKPACK, CONST_SLOT_LAST do
        local container = player:getSlotItem(i)
        if container and container:isContainer() then
            if removeFromContainer(container) then
                break
            end
        end
    end

    return currentPoints
end

-- Função que gerencia a interação com o jogador
local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    message = message:lower():trim()
    local playerId = player:getId()

    -- Se o jogador já está em uma confirmação
    if npcHandler:getTopic(playerId) == 1 then
        if message == "yes" and confirmationTopic[playerId] then
            local tradeChoice = confirmationTopic[playerId]
            local option = tradeOptions[tradeChoice]

            local usedPoints = removeItemsFromBackpack(player, option.points)
            local remainingPoints = usedPoints - option.points
            player:setStorageValue(1840000, remainingPoints) -- Armazenar pontos restantes
            player:addItem(option.item, 1) -- Item do boost
            npcHandler:say("Here is your " .. option.message .. "!", npc, creature)
            npcHandler:setTopic(playerId, 0)
            confirmationTopic[playerId] = nil
        elseif message == "no" then
            npcHandler:say("Alright, let me know if you change your mind.", npc, creature)
            npcHandler:setTopic(playerId, 0)
            confirmationTopic[playerId] = nil
        else
            npcHandler:say("Please respond with 'yes' or 'no'.", npc, creature)
        end
        return true
    end

    -- Verificação de troca
    if message == "trade" or message == "exchange" then
        local points = calculatePointsFromContainers(player)
        npcHandler:say("You have " .. points .. " points. You can choose: 30% {health}/mana boost (10 points), 15% {regen} boost (5 points), {skill} boost (7 points), or {critical} hit boost (15 points).", npc, creature)
    elseif message == "points" then
        local storedPoints = player:getStorageValue(1840000)
        if storedPoints < 0 then storedPoints = 0 end
        npcHandler:say("You have " .. storedPoints .. " stored points.", npc, creature)
    elseif tradeOptions[message] then
        local option = tradeOptions[message]
        if calculatePointsFromContainers(player) >= option.points then
            npcHandler:say("Are you sure you want to exchange " .. option.points .. " points for a " .. option.message .. "? Say 'yes' to confirm.", npc, creature)
            npcHandler:setTopic(playerId, 1)
            confirmationTopic[playerId] = message
        else
            npcHandler:say("You don't have enough points.", npc, creature)
        end
    else
        npcHandler:say("I don't understand that command. Try 'exchange', 'points', 'health', 'regen', 'skill', or 'critical'.", npc, creature)
    end

    return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, I can exchange items for attribute boosts. Say {exchange} to begin, or {points} to check stored points.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Goodbye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Goodbye.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
