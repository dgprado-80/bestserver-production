local internalNpcName = "Coco"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1747,
	lookHead = 36,
	lookBody = 53,
	lookLegs = 76,
	lookFeet = 94,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

-- Define as moedas usadas pelo NPC
npcConfig.currencies = {
	currency1 = 48249,
	currency2 = 48250
}

npcConfig.shop = {
    { name = "Candy Bed", clientId = 48449, buy = 300, currency = npcConfig.currencies.currency1 },
    { name = "Candy Bed", clientId = 48450, buy = 300, currency = npcConfig.currencies.currency1 },
    { name = "Candy Cone Chair", clientId = 48427, buy = 100, currency = npcConfig.currencies.currency1 },
    { name = "Candy Cushion", clientId = 48457, buy = 300, currency = npcConfig.currencies.currency1 },
    { name = "Candy-Coated Quiver", clientId = 45644, buy = 2000, currency = npcConfig.currencies.currency1 },
    { name = "Chocolate Table", clientId = 48430, buy = 100, currency = npcConfig.currencies.currency1 },
    { name = "Creamy Grimoire", clientId = 45640, buy = 2000, currency = npcConfig.currencies.currency1 },
    --{ name = "Small Gingerbread House", clientId = , buy = 2000, currency = npcConfig.currencies.currency1 },
    { name = "Biscuit Barrier", clientId = 45643, buy = 3000, currency = npcConfig.currencies.currency2 },
    { name = "Blue Ice Cream Lamp", clientId = 48435, buy = 400, currency = npcConfig.currencies.currency2 },
    { name = "Chocolate Fountain", clientId = 48431, buy = 100, currency = npcConfig.currencies.currency2 },
    { name = "Cocoa Grimoire", clientId = 45639, buy = 2000, currency = npcConfig.currencies.currency2 },
    { name = "Green Ice Cream Lamp", clientId = 48439, buy = 400, currency = npcConfig.currencies.currency2 },
    { name = "Pink Ice Cream Lamp", clientId = 48437, buy = 400, currency = npcConfig.currencies.currency2 },
    { name = "Pop Tart Painting", clientId = 48434, buy = 100, currency = npcConfig.currencies.currency2 },
    { name = "Ring of Temptation", clientId =45642 , buy = 4000, currency = npcConfig.currencies.currency2 }
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	for _, item in ipairs(npcConfig.shop) do
		if item.clientId == itemId then
			local currencyType = item.currency
			if player:removeItem(currencyType, item.buy * amount) then
				npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough tokens.")
			end
			return
		end
	end
end

-- Configurações adicionais do NPC permanecem inalteradas
npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Trading tokens! First-class bargains!" },
	{ text = "Bespoke armor for all vocations! For the cost of some tokens only!" },
	{ text = "Tokens! Bring your tokens!" },
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

npcHandler:setMessage(MESSAGE_GREET, "Hello, i change {milk chocolate coins} for Candy Bed (Headboard), Candy Bed (Footboard), Candy Cone Chair, Candy Cushion, Candy-Coated Quiver, Chocolate Table, Creamy Grimoire, Small Gingerbread House and {dark chocolate coins} for Biscuit Barrier, Blue Ice Cream Lamp, Chocolate Fountain, Cocoa Grimoire, Green Ice Cream Lamp, Pink Ice Cream Lamp, Pop Tart Painting, Ring of Temptation. Just tell {trade}")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registrando a tabela npcConfig
npcType:register(npcConfig)
