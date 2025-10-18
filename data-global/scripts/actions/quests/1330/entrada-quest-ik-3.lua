local dryadPos = {
	-- unique id, destination
	-- entrance
	[47632] = Position(34056, 31699, 9),

	-- exit
	--[47649] = Position(34056, 31699, 9),
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