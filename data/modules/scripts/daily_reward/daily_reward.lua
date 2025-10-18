DailyRewardSystem = {
	Developer = "Westwol, Marcosvf132",
	Version = "1.3",
	lastUpdate = "12/10/2020 - 20:30",
	ToDo = "Move this system to CPP",
}

local DAILY_REWARD_COUNT = 7
local REWARD_FROM_SHRINE = 0
local REWARD_FROM_PANEL = 1

local DAILY_REWARD_TYPE_ITEM = 1
local DAILY_REWARD_TYPE_STORAGE = 2
local DAILY_REWARD_TYPE_PREY_REROLL = 3
local DAILY_REWARD_TYPE_XP_BOOST = 4

local DailyRewardItems = { 36725, 9084, 9082, 9087 } -- Lista de itens possíveis

DailyReward = {
	testMode = false,
	serverTimeThreshold = (25 * 60 * 60), -- Counting down 24hours from last server save

	storages = {
		currentDayStreak = 14897,
		nextRewardTime = 14899,
		collectionTokens = 14901,
		staminaBonus = 14902,
		jokerTokens = 14903,
		lastServerSave = 14110,
		avoidDouble = 13412,
		notifyReset = 13413,
		avoidDoubleJoker = 13414,
	},

	strikeBonuses = {
		[1] = { text = "No bonus for first day" },
		[2] = { text = "Allow Hit Point Regeneration" },
		[3] = { text = "Allow Mana Regeneration" },
		[4] = { text = "Stamina Regeneration" },
		[5] = { text = "Double Hit Point Regeneration" },
		[6] = { text = "Double Mana Regeneration" },
		[7] = { text = "Soul Points Regeneration" },
	},

	rewards = {
		[1] = {
			type = DAILY_REWARD_TYPE_ITEM,
			systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
			items = DailyRewardItems, -- Usando a lista de itens possíveis
		},
		[2] = {
			type = DAILY_REWARD_TYPE_ITEM,
			systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
			items = DailyRewardItems,
		},
		[3] = {
			type = DAILY_REWARD_TYPE_PREY_REROLL,
			systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
		},
		[4] = {
			type = DAILY_REWARD_TYPE_ITEM,
			systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
			items = DailyRewardItems,
		},
		[5] = {
			type = DAILY_REWARD_TYPE_PREY_REROLL,
			systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
		},
		[6] = {
			type = DAILY_REWARD_TYPE_ITEM,
			systemType = DAILY_REWARD_SYSTEM_TYPE_ONE,
			items = DailyRewardItems,
		},
		[7] = {
			type = DAILY_REWARD_TYPE_XP_BOOST,
			systemType = DAILY_REWARD_SYSTEM_TYPE_TWO,
		},
	},
}

DailyReward.insertHistory = function(playerId, dayStreak, description)
	return db.query(string.format("INSERT INTO `daily_reward_history`(`player_id`, `daystreak`, `timestamp`, `description`) VALUES (%s, %s, %s, %s)", playerId, dayStreak, os.time(), db.escapeString(description)))
end

DailyReward.retrieveHistoryEntries = function(playerId)
	local player = Player(playerId)
	if not player then
		return false
	end

	local entries = {}
	local resultId = db.storeQuery("SELECT * FROM `daily_reward_history` WHERE `player_id` = " .. player:getGuid() .. " ORDER BY `timestamp` DESC LIMIT 15;")
	if resultId then
		repeat
			local entry = {
				description = Result.getString(resultId, "description"),
				timestamp = Result.getNumber(resultId, "timestamp"),
				daystreak = Result.getNumber(resultId, "daystreak"),
			}
			table.insert(entries, entry)
		until not Result.next(resultId)
		Result.free(resultId)
	end
	return entries
end

DailyReward.pickedReward = function(playerId)
	local player = Player(playerId)
	if not player then
		return false
	end

	-- Reset day streak to 0 when reaches last reward
	if player:getDayStreak() ~= 6 then
		player:setDayStreak(player:getDayStreak() + 1)
	else
		player:setDayStreak(0)
	end

	player:setStreakLevel(player:getStreakLevel() + 1)
	player:setStorageValue(DailyReward.storages.avoidDouble, GetDailyRewardLastServerSave())
	player:setDailyReward(DAILY_REWARD_COLLECTED)
	player:setNextRewardTime(GetDailyRewardLastServerSave() + DailyReward.serverTimeThreshold)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
	return true
end

DailyReward.processReward = function(playerId)
	local player = Player(playerId)
	if not player then
		return false
	end

	-- Verifica se a recompensa já foi coletada hoje
	if player:getStorageValue(DailyReward.storages.avoidDouble) == GetDailyRewardLastServerSave() then
		player:sendTextMessage(MESSAGE_LOOK, "You have already claimed your daily reward today.")
		return false
	end

	local dailyTable = DailyReward.rewards[player:getDayStreak() + 1]
	if not dailyTable then
		player:sendTextMessage(MESSAGE_LOOK, "Something went wrong and we cannot process this request.")
		return false
	end

	if dailyTable.type == DAILY_REWARD_TYPE_ITEM then
		local inbox = player:getStoreInbox()
		if not inbox or #inbox:getItems() > inbox:getMaxCapacity() then
			player:sendTextMessage(MESSAGE_LOOK, "You do not have enough space in your store inbox.")
			return false
		end
		-- Sorteia um item aleatório da lista
		local randomItemId = DailyRewardItems[math.random(#DailyRewardItems)]
		local item = inbox:addItem(randomItemId, 2)
		if item then
			item:setAttribute(ITEM_ATTRIBUTE_STORE, os.time())
			player:sendTextMessage(MESSAGE_LOOK, "You have received your daily reward!")
		end
	elseif dailyTable.type == DAILY_REWARD_TYPE_XP_BOOST then
		player:setXpBoostTime(player:getXpBoostTime() + (60 * 60)) -- 30 minutos de boost
		player:setXpBoostPercent(50)
		player:sendTextMessage(MESSAGE_LOOK, "You have received an XP Boost for 60 minutes!")
	elseif dailyTable.type == DAILY_REWARD_TYPE_PREY_REROLL then
		player:addPreyCards(2)
		player:sendTextMessage(MESSAGE_LOOK, "You have received two Prey Reroll!")
	end

	-- Registrar no histórico
	DailyReward.insertHistory(player:getGuid(), player:getDayStreak(), "Claimed reward no. " .. (player:getDayStreak() + 1) .. ".")
	DailyReward.pickedReward(playerId)
	return true
end

DailyReward.loadDailyReward = function(playerId)
	local player = Player(playerId)
	if not player then
		return false
	end

	DailyReward.processReward(playerId)
	return true
end

DailyReward.init = function(playerId)
	local player = Player(playerId)

	if not player then
		return false
	end

	if player:getJokerTokens() < 3 and tonumber(os.date("%m")) ~= player:getStorageValue(DailyReward.storages.avoidDoubleJoker) then
		player:setStorageValue(DailyReward.storages.avoidDoubleJoker, tonumber(os.date("%m")))
		player:setJokerTokens(player:getJokerTokens() + 1)
	end

	local timeMath = GetDailyRewardLastServerSave() - player:getNextRewardTime()
	if player:getNextRewardTime() < GetDailyRewardLastServerSave() then
		if player:getStorageValue(DailyReward.storages.notifyReset) ~= GetDailyRewardLastServerSave() then
			player:setStorageValue(DailyReward.storages.notifyReset, GetDailyRewardLastServerSave())
			timeMath = math.ceil(timeMath / DailyReward.serverTimeThreshold)
			if player:getJokerTokens() >= timeMath then
				player:setJokerTokens(player:getJokerTokens() - timeMath)
				player:sendTextMessage(MESSAGE_LOOK, "You lost " .. timeMath .. " joker tokens to prevent losing your streak.")
			else
				player:setStreakLevel(0)
				if player:getLastLoginSaved() > 0 then -- message won't appear at first character login
					player:setJokerTokens(-(player:getJokerTokens()))
					player:sendTextMessage(MESSAGE_LOOK, "You just lost your daily reward streak.")
				end
			end
		end
	end

	player:loadDailyRewardBonuses()
end

function onRecvbyte(player, msg, byte)
	DailyReward.loadDailyReward(player:getId())
end