local hoist = MoveEvent()

function hoist.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    -- Remove as verificações de storage para permitir passagem irrestrita
    if table.contains({ 3059, 3061 }, item.uid) then
        player:teleportTo(Position(32157, 31125, 10))
    elseif item.uid == 3060 then
        if Tile(Position(32156, 31125, 10)):getItemById(2772) then
            player:teleportTo(Position(32157, 31125, 10))
        else
            player:teleportTo(fromPosition)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The hoist must be set up before using it.")
        end
    end

    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

hoist:type("stepin")
hoist:uid(3059, 3060, 3061)
hoist:register()


