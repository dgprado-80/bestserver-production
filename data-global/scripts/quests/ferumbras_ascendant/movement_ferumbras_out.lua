local config = {
    teleportPosition = Position(32227, 32170, 6),
    countdownStorage = Storage.FerumbrasAscension.Timer -- Certifique-se de ajustar para o storage correto do contador.
}

local movement = MoveEvent()

function movement.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player or item:getId() ~= 1949 or item:getUniqueId() ~= 37623 then
        return true
    end

    -- Teleporta o jogador para a posição especificada.
    player:teleportTo(config.teleportPosition)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

    -- Encerra o contador do jogador.
    if player:getStorageValue(config.countdownStorage) > 0 then
        player:setStorageValue(config.countdownStorage, 0)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported to the boss room and your timer has been reset.")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported to Teleport room.")
    end

    return true
end

movement:type("stepin")
movement:uid(37623)
movement:register()
