local castlewar = MoveEvent()
function castlewar.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local actionId = item:getActionId()
	local playerId = player:getId()
	if actionId == 38131 then
		if not Castle.opened then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Castle is closed.")
			player:teleportTo(fromPosition, false)
			return true
		end

		local guild = player:getGuild()
		if not guild then
			player:teleportTo(player:getTown():getTemplePosition())
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "How did you get in here? It wasn't even supposed to be here.")
			return false
		end

		Castle.throne(guild)

		local entrace = Castle:entraceCastle(playerId)
		if not entrace then
			player:teleportTo(player:getTown():getTemplePosition())
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end

		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
	elseif actionId == 38130 then 
		player:teleportTo(Position(1300, 1280, 6))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end
castlewar:type("stepin")
castlewar:aid(38130, 38131)
castlewar:register()

local cooldownDuration = 10 -- duracao do cooldown em segundos
local cooldownStorage = 324333 -- valor da storage usada para armazenar o tempo de cooldown

local dominatecastle = MoveEvent()
function dominatecastle.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local guildNameDominate = Castle.getDominanteNameLogin()

	if not guildNameDominate then
		return true
	end
	if player:getStorageValue(cooldownStorage) >= os.time() then
		return player:sendTextMessage(MESSAGE_FAILURE, "You are exhausted.")
	end

	player:setStorageValue(cooldownStorage, os.time() + cooldownDuration)  
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format('Currently the dominant guild is: %s', guildNameDominate))
	position:sendMagicEffect(CONST_ME_HOLYAREA)

	return true
end
dominatecastle:type("stepin")
dominatecastle:aid(38132)
dominatecastle:register()

local movcastle = MoveEvent()
function movcastle.onStepIn(creature, item, position, fromPosition)
local player = creature:getPlayer()
	if not player then
		return true
	end
	
	local guild = player:getGuild()
	if not guild then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not from the Guild that dominates the Castle.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end
	
	local guildName = guild:getName()
	local dominant = Castle:getDominanteNameLogin()

	if guildName ~= dominant then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not from the Guild that dominates the Castle.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	
	return true
end
movcastle:type("stepin")
movcastle:aid(38133,38134)
movcastle:register()

local castleWar = MoveEvent()
function castleWar.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if item:getActionId() == 38135 then
		player:teleportTo(Position(1300, 1280, 6))
		return true
	elseif item:getActionId() == 38136 then
		player:teleportTo(player:getTown():getTemplePosition())
		return true
	elseif item:getActionId() == 38137 then
		player:teleportTo(Position(1384, 1273, 4))
		return true
	end
	return true
end
castleWar:aid(38135, 38136, 38137)
castleWar:register()

local teste = MoveEvent()
function teste.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if Castle:isOpen() then
		player:teleportTo(Position(1300, 1280, 6))
	else
		local guild = player:getGuild()
		if not guild then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not from the Guild that dominates the Castle.")
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end
		
		local guildName = guild:getName()
		local dominant = Castle:getDominanteNameLogin()
		if guildName ~= dominant then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not from the Guild that dominates the Castle.")
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		player:teleportTo(Position(1943, 1345, 7))
	end

	return true
end
teste:type("stepin")
teste:aid(38138)
teste:register()