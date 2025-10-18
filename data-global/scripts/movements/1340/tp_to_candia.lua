local teleportPosition = Position(33341, 33151, 7)
local teleportMessage = "Welcome to Candia!"

local teleportEvent = MoveEvent()

function teleportEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Verifique se o item tem o uid e itemid corretos
    if item.uid == 25643 and item.itemid == 25276 then
        player:teleportTo(teleportPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, teleportMessage)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        print("UID or itemid mismatch: UID " .. item.uid .. ", ItemID " .. item.itemid)
    end

    return true
end

teleportEvent:type("stepin")
teleportEvent:uid(25643) -- Registra o evento para o UID específico
teleportEvent:register()
