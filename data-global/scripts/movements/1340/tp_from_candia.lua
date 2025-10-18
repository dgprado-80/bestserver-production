

local teleportPosition = Position(33574, 32222, 7)
local teleportMessage = "Welcome to Feyrist!"

local teleportEvent = MoveEvent()

function teleportEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    -- Verifique se o item tem o uid e itemid corretos
    if item.uid == 25644 and item.itemid == 44785 then
        player:teleportTo(teleportPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, teleportMessage)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        print("UID or itemid mismatch: UID " .. item.uid .. ", ItemID " .. item.itemid)
    end

    return true
end

teleportEvent:type("stepin")
teleportEvent:uid(25644) -- Registra o evento para o UID específico
teleportEvent:register()