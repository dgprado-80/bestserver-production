local teleportToTown = TalkAction("!temple")
local COOLDOWN_STORAGE = 12345 -- ID único para a storage do cooldown
local COOLDOWN_TIME = 5 * 60 -- 5 minutos em segundos

local function teleportMessage(player, message)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
end

function teleportToTown.onSay(player, words, param)
    -- Verifica o cooldown
    local lastUsed = player:getStorageValue(COOLDOWN_STORAGE)
    if lastUsed > os.time() then
        local remainingTime = lastUsed - os.time()
        teleportMessage(player, "You must wait " .. math.ceil(remainingTime / 60) .. " minutes before using this command again.")
        return true
    end

    -- Verifica se o jogador está em combate
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

    if inFight then
        teleportMessage(player, "You can't use this command while in a fight.")
        return true
    end

    -- Teleporta o jogador para o templo de origem
    local town = player:getTown()
    if town then
        player:teleportTo(town:getTemplePosition())
        teleportMessage(player, "You have been teleported to your home temple.")
        player:setStorageValue(COOLDOWN_STORAGE, os.time() + COOLDOWN_TIME) -- Define o cooldown
    else
        teleportMessage(player, "Your home temple could not be found.")
    end

    return true
end

teleportToTown:separator(" ")
teleportToTown:groupType("normal")
teleportToTown:register()
