local barconagPos = {
	-- unique id, destination
	-- entrance
	[35632] = Position(33790, 32868, 7),

	-- exit
	[35633] = Position(33650, 32744, 7),
}


local dryadAction = Action()

function dryadAction.onUse(player, item, target, position, fromPosition)
	local destination = barconagPos[item.uid]
	if not destination then
		return true
	end

	player:teleportTo(destination)
	player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
	return true
end

for i, x in pairs(barconagPos) do
	dryadAction:uid(i)
end

dryadAction:register()