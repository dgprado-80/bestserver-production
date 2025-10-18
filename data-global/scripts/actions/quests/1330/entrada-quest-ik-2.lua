local dryadPos = {
	-- unique id, destination
	-- entrance
	[47630] = Position(34076, 31694, 9),

	-- exit
	[47649] = Position(34036, 31726, 10),
}


local dryadAction = Action()

function dryadAction.onUse(player, item, target, position, fromPosition)
	local destination = dryadPos[item.uid]
	if not destination then
		return true
	end

	player:teleportTo(destination)
	player:getPosition():sendMagicEffect(14)
	return true
end

for i, x in pairs(dryadPos) do
	dryadAction:uid(i)
end

dryadAction:register()