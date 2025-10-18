local internalNpcName = "The Forgemaster"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 247, -- Ajuste o lookType conforme necessário
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Bring me your weapons and materials, and I shall forge them into something greater!" },
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

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

-- Função para verificar se o jogador tem os itens necessários
local function hasRequiredItems(player, baseItemName)
	return player:getItemCount(baseItemName) >= 1 and
	       player:getItemCount("Vexclaw Talon") >= 100 and
	       player:getItemCount("Demonic Matter") >= 500 and
	       player:getItemCount("Demon Horn") >= 50 and
	       player:getItemCount("Demonic Finger") >= 1 and
	       player:getItemCount("Demonic Essence") >= 350 and
	       player:getItemCount("Flask of Demonic Blood") >= 350 and
	       player:getItemCount("Skin of Gralvalon") >= 1
end

-- Função para remover os itens necessários do jogador
local function removeRequiredItems(player, baseItemName)
	player:removeItem(baseItemName, 1)
	player:removeItem("Vexclaw Talon", 100)
	player:removeItem("Demonic Matter", 500)
	player:removeItem("Demon Horn", 50)
	player:removeItem("Demonic Finger", 1)
	player:removeItem("Demonic Essence", 350)
	player:removeItem("Flask of Demonic Blood", 350)
	player:removeItem("Skin of Gralvalon", 1)
end

-- Função para criar o item Rending Inferniarch
local function createRendingInferniarch(player, baseItemName, rendingItemName)
	if hasRequiredItems(player, baseItemName) then
		removeRequiredItems(player, baseItemName)
		player:addItem(rendingItemName, 1)
		return true
	end
	return false
end

-- Tabela de itens base e seus upgrades
local baseItems = {
	["arbalest"] = {baseName = "Inferniarch Arbalest", rendingName = "Rending Inferniarch Arbalest"},
	["battleaxe"] = {baseName = "Inferniarch Battleaxe", rendingName = "Rending Inferniarch Battleaxe"},
	["blade"] = {baseName = "Inferniarch Blade", rendingName = "Rending Inferniarch Blade"},
	["bow"] = {baseName = "Inferniarch Bow", rendingName = "Rending Inferniarch Bow"},
	["claws"] = {baseName = "Inferniarch Claws", rendingName = "Rending Inferniarch Claws"},
	["flail"] = {baseName = "Inferniarch Flail", rendingName = "Rending Inferniarch Flail"},
	["greataxe"] = {baseName = "Inferniarch Greataxe", rendingName = "Rending Inferniarch Greataxe"},
	["rod"] = {baseName = "Inferniarch Rod", rendingName = "Rending Inferniarch Rod"},
	["slayer"] = {baseName = "Inferniarch Slayer", rendingName = "Rending Inferniarch Slayer"},
	["wand"] = {baseName = "Inferniarch Wand", rendingName = "Rending Inferniarch Wand"},
	["warhammer"] = {baseName = "Inferniarch Warhammer", rendingName = "Rending Inferniarch Warhammer"},
}

-- Variável para armazenar o tipo de arma escolhido
local chosenWeaponType = {}

-- Callback para o diálogo inicial
local function greetCallback(npc, creature)
	local player = Player(creature)
	npcHandler:say("What brings you here this time, do you want to craft a weapon in the forge?", npc, creature)
	npcHandler:setTopic(player:getId(), 0) -- Define o tópico inicial como 0
	return true
end

-- Callback para o comando "Craft"
local function craftCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
	local topic = npcHandler:getTopic(playerId)

	if topic == 0 then
		if string.lower(message) == "craft" then
			-- Combina as duas mensagens em uma única chamada
			npcHandler:say("If you have the ingredients, I can channel the ancient demonic power of this place into {arbalest}, {battleaxe}, {blade}, {bow}, {claws}, {flail}, {greataxe}, {rod}, {slayer}, {wand}, {warhammer}. But please know that this is only possible for unfused equipment that has not been treated at the Exaltation Forge.", npc, creature)
			npcHandler:setTopic(playerId, 1) -- Define o tópico para 1 (aguardando tipo de arma)
		end
	elseif topic == 1 then
		local itemType = string.lower(message)
		if baseItems[itemType] then
			chosenWeaponType[playerId] = itemType -- Armazena o tipo de arma escolhido
			npcHandler:say("Do you want to craft an inferniarch " .. itemType .. " that is destined to deal critical hits, steal the life force of your enemies or absorb the mana of your foes?", npc, creature)
			npcHandler:setTopic(playerId, 2) -- Define o tópico para 2 (aguardando confirmação)
		else
			npcHandler:say("I can only craft Inferniarch weapons. Please choose a valid weapon type.", npc, creature)
		end
	elseif topic == 2 then
		if string.lower(message) == "yes" then
			local itemType = chosenWeaponType[playerId] -- Recupera o tipo de arma escolhido
			if itemType and baseItems[itemType] then
				local baseItemName = baseItems[itemType].baseName
				local rendingItemName = baseItems[itemType].rendingName
				if createRendingInferniarch(player, baseItemName, rendingItemName) then
					npcHandler:say("Here you go. Your weapon has been forged into a " .. rendingItemName .. "!", npc, creature)
				else
					npcHandler:say("You do not have the required items to forge this weapon.", npc, creature)
				end
			else
				npcHandler:say("Invalid weapon type. Please start over.", npc, creature)
			end
			npcHandler:setTopic(playerId, 0) -- Reseta o tópico para 0
		else
			npcHandler:say("Very well, come back when you are ready.", npc, creature)
			npcHandler:setTopic(playerId, 0) -- Reseta o tópico para 0
		end
	end
end

-- Registrando os callbacks
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, craftCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)