local internalNpcName = "Magical Items Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1600,
	lookHead = 58,
	lookBody = 68,
	lookLegs = 101,
	lookFeet = 95,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "General goods and paperware for sale!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "football") then
		npcHandler:say("Do you want to buy a football for 111 gold?", npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			local player = Player(creature)
			if player:getMoney() + player:getBankBalance() >= 111 then
				npcHandler:say("Here it is.", npc, creature)
				player:addItem(2990, 1)
				player:removeMoneyBank(111)
			else
				npcHandler:say("You don't have enough money.", npc, creature)
			end
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

-- Basic
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am selling equipment of all kinds. Do you need anything?" })
keywordHandler:addKeyword({ "king" }, StdModule.say, { npcHandler = npcHandler, text = "The king supports Tibia's economy a lot." })
keywordHandler:addAliasKeyword({ "tibianus" })
keywordHandler:addKeyword({ "magic" }, StdModule.say, { npcHandler = npcHandler, text = "Magic? Ask a sorcerer or druid about that." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Gorn. My goods are known all over Tibia." })
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "It is exactly |TIME|. Maybe you want to buy a watch?" })
keywordHandler:addKeyword({ "druids" }, StdModule.say, { npcHandler = npcHandler, text = "This druids are nice people, you will find them in the east of the town." })
keywordHandler:addKeyword({ "knights" }, StdModule.say, { npcHandler = npcHandler, text = "Even the strong knights need my equipment on their travels though Tibia." })
keywordHandler:addKeyword({ "sorcerers" }, StdModule.say, { npcHandler = npcHandler, text = "You can find him in the sorcerer guild." })
keywordHandler:addKeyword({ "elane" }, StdModule.say, { npcHandler = npcHandler, text = "She's the leader of the paladin guild." })
keywordHandler:addKeyword({ "baxter" }, StdModule.say, { npcHandler = npcHandler, text = "Old Baxter was a rowdy, once. In our youth we shared some adventures and women." })
keywordHandler:addKeyword({ "bozo" }, StdModule.say, { npcHandler = npcHandler, text = "Bah! Go away with this bozoguy." })
keywordHandler:addKeyword({ "frodo" }, StdModule.say, { npcHandler = npcHandler, text = "Frodo is a jolly fellow." })
keywordHandler:addKeyword({ "ferumbras" }, StdModule.say, { npcHandler = npcHandler, text = "We had a clash or two in the old days." })
keywordHandler:addKeyword({ "gregor" }, StdModule.say, { npcHandler = npcHandler, text = "Even the strong knights need my equipment on their travels though Tibia." })
keywordHandler:addKeyword({ "lynda" }, StdModule.say, { npcHandler = npcHandler, text = "That's a pretty one." })
keywordHandler:addKeyword({ "mcronald" }, StdModule.say, { npcHandler = npcHandler, text = "I hardly know the McRonalds." })
keywordHandler:addKeyword({ "muriel" }, StdModule.say, { npcHandler = npcHandler, text = "You can find him in the sorcerer guild." })
keywordHandler:addKeyword({ "oswald" }, StdModule.say, { npcHandler = npcHandler, text = "This Oswald has not enough to work and too much time to spread rumours." })
keywordHandler:addKeyword({ "quentin" }, StdModule.say, { npcHandler = npcHandler, text = "He advices newcomers to buy at my store. I love that guy!" })
keywordHandler:addKeyword({ "sam" }, StdModule.say, { npcHandler = npcHandler, text = "Strong as an ox, could armwrestle a minotaur, I bet." })
keywordHandler:addKeyword({ "xodet" }, StdModule.say, { npcHandler = npcHandler, text = "He owns the magic shop here. But be aware: The prices are enormous." })
npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What do you need?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. {Footballs} have to be purchased separately.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {

{ itemName = "TD kooldown-aid", clientId = 36723, buy = 1000000 },
{ itemName = "TD strike enhancement", clientId = 36724, buy = 1000000 },
{ itemName = "TD stamina extension", clientId = 36725, buy = 1000000 },
{ itemName = "TD charm upgrade", clientId = 36726, buy = 1000000 },
{ itemName = "TD wealth duplex", clientId = 36727, buy = 1000000 },
{ itemName = "TD bestiary betterment", clientId = 36728, buy = 1000000 },
{ itemName = "TD fire resilience", clientId = 36729, buy = 1000000 },
{ itemName = "TD ice resilience", clientId = 36730, buy = 1000000 },
{ itemName = "TD earth resilience", clientId = 36731, buy = 1000000 },
{ itemName = "TD energy resilience", clientId = 36732, buy = 1000000 },
{ itemName = "TD holy resilience", clientId = 36733, buy = 1000000 },
{ itemName = "TD death resilience", clientId = 36734, buy = 1000000 },
{ itemName = "TD physical resilience", clientId = 36735, buy = 1000000 },
{ itemName = "TD fire amplification", clientId = 36736, buy = 1000000 },
{ itemName = "TD ice amplification", clientId = 36737, buy = 1000000 },
{ itemName = "TD earth amplification", clientId = 36738, buy = 1000000 },
{ itemName = "TD energy amplification", clientId = 36739, buy = 1000000 },
{ itemName = "TD holy amplification", clientId = 36740, buy = 1000000 },
{ itemName = "TD death amplification", clientId = 36741, buy = 1000000 },
{ itemName = "TD physical amplification", clientId = 36742, buy = 1000000 },


    { itemName = "collar of blue plasma", clientId = 23542, buy = 40000 },
    { itemName = "collar of green plasma", clientId = 23543, buy = 40000 },
    { itemName = "collar of red plasma", clientId = 23544, buy = 40000 },


    { itemName = "ring of green plasma", clientId = 23531, buy = 50000 },
    { itemName = "ring of red plasma", clientId = 23533, buy = 50000 },
    { itemName = "ring of blue plasma", clientId = 23529, buy = 50000 },


    { itemName = "lesser fragment", clientId = 46625, sell = 400000 },
    { itemName = "greater fragment", clientId = 46626, sell = 900000 },
    { itemName = "lesser fragment", clientId = 46625, buy = 4000000 },
    { itemName = "greater fragment", clientId = 46626, buy = 9000000 },
    { itemName = "crusher", clientId = 46627, buy = 100000, count = 10 },
    { itemName = "stamina extension", clientId = 36725, buy = 9000000 },
	{ itemName = "bone fiddle", clientId = 28493, buy = 5000000 },
	{ itemName = "conch shell Horn", clientId = 43863, buy = 5000000 },
	{ itemName = "lit torch", clientId = 34016, buy = 5000000 },
	{ itemName = "scarab ocarina", clientId = 43740, buy = 5000000 },
	{ itemName = "starlight vial", clientId = 25976, buy = 5000000 },
	{ itemName = "sun catcher", clientId = 25977, buy = 5000000 },
	{ itemName = "moon mirror", clientId = 25975, buy = 5000000 },
    { itemName = "carrot cake", clientId = 9087, buy = 3000000 },
	{ itemName = "tropical fried terrorbird", clientId = 9082, buy = 3000000 },
	{ itemName = "veggie casserole", clientId = 9084, buy = 3000000 },
	{ itemName = "shrunken head necklace", clientId = 19357, buy = 10000000 },
	{ itemName = "sneaky stabber of eliteness", clientId = 9594, buy = 20000000 },
	{ itemName = "squeezing gear of girlpower", clientId = 9596, buy = 20000000 },
	{ itemName = "whacking driller of fate", clientId = 9598, buy = 20000000 },
	{ itemName = "Galthen's satchel", clientId = 36813, buy = 10000000 },
	{ itemName = "empty potion flask", clientId = 285, buy = 1000 },
	{ itemName = "magic shield potion", clientId = 35563, buy = 500000 },
	{ itemName = "magic wall rune", clientId = 3180, buy = 116 },
	{ itemName = "heavy crystal fragment", clientId = 27509, buy = 500000 },
	
	
		{ itemName = "exercise axe", clientId = 28553, buy = 347222, subType = 500 },
			{ itemName = "exercise bow", clientId = 28555, buy = 347222, subType = 500 },
			{ itemName = "exercise club", clientId = 28554, buy = 347222, subType = 500 },
			{ itemName = "exercise rod", clientId = 28556, buy = 347222, subType = 500 },
			{ itemName = "exercise sword", clientId = 28552, buy = 347222, subType = 500 },
			{ itemName = "exercise wand", clientId = 28557, buy = 347222, subType = 500 },
			{ itemName = "durable exercise axe", clientId = 35280, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise bow", clientId = 35282, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise club", clientId = 35281, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise rod", clientId = 35283, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise sword", clientId = 35279, buy = 1250000, subType = 1800 },
			{ itemName = "durable exercise wand", clientId = 35284, buy = 1250000, subType = 1800 },
			{ itemName = "lasting exercise axe", clientId = 35286, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise bow", clientId = 35288, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise club", clientId = 35287, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise rod", clientId = 35289, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise sword", clientId = 35285, buy = 10000000, subType = 14400 },
			{ itemName = "lasting exercise wand", clientId = 35290, buy = 10000000, subType = 14400 },


}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
