local config = {
	items = { -- Armas com 64.400 cargas (primeiro uso)
		{ id = 35284, charges = 64400 },
		{ id = 35279, charges = 64400 },
		{ id = 35281, charges = 64400 },
		{ id = 35283, charges = 64400 },
		{ id = 35282, charges = 64400 },
		{ id = 35280, charges = 64400 },
		{ id = 44066, charges = 64400 },
	},
	subsequentItems = { -- Armas com 14.400 cargas (usos subsequentes)
		{ id = 35290, charges = 14400 },
		{ id = 35285, charges = 14400 },
		{ id = 35287, charges = 14400 },
		{ id = 35289, charges = 14400 },
		{ id = 35288, charges = 14400 },
		{ id = 35286, charges = 14400 },
		{ id = 44067, charges = 14400 },
	},
	storage = 65003, -- Storage válida para o recebimento inicial
	weeklyStorage = 65004, -- Storage válida para controle semanal
	weeklyCooldown = 7 * 24 * 60 * 60 -- 7 dias em segundos
}

local function sendExerciseRewardModal(player, isSubsequent)
	local itemList = isSubsequent and config.subsequentItems or config.items
	local window = ModalWindow({
		title = "Exercise Reward",
		message = "Choose an item",
	})

	for _, it in pairs(itemList) do
		local iType = ItemType(it.id)
		if iType then
			window:addChoice(iType:getName(), function(player, button, choice)
				if button.name ~= "Select" then
					return true
				end

				local inbox = player:getStoreInbox()
				local inboxItems = inbox:getItems()
				if inbox and #inboxItems < inbox:getMaxCapacity() and player:getFreeCapacity() >= iType:getWeight() then
					local item = inbox:addItem(it.id, it.charges)
					if item then
						item:setActionId(IMMOVABLE_ACTION_ID)
						item:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())
						item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, string.format("You won this exercise weapon as a reward to be a %s player. Use it in a dummy!\nHave a nice game.", configManager.getString(configKeys.SERVER_NAME)))
					else
						player:sendTextMessage(MESSAGE_LOOK, "You need to have capacity and empty slots to receive.")
						return
					end
					player:sendTextMessage(MESSAGE_LOOK, string.format("Congratulations, you received a %s with %i charges in your store inbox.", iType:getName(), it.charges))

					if isSubsequent then
						player:setStorageValue(config.weeklyStorage, os.time() + config.weeklyCooldown)
					else
						player:setStorageValue(config.storage, 1)
					end
				else
					player:sendTextMessage(MESSAGE_LOOK, "You need to have capacity and empty slots to receive.")
				end
			end)
		end
	end

	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
end

local exerciseRewardModal = TalkAction("!reward")
function exerciseRewardModal.onSay(player, words, param)
	if not configManager.getBoolean(configKeys.TOGGLE_RECEIVE_REWARD) or player:getTown():getId() < TOWNS_LIST.AB_DENDRIEL then
		return true
	end

	if player:getStorageValue(config.storage) < 1 then
		sendExerciseRewardModal(player, false) -- Recompensa inicial
		return true
	end

	local weeklyCooldown = player:getStorageValue(config.weeklyStorage)
	if weeklyCooldown > os.time() then
		local timeLeft = weeklyCooldown - os.time()
		player:sendTextMessage(MESSAGE_LOOK, string.format("You need to wait " .. Game.getTimeInWords(timeLeft) .. " to receive another reward."))
		return true
	end

	sendExerciseRewardModal(player, true) -- Recompensas subsequentes
	return true
end

exerciseRewardModal:separator(" ")
exerciseRewardModal:groupType("normal")
exerciseRewardModal:register()