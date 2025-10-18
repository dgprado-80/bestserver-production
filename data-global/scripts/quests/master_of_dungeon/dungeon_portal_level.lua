local levelRequired = 1200
local teleportDestination = Position(32375, 33485, 4)

local LevelTeleport = MoveEvent()

function LevelTeleport.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    if player:getLevel() < levelRequired then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be at least level " .. levelRequired .. " to use this teleport.")
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return false
    end

    position:sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(teleportDestination)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

LevelTeleport:type("stepin")
LevelTeleport:aid(56006)
LevelTeleport:register()
