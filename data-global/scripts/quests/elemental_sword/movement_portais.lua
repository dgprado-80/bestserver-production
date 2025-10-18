local destination = {
	[25054] = {
		newPos = Position(33001, 33208, 3),
		storage = Storage.ElementalSword.FireSealPre,
		effect = CONST_ME_MORTAREA,
	},
	[25049] = {
		newPos = Position(32992, 33299, 7),
		storage = Storage.ElementalSword.EarthSealPre,
		effect = CONST_ME_MORTAREA,
	},
	[25057] = {
		newPos = Position(33054, 33162, 3),
		storage = Storage.ElementalSword.IceSealPre,
		effect = CONST_ME_MORTAREA,
	},
		[12796] = {
		newPos = Position(33063, 33315, 7),
		storage = Storage.ElementalSword.EnergySealPre,
		effect = CONST_ME_MORTAREA,
	},

}

local entranceTeleport = MoveEvent()

function entranceTeleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = destination[item.itemid]
	if not teleport then
		return
	end
	if item.itemid == 25049 then
		if player:getStorageValue(Storage.ElementalSword.FireSeal) >= 1 then
	end	
	end
	if player:getStorageValue(teleport.storage) >= 1 then
		position:sendMagicEffect(teleport.effect)
		player:teleportTo(teleport.newPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	else
		if item.itemid == 10840 then
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the permission to use this portal.")
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end
		local pos = position
		pos.y = pos.y + 2
		player:teleportTo(pos)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the permission to use this portal.")
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		pos.y = pos.y - 2
		pos:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

entranceTeleport:type("stepin")
entranceTeleport:aid(25041)
entranceTeleport:register()
