local internalNpcName = "Santa Claus"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 0,
	lookBody = 112,
	lookLegs = 93,
	lookFeet = 95,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

local normalItems = {
	{ 7439, 7440, 7443 },
	{ 3599, 6507 },
	{ 3599, 6508 },
	{ 3599, 6506 },
	{ 3599, 2995 },
	{ 3599, 2992 },
	{ 3051, 3097, 3098 },
	{ 10310 },
	{ 3039 },
	{ 3036 },
}

local semiRareItems = {
	{ 3057 },
	{ 9040 },
	{ 9058 },
	{ 5080 },
	{ 47976 },
	{ 47978 },
	{ 49163 },
	{ 43895 },
	{ 49526 },
	{ 49524 },
	{ 49530 },
	{ 49520 },
	{ 49528 },
	{ 49529 },
}

local rareItems = {
	{ 2991 },
	{ 5919 },
	{ 6567 },
	{ 10338 },
	{ 10339 },
	{ 6566 },
	{ 2993 },
}

local veryRareItems = {
	{ 3570 },
	{ 3001 },
	{ 9604 },
	{ 5804 },
	{ 28897 },
	{ 44740 },
	{ 22120 },
	{ 31633 },
}

local function getReward(level)
	local rewardTable = {}
	local random = math.random(100)
	if random <= 10 and level >= 300 then
		rewardTable = veryRareItems
	elseif random <= 30 and level >= 300 then
		rewardTable = rareItems
	elseif random <= 70 then
		rewardTable = semiRareItems
	else
		rewardTable = normalItems
	end

	local rewardItem = rewardTable[math.random(#rewardTable)]
	return rewardItem
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)

	if MsgContains(message, "present") then
		if player:getStorageValue(840293) == 1 then
			npcHandler:say("You can't get another present.", npc, creature)
			return false
		end

		if player:getLevel() < 300 then
			npcHandler:say("Characters with level 300 or higher can receive better presents! Would you like to receive a regular present now or wait until you reach level 300 for a chance at better rewards? Say 'yes' to receive a regular present or 'no' to wait.", npc, creature)
			return true
		end

		local reward = getReward(player:getLevel())
		local present = player:addItem(6510)
		if not present then
			npcHandler:say("Something went wrong, please try again later.", npc, creature)
			return false
		end

		local cont = Container(present:getUniqueId())
		local count = 1

		for i = 1, #reward do
			if reward[i] == 2992 or reward[i] == 3599 then
				count = 10
			end
			cont:addItem(reward[i], count)
		end

		player:setStorageValue(840293, 1)
		npcHandler:say("Merry Christmas!", npc, creature)
		return true
	end

	if MsgContains(message, "yes") and player:getLevel() < 300 then
		local reward = getReward(player:getLevel())
		local present = player:addItem(6510)
		if not present then
			npcHandler:say("Something went wrong, please try again later.", npc, creature)
			return false
		end

		local cont = Container(present:getUniqueId())
		local count = 1

		for i = 1, #reward do
			if reward[i] == 2992 or reward[i] == 3599 then
				count = 10
			end
			cont:addItem(reward[i], count)
		end

		player:setStorageValue(840293, 1)
		npcHandler:say("Enjoy your present!", npc, creature)
	end

	if MsgContains(message, "no") and player:getLevel() < 300 then
		npcHandler:say("Very well, come back when you reach level 300 for a better reward!", npc, creature)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
