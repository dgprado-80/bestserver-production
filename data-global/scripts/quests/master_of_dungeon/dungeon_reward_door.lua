local doors = {
    [1] = { doorPosition = Position(32355, 33168, 13), storage = 82769, value = 1 }, -- Define o valor mínimo como 5
}

local dungeon_doors = Action()

function dungeon_doors.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    for _, p in pairs(doors) do
        if (item:getPosition() == p.doorPosition) and not (Tile(item:getPosition()):getTopCreature()) then
            -- Verifica se o valor do storage do jogador é maior ou igual ao valor definido
            if player:getStorageValue(p.storage) >= p.value then
                player:teleportTo(toPosition, true) -- Teleporta o jogador
                item:transform(item.itemid + 1)    -- Transforma a porta
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must have defeated Mestre dos Magos to enter this room.") -- Mensagem de erro
            end
        end
    end

    return true
end

dungeon_doors:aid(42769)
dungeon_doors:register()