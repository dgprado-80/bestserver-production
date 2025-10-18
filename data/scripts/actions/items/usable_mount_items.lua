local mountConfig = {
	[23538] = { name = "vortexion", mountId = 94, tameMessage = "You receive the permission to ride a sparkion." },
	[23684] = { name = "neon sparkid", mountId = 98, tameMessage = "You receive the permission to ride a neon sparkid." },
	[23685] = { name = "vortexion", mountId = 99, tameMessage = "You receive the permission to ride a vortexion." },
	[32629] = { name = "haze", mountId = 162, achievement = "Nothing but Hot Air", tameMessage = "You are now versed to ride the haze!" },
	[48424] = { name = "pegasus feather", mountId = 224, tameMessage = "You are now versed to ride the Pegasus!" },
	[50064] = { name = "demon in a green box", mountId = 225, tameMessage = "You are now versed to ride the Primal Demonosaur!" },
}

local usableItemMounts = Action()

function usableItemMounts.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:isPremium() then
		player:sendCancelMessage(RETURNVALUE_YOUNEEDPREMIUMACCOUNT)
		return true
	end

	local mountInfo = mountConfig[item.itemid]
	if not mountInfo then
		player:sendCancelMessage("This item cannot be used.")
		return true
	end

	if player:hasMount(mountInfo.mountId) then
		player:sendCancelMessage("You already have this mount.")
		return true
	end

	player:addMount(mountInfo.mountId)

	if mountInfo.achievement then
		player:addAchievement(mountInfo.achievement)
	end

	-- Adicionar progresso para Vortex Tamer se aplicável
	if table.contains({ 23538, 23684, 23685 }, item.itemid) then
		player:addAchievementProgress("Vortex Tamer", 3)
	end

	player:addAchievement("Natural Born Cowboy")
	player:say(mountInfo.tameMessage, TALKTYPE_MONSTER_SAY)
	item:remove(1)

	return true
end

for itemId, _ in pairs(mountConfig) do
	usableItemMounts:id(itemId)
end

usableItemMounts:register()
