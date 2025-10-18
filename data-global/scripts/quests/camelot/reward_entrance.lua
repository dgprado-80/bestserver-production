local teleportAction = Action()

function teleportAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o Unique ID do item está correto
    if item.uid ~= 53204 then
        return false
    end

    -- Verifica se o jogador completou a missão (possui storage 53203 >= 1)
    if player:getStorageValue(353206) < 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to complete the required mission to use this.")
        return true
    end

    -- Teleporta o jogador
    local teleportPosition = Position(32664, 33472, 6)
    player:teleportTo(teleportPosition)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT) -- Efeito visual no destino
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported.")

    return true
end

-- Configura a action para o item ID e Unique ID especificados
teleportAction:uid(53204)
teleportAction:register()
