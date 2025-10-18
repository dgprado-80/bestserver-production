local destination = {
    [33006] = {
        newPos = Position(32834, 33477, 6),
        levelRequired = 1000,
        effect = CONST_ME_TELEPORT,
    }
}

local levelTeleportcamelot = MoveEvent()

function levelTeleportcamelot.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

    local teleport = destination[item.itemid]
    if not teleport then
        return false
    end

    if player:getLevel() >= teleport.levelRequired then
        position:sendMagicEffect(teleport.effect)
        player:teleportTo(teleport.newPos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:teleportTo(fromPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be at least level " .. teleport.levelRequired .. " to use this teleport.")
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end
    return true
end

levelTeleportcamelot:type("stepin")
levelTeleportcamelot:aid(46006)
levelTeleportcamelot:register()
