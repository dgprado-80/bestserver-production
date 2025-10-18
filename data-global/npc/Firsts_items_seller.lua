local internalNpcName = "Firsts Items Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 3

npcConfig.outfit = {
	lookType = 1602,
	lookHead = 100,
	lookBody = 100,
	lookLegs = 119,
	lookFeet = 115,
	lookAddons = 2
}

npcConfig.flags = {
	floorchange = false
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
	return true
end

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am a travelling trader. I don't buy everything, though. And not from everyone, for that matter." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Rashid, son of the desert." })
keywordHandler:addKeyword({ "offers" }, StdModule.say, { npcHandler = npcHandler, text = "Of course, old friend. You can also browse only armor, legs, shields, helmets, boots, weapons, enchanted weapons, jewelry or miscellaneous stuff." })
keywordHandler:addKeyword({ "ab'dendriel" }, StdModule.say, { npcHandler = npcHandler, text = "Elves... I don't really trust them. All this talk about nature and flowers and treehugging... I'm sure there's some wicked scheme behind all this." })
keywordHandler:addKeyword({ "desert" }, StdModule.say, { npcHandler = npcHandler, text = "My beloved hometown! Ah, the sweet scent of the desert sands, the perfect shape of the pyramids... stunningly beautiful." })
keywordHandler:addKeyword({ "carlin" }, StdModule.say, { npcHandler = npcHandler, text = "I have to go to Carlin once in a while, since the queen wishes to see my exclusive wares in regular intervals." })
keywordHandler:addKeyword({ "cormaya" }, StdModule.say, { npcHandler = npcHandler, text = "Cormaya? Not a good place to make business, it's way too far and small." })
keywordHandler:addKeyword({ "darashia" }, StdModule.say, { npcHandler = npcHandler, text = "It's not the real thing, but almost as good. The merchants there claim ridiculous prices, which is fine for my own business." })
keywordHandler:addKeyword({ "edron" }, StdModule.say, { npcHandler = npcHandler, text = "Ah yes, Edron! Such a lovely and quiet island! I usually make some nice business there." })
keywordHandler:addKeyword({ "fibula" }, StdModule.say, { npcHandler = npcHandler, text = "Too few customers there, it's not worth the trip." })
keywordHandler:addKeyword({ "greenshore" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "kazordoon" }, StdModule.say, { npcHandler = npcHandler, text = "I don't like being underground much. I also tend to get lost in these labyrinthine dwarven tunnels, so I rather avoid them." })
keywordHandler:addKeyword({ "liberty bay" }, StdModule.say, { npcHandler = npcHandler, text = "When you avoid the slums, it's a really pretty city. Almost as pretty as the governor's daughter." })
keywordHandler:addKeyword({ "northport" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "port hope" }, StdModule.say, { npcHandler = npcHandler, text = "I like the settlement itself, but I don't set my foot into the jungle. Have you seen the size of these centipedes??" })
keywordHandler:addKeyword({ "senja" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "svargrond" }, StdModule.say, { npcHandler = npcHandler, text = "I wish it was a little bit warmer there, but with a good mug of barbarian mead in your tummy everything gets a lot cosier." })
keywordHandler:addKeyword({ "thais" }, StdModule.say, { npcHandler = npcHandler, text = "I feel uncomfortable and rather unsafe in Thais, so I don't really travel there." })
keywordHandler:addKeyword({ "vega" }, StdModule.say, { npcHandler = npcHandler, text = "Um... I don't think so." })
keywordHandler:addKeyword({ "venore" }, StdModule.say, { npcHandler = npcHandler, text = "Although it's the flourishing trade centre of Tibia, I don't like going there. Too much competition for my taste." })
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "It's almost time to journey on." })
keywordHandler:addKeyword({ "king" }, StdModule.say, { npcHandler = npcHandler, text = "Kings, queens, emperors and kaliphs... everyone claims to be different and unique, but actually it's the same thing everywhere." })

npcHandler:setMessage(MESSAGE_GREET, "Ah, a customer! Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, may the winds guide your way.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Take all the time you need to decide what you want!")

local function onTradeRequest(npc, creature)
	if Player(creature):getStorageValue(Storage.TravellingTrader.Mission07) ~= 1 then
		npcHandler:say('Sorry, but you do not belong to my exclusive customers. I have to make sure that I can trust in the quality of your wares.', npc, creature)
		return false
	end

	return true
end

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {

-- sell Items

{ itemName = "lasting exercise club", clientId = 35287, buy =  7500000 },
{ itemName = "lasting exercise axe", clientId = 35286, buy =  7500000 },
{ itemName = "lasting exercise sword", clientId = 35285, buy =  7500000 },
{ itemName = "lasting exercise bow", clientId = 35288, buy =  7500000 },
{ itemName = "lasting exercise shield", clientId = 44067, buy =  7500000 },
{ itemName = "lasting exercise wand", clientId = 35290, buy =  7500000 },
{ itemName = "lasting exercise rod", clientId = 35289, buy =  7500000 },


--Alesar--
{ itemName = "serpent sword", clientId = 3297, buy =  30000 },
{ itemName = "black shield", clientId = 3429, buy =  4000 },
{ itemName = "bonebreaker", clientId = 7428, buy =  50000 },
{ itemName = "dragon hammer", clientId = 3322, buy =  10000 },
{ itemName = "dreaded cleaver", clientId = 7419, buy =  75000 },
{ itemName = "giant sword", clientId = 3281, buy =  85000 },
{ itemName = "haunted blade", clientId = 7407, buy =  40000 },
{ itemName = "knight armor", clientId = 3370, buy =  25000 },
{ itemName = "knight axe", clientId = 3318, buy =  10000 },
{ itemName = "knight legs", clientId = 3371, buy =  25000 },
{ itemName = "mystic turban", clientId = 3574, buy =  750 },
{ itemName = "onyx flail", clientId = 7421, buy =  110000 },
{ itemName = "ornamented axe", clientId = 7411, buy =  100000 },
{ itemName = "poison dagger", clientId = 3299, buy =  250 },
{ itemName = "scimitar", clientId = 3307, buy =  750 },
{ itemName = "skull staff", clientId = 3324, buy =  30000 },
{ itemName = "strange helmet", clientId = 3373, buy =  2500 },
{ itemName = "titan axe", clientId = 7413, buy =  20000 },
{ itemName = "tower shield", clientId = 3428, buy =  40000 },
{ itemName = "vampire shield", clientId = 3434, buy =  75000 },
{ itemName = "warrior helmet", clientId = 3369, buy =  25000 },

--Haroun--
{ itemName = "axe ring", clientId = 3092, buy =  500 },
{ itemName = "bronze amulet", clientId = 3056, buy =  250, count = 200 },
{ itemName = "club ring", clientId = 3093, buy =  500 },
{ itemName = "elven amulet", clientId = 3082, buy =  500, count = 50 },
{ itemName = "garlic necklace", clientId = 3083, buy =  250 },
{ itemName = "life crystal", clientId = 4840, buy =  250 },
{ itemName = "magic light wand", clientId = 3046, buy =  175 },
{ itemName = "mind stone", clientId = 3062, buy =  500 },
{ itemName = "orb", clientId = 3060, buy =  3750 },
{ itemName = "power ring", clientId = 3050, buy =  250 },
{ itemName = "stealth ring", clientId = 3049, buy =  1000 },
{ itemName = "stone skin amulet", clientId = 3081, buy =  2500, count = 5 },
{ itemName = "sword ring", clientId = 3091, buy =  500 },
{ itemName = "wand of cosmic energy", clientId = 3073, buy =  10000 },
{ itemName = "wand of decay", clientId = 3072, buy =  5000 },
{ itemName = "wand of defiance", clientId = 16096, buy =  32500 },
{ itemName = "wand of draconia", clientId = 8093, buy =  7500 },
{ itemName = "wand of dragonbreath", clientId = 3075, buy =  1000 },
{ itemName = "wand of everblazing", clientId = 16115, buy =  30000 },
{ itemName = "wand of inferno", clientId = 3071, buy =  15000 },
{ itemName = "wand of starstorm", clientId = 8092, buy =  18000 },
{ itemName = "wand of voodoo", clientId = 8094, buy =  22000 },
{ itemName = "wand of vortex", clientId = 3074, buy =  500 },



--nah'bob--
{ itemName = "angelic axe", clientId = 7436, buy =  25000 },
{ itemName = "blue robe", clientId = 3567, buy =  50000 },
{ itemName = "bonelord shield", clientId = 3418, buy =  6000 },
{ itemName = "boots of haste", clientId = 3079, buy =  150000 },
{ itemName = "broadsword", clientId = 3301, buy =  2500 },
{ itemName = "butcher's axe", clientId = 7412, buy =  90000 },
{ itemName = "crown armor", clientId = 3381, buy =  60000 },
{ itemName = "crown helmet", clientId = 3385, buy =  12500 },
{ itemName = "crown legs", clientId = 3382, buy =  60000 },
{ itemName = "crown shield", clientId = 3419, buy =  40000 },
{ itemName = "crusader helmet", clientId = 3391, buy =  30000 },
{ itemName = "dragon lance", clientId = 3302, buy =  45000 },
{ itemName = "dragon shield", clientId = 3416, buy =  20000 },
{ itemName = "fire axe", clientId = 3320, buy =  40000 },
{ itemName = "glorious axe", clientId = 7454, buy =  15000 },
{ itemName = "guardian shield", clientId = 3415, buy =  10000 },
{ itemName = "ice rapier", clientId = 3284, buy =  5000 },
{ itemName = "noble armor", clientId = 3380, buy =  4500 },
{ itemName = "obsidian lance", clientId = 3313, buy =  2500 },
{ itemName = "phoenix shield", clientId = 3439, buy =  80000 },
{ itemName = "royal helmet", clientId = 3392, buy =  150000 },
{ itemName = "shadow sceptre", clientId = 7451, buy =  50000 },
{ itemName = "thaian sword", clientId = 7391, buy =  80000 },
{ itemName = "war hammer", clientId = 3279, buy =  6000 },

--yaman--
{ itemName = "muck rod", clientId = 16117, buy =  30000 },
{ itemName = "mysterious fetish", clientId = 3078, buy =  250 },
{ itemName = "necrotic rod", clientId = 3069, buy =  5000 },
{ itemName = "northwind rod", clientId = 8083, buy =  7500 },
{ itemName = "protection amulet", clientId = 3084, buy =  500, count = 250 },
{ itemName = "ring of healing", clientId = 3098, buy =  500 },
{ itemName = "silver amulet", clientId = 3054, buy =  250, count = 200 },
{ itemName = "snakebite rod", clientId = 3066, buy =  500 },
{ itemName = "springsprout rod", clientId = 8084, buy =  18000 },
{ itemName = "terra rod", clientId = 3065, buy =  10000 },
{ itemName = "time ring", clientId = 3053, buy =  500 },
{ itemName = "underworld rod", clientId = 8082, buy =  22000 },

{ itemName = "draken wristbands", clientId = 11659, buy =  2150 },
{ itemName = "twin hooks", clientId = 10392, buy =  2500 },
{ itemName = "zaoan halberd", clientId = 10406, buy =  2500 },
{ itemName = "zaoan shoes", clientId = 10386, buy =  25000 },
{ itemName = "drachaku", clientId = 10391, buy =  50000 },
{ itemName = "drakinata", clientId = 10388, buy =  50000 },
{ itemName = "zaoan armor", clientId = 10384, buy =  70000 },
{ itemName = "zaoan legs", clientId = 10387, buy =  70000 },
{ itemName = "sai", clientId = 10389, buy =  82500 },
{ itemName = "twiceslicer", clientId = 11657, buy =  140000 },
{ itemName = "zaoan sword", clientId = 10390, buy =  150000 },
{ itemName = "guardian boots", clientId = 10323, buy =  175000 },
{ itemName = "draken boots", clientId = 4033, buy =  200000 },
{ itemName = "zaoan helmet", clientId = 10385, buy =  225000 },
{ itemName = "Elite Draken Mail", clientId = 11651, buy =  250000 },

--alexander--
{ itemName = "spellbook of enlightenment", clientId = 8072, buy =  20000 },
{ itemName = "spellbook of lost souls", clientId = 8075, buy =  95000 },
{ itemName = "spellbook of mind control", clientId = 8074, buy =  65000 },
{ itemName = "spellbook of warding", clientId = 8073, buy =  40000 },

--rashid--
{ itemName = "abyss hammer", clientId = 7414, buy =  100000 },
{ itemName = "albino plate", clientId = 19358, buy =  7500 },
{ itemName = "amber staff", clientId = 7426, buy =  40000 },
{ itemName = "ancient amulet", clientId = 3025, buy =  1000 },
{ itemName = "assassin dagger", clientId = 7404, buy =  100000 },
{ itemName = "bandana", clientId = 5917, buy =  750 },
{ itemName = "beastslayer axe", clientId = 3344, buy =  7500 },
{ itemName = "beetle necklace", clientId = 10457, buy =  7500 },
{ itemName = "berserker", clientId = 7403, buy =  200000 },
{ itemName = "blacksteel sword", clientId = 7406, buy =  30000 },
{ itemName = "blessed sceptre", clientId = 7429, buy =  200000 },
{ itemName = "bone shield", clientId = 3441, buy =  400 },
{ itemName = "bonelord helmet", clientId = 3408, buy =  37500 },
{ itemName = "brutetamer's staff", clientId = 7379, buy =  7500 },

{ itemName = "cobra crown", clientId = 11674, buy =  250000 },

{ itemName = "composite hornbow", clientId = 8027, buy =  125000 },
{ itemName = "cranial basher", clientId = 7415, buy =  150000 },
{ itemName = "crocodile boots", clientId = 3556, buy =  5000 },
{ itemName = "crystal crossbow", clientId = 16163, buy =  175000 },
{ itemName = "crystal mace", clientId = 3333, buy =  60000 },
{ itemName = "crystal necklace", clientId = 3008, buy =  2000 },
{ itemName = "crystal ring", clientId = 3007, buy =  1250 },
{ itemName = "crystal sword", clientId = 7449, buy =  3000 },
{ itemName = "crystalline armor", clientId = 8050, buy =  80000 },
{ itemName = "daramian mace", clientId = 3327, buy =  550 },
{ itemName = "daramian waraxe", clientId = 3328, buy =  5000 },
{ itemName = "dark shield", clientId = 3421, buy =  2000 },
{ itemName = "death ring", clientId = 6299, buy =  5000 },
{ itemName = "demon shield", clientId = 3420, buy =  150000 },
{ itemName = "demonbone amulet", clientId = 3019, buy =  160000 },
{ itemName = "demonrage sword", clientId = 7382, buy =  180000 },
{ itemName = "devil helmet", clientId = 3356, buy =  5000 },
{ itemName = "diamond sceptre", clientId = 7387, buy =  15000 },
{ itemName = "divine plate", clientId = 8057, buy =  275000 },

{ itemName = "dragon scale mail", clientId = 3386, buy =  200000 },
{ itemName = "dragon slayer", clientId = 7402, buy =  75000 },
{ itemName = "dragonbone staff", clientId = 7430, buy =  15000 },
{ itemName = "elvish bow", clientId = 7438, buy =  10000 },
{ itemName = "emerald bangle", clientId = 3010, buy =  4000 },
{ itemName = "epee", clientId = 3326, buy =  40000 },
{ itemName = "flower dress", clientId = 9015, buy =  5000 },
{ itemName = "flower wreath", clientId = 9013, buy =  2500 },
{ itemName = "fur boots", clientId = 7457, buy =  10000 },
{ itemName = "furry club", clientId = 7432, buy =  5000 },
{ itemName = "glacier amulet", clientId = 815, buy =  7500 },
{ itemName = "glacier kilt", clientId = 823, buy =  55000 },
{ itemName = "glacier mask", clientId = 829, buy =  12500 },
{ itemName = "glacier robe", clientId = 824, buy =  55000 },
{ itemName = "glacier shoes", clientId = 819, buy =  12500 },
{ itemName = "gold ring", clientId = 3063, buy =  40000 },
{ itemName = "goo shell", clientId = 19372, buy =  20000 },
{ itemName = "griffin shield", clientId = 3433, buy =  15000 },
{ itemName = "guardian halberd", clientId = 3315, buy =  55000 },
{ itemName = "hammer of wrath", clientId = 3332, buy =  150000 },
{ itemName = "headchopper", clientId = 7380, buy =  30000 },
{ itemName = "heavy mace", clientId = 3340, buy =  250000 },
{ itemName = "heavy machete", clientId = 3330, buy =  450 },
{ itemName = "heavy trident", clientId = 12683, buy =  10000 },
{ itemName = "helmet of the lost", clientId = 17852, buy =  10000 },
{ itemName = "heroic axe", clientId = 7389, buy =  150000 },
{ itemName = "hibiscus dress", clientId = 8045, buy =  15000 },
{ itemName = "hieroglyph banner", clientId = 12482, buy =  2500 },
{ itemName = "horn", clientId = 19359, buy =  1500 },
{ itemName = "jade hammer", clientId = 7422, buy =  125000 },
{ itemName = "krimhorn helmet", clientId = 7461, buy =  1000 },
{ itemName = "lavos armor", clientId = 8049, buy =  80000 },
{ itemName = "leaf legs", clientId = 9014, buy =  2500 },
{ itemName = "leopard armor", clientId = 3404, buy =  5000 },
{ itemName = "leviathan's amulet", clientId = 9303, buy =  15000 },
{ itemName = "light shovel", clientId = 5710, buy =  1500 },
{ itemName = "lightning boots", clientId = 820, buy =  12500 },
{ itemName = "lightning headband", clientId = 828, buy =  12500 },
{ itemName = "lightning legs", clientId = 822, buy =  55000 },
{ itemName = "lightning pendant", clientId = 816, buy =  7500 },
{ itemName = "lightning robe", clientId = 825, buy =  55000 },
{ itemName = "lunar staff", clientId = 7424, buy =  25000 },
{ itemName = "magic plate armor", clientId = 3366, buy =  450000 },
{ itemName = "magma amulet", clientId = 817, buy =  7500 },
{ itemName = "magma boots", clientId = 818, buy =  12500 },
{ itemName = "magma coat", clientId = 826, buy =  55000 },
{ itemName = "magma legs", clientId = 821, buy =  55000 },
{ itemName = "magma monocle", clientId = 827, buy =  12500 },
{ itemName = "mammoth fur cape", clientId = 7463, buy =  30000 },
{ itemName = "mammoth fur shorts", clientId = 7464, buy =  4250 },
{ itemName = "mammoth whopper", clientId = 7381, buy =  750 },
{ itemName = "mastermind shield", clientId = 3414, buy =  125000 },
{ itemName = "medusa shield", clientId = 3436, buy =  22500 },
{ itemName = "mercenary sword", clientId = 7386, buy =  60000 },
{ itemName = "model ship", clientId = 2994, buy =  5000 },
{ itemName = "mycological bow", clientId = 16164, buy =  175000 },
{ itemName = "mystic blade", clientId = 7384, buy =  150000 },
{ itemName = "naginata", clientId = 3314, buy =  10000 },
{ itemName = "nightmare blade", clientId = 7418, buy =  175000 },
{ itemName = "noble axe", clientId = 7456, buy =  50000 },
{ itemName = "platinum amulet", clientId = 3055, buy =  12500 },
{ itemName = "ragnir helmet", clientId = 7462, buy =  2000 },
{ itemName = "relic sword", clientId = 7383, buy =  125000 },
{ itemName = "royal axe", clientId = 7434, buy =  200000 },
{ itemName = "ruthless axe", clientId = 6553, buy =  225000 },
{ itemName = "skull helmet", clientId = 5741, buy =  200000 },
{ itemName = "skullcracker armor", clientId = 8061, buy =  90000 },
{ itemName = "spiked squelcher", clientId = 7452, buy =  25000 },
{ itemName = "steel boots", clientId = 3554, buy =  150000 },
{ itemName = "swamplair armor", clientId = 8052, buy =  80000 },
{ itemName = "taurus mace", clientId = 7425, buy =  2500 },
{ itemName = "tempest shield", clientId = 3442, buy =  175000 },
{ itemName = "terra amulet", clientId = 814, buy =  7500 },
{ itemName = "terra boots", clientId = 813, buy =  12500 },
{ itemName = "terra hood", clientId = 830, buy =  12500 },
{ itemName = "terra legs", clientId = 812, buy =  55000 },
{ itemName = "terra mantle", clientId = 811, buy =  55000 },
{ itemName = "the justice seeker", clientId = 7390, buy =  200000 },
{ itemName = "tortoise shield", clientId = 6131, buy =  750 },
{ itemName = "vile axe", clientId = 7388, buy =  150000 },
{ itemName = "voodoo doll", clientId = 3002, buy =  2000 },
{ itemName = "war axe", clientId = 3342, buy =  60000 },
{ itemName = "war horn", clientId = 2958, buy =  40000 },
{ itemName = "witch hat", clientId = 9653, buy =  25000 },
{ itemName = "wyvern fang", clientId = 7408, buy =  7500 }
	
	
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
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
