local internalNpcName = "Exalted Changer"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
    lookType = 1743,
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

-- Configuração da mensagem de saudação e resposta
local function greetCallback(npc, creature)
    local player = Player(creature)
    npcHandler:say("Hello " .. player:getName() .. "! I can {trade dusts for slivers}, {trade slivers for core}, or {expand dust limit}. What would you like to do?", npc, creature)
    return true
end

local function confirmTradeCallback(npc, creature, type, message)
    local player = Player(creature)
    local tradeType = player:getStorageValue(10001)

    if message:lower() == "yes" then
        if tradeType == 1 then
            local slivers = 50
            local exaltedCore = 37110
            if player:getItemCount(37109) >= slivers then
                player:removeItem(37109, slivers)
                player:addItem(exaltedCore, 1)
                npcHandler:say("Here is your Exalted Core in exchange for 50 Slivers.", npc, creature)
            else
                npcHandler:say("You do not have enough Slivers.", npc, creature)
            end

        elseif tradeType == 2 then
            local dusts = 60
            local slivers = 3
            if player:getForgeDusts() >= dusts then
                player:removeForgeDusts(dusts)
                player:addItem(37109, slivers)
                npcHandler:say("Here are your 3 Slivers in exchange for 60 Dusts.", npc, creature)
            else
                npcHandler:say("You do not have enough Dusts.", npc, creature)
            end

        elseif tradeType == 3 then
            local maxLimit = 325
            local currentLimit = player:getForgeDustLevel()

            if currentLimit >= maxLimit then
                npcHandler:say("You have already reached the maximum dust limit of " .. maxLimit .. ".", npc, creature)
                player:setStorageValue(10001, -1)
                return true
            end

            local requiredDusts = 25 + (currentLimit - 100)

            if player:getForgeDusts() >= requiredDusts then
                player:removeForgeDusts(requiredDusts)
                player:addForgeDustLevel(1)
                player:save()

                local newLimit = player:getForgeDustLevel()
                npcHandler:say("Your dust limit has been expanded to " .. newLimit .. ". You have sacrificed " .. requiredDusts .. " dusts.", npc, creature)
            else
                npcHandler:say("You do not have enough Dusts to expand your limit.", npc, creature)
            end
        end

        player:setStorageValue(10001, -1)
    elseif message:lower() == "no" then
        npcHandler:say("Alright, if you change your mind, let me know!", npc, creature)
        player:setStorageValue(10001, -1)
    else
        npcHandler:say("Please answer with 'yes' or 'no'.", npc, creature)
        return true
    end

    return true
end

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    local currentState = player:getStorageValue(10001)

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    if currentState == 1 or currentState == 2 or currentState == 3 then
        return confirmTradeCallback(npc, creature, type, message)
    elseif MsgContains(message, "slivers for core") then
        npcHandler:say("Are you sure you want to trade 50 Slivers for an Exalted Core? Reply with 'yes' to confirm or 'no' to cancel.", npc, creature)
        player:setStorageValue(10001, 1)
    elseif MsgContains(message, "dusts for slivers") then
        npcHandler:say("Are you sure you want to trade 60 Dusts for 3 Slivers? Reply with 'yes' to confirm or 'no' to cancel.", npc, creature)
        player:setStorageValue(10001, 2)
    elseif MsgContains(message, "expand dust limit") then
        local maxLimit = 325
        local currentLimit = player:getForgeDustLevel()

        if currentLimit >= maxLimit then
            npcHandler:say("You have already reached the maximum dust limit of " .. maxLimit .. ".", npc, creature)
            player:setStorageValue(10001, -1)
            return true
        end

        local requiredDusts = 25 + (currentLimit - 100)
        npcHandler:say("Are you sure you want to expand your dust limit from " .. currentLimit .. " to " .. (currentLimit + 1) .. "? This will cost you " .. requiredDusts .. " dusts. Reply with 'yes' to confirm or 'no' to cancel.", npc, creature)
        player:setStorageValue(10001, 3)
    else
        npcHandler:say("I don't understand what you want. Please choose between {dusts for slivers}, {slivers for core}, or {expand dust limit}.", npc, creature)
        player:setStorageValue(10001, -1)
    end

    return true
end

-- Configuração das mensagens padrão
npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! I can {dusts for slivers}, {slivers for core}, or {expand dust limit}. What would you like to do?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Have a nice day!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-- Adicionando módulo de foco
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- Registrando a configuração do NPC
npcType:register(npcConfig)
