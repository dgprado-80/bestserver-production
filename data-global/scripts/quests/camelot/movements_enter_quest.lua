local teleportPosition = Position(32751, 33473, 8)
local teleportMessage = "Be careful"

local teleportEvent = MoveEvent()

function teleportEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Verifique se o item tem o uid e itemid corretos
    if item.uid == 53200 and item.itemid == 436 then
        player:teleportTo(teleportPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, teleportMessage)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        print("UID or itemid mismatch: UID " .. item.uid .. ", ItemID " .. item.itemid)
    end

    return true
end

teleportEvent:type("stepin")
teleportEvent:uid(53200) -- Registra o evento para o UID específico
teleportEvent:register()
