local destination = Position(32992, 33299, 7)
local requiredStorage = 55600
local messageNoSeal = "You do not possess the completed fire seal."

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(requiredStorage) >= 1 then
        player:teleportTo(destination)
        destination:sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, messageNoSeal)
    end
    return true
end

-- Registra a action para o item com UID 35535
local action = Action()
action:uid(35535)
action:register()

