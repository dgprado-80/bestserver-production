local doors = {
    [1] = { doorPosition = Position(34072, 32345, 14), storage = 736722, value = 5 }, -- Define o valor mínimo como 5
}

local inferniarch_doors = Action()

function inferniarch_doors.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    for _, p in pairs(doors) do
        if (item:getPosition() == p.doorPosition) and not (Tile(item:getPosition()):getTopCreature()) then
            -- Verifica se o valor do storage do jogador é maior ou igual ao valor definido
            if player:getStorageValue(p.storage) >= p.value then
                player:teleportTo(toPosition, true) -- Teleporta o jogador
                item:transform(item.itemid + 1)    -- Transforma a porta
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must have defeated Arbaziloth at least five times.") -- Mensagem de erro
            end
        end
    end

    return true
end

inferniarch_doors:aid(25476)
inferniarch_doors:register()