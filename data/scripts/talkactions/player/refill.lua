local refill = TalkAction("!refill")

local chargeItem = {
	["pendulet"] = { noChargeID = 29429, ChargeID = 30344, cost = 3000000 }, -- 20k Gold Coins
	["sleep shawl"] = { noChargeID = 29428, ChargeID = 30342, cost = 3000000 },
	["blister ring"] = { noChargeID = 31621, ChargeID = 31557, cost = 3000000 },
	["theurgic amulet"] = { noChargeID = 30401, ChargeID = 30403, cost = 3000000 },
	["ring of souls"] = { noChargeID = 32636, ChargeID = 32621, cost = 3000000 },
	["turtle amulet"] = { noChargeID = 39235, ChargeID = 39233, cost = 3000000 },
	["spiritthorn ring"] = { noChargeID = 39179, ChargeID = 39177, cost = 3000000 }, -- 50k Gold Coins
	["alicorn ring"] = { noChargeID = 39182, ChargeID = 39180, cost = 3000000 },
	["arcanomancer sigil"] = { noChargeID = 39185, ChargeID = 39183, cost = 3000000 },
	["arboreal ring"] = { noChargeID = 39188, ChargeID = 39187, cost = 3000000 },
}

local function hasCapacityToChange(player, message)
	local itemWeight = 0
	local itemCount = 0

	for itemName, itemData in pairs(chargeItem) do
		local chargeableCount = player:getItemCount(itemData.noChargeID)
		if chargeableCount >= 1 then
			local itemType = ItemType(itemData.noChargeID)
			itemWeight = itemWeight + itemType:getWeight()
			itemCount = itemCount + 1
		end
	end
	local playerCap = player:getFreeCapacity()
	if playerCap >= itemWeight then
		return true
	else
		local requiredCap = itemWeight - playerCap
		local capMessage = string.format("%.2f", requiredCap / 100) .. " more cap"

		local itemMessage = "item"
		if itemCount > 1 then
			itemMessage = "items"
		end

		player:sendTextMessage(MESSAGE_FAILURE, "You need " .. capMessage .. " to refill and carry the " .. itemMessage .. ".")
		return false
	end
end

local function getTotalGold(player)
	return player:getItemCount(3031) + (player:getItemCount(3035) * 100) + (player:getItemCount(3043) * 10000)
end

local function removeGold(player, amount)
	local totalRemoved = 0

	-- Primeiro tenta remover o gold das mãos do jogador
	while amount > 0 do
		if amount >= 10000 and player:removeItem(3043, 1) then
			amount = amount - 10000
		elseif amount >= 100 and player:removeItem(3035, 1) then
			amount = amount - 100
		elseif player:removeItem(3031, 1) then
			amount = amount - 1
		else
			break
		end
		totalRemoved = totalRemoved + 1
	end

	-- Se não conseguiu remover o suficiente, tenta remover do banco
	if amount > 0 then
		local bankBalance = player:getBankBalance()
		if bankBalance >= amount then
			player:setBankBalance(bankBalance - amount)
			totalRemoved = totalRemoved + amount
		else
			-- Se não tiver gold suficiente no banco, devolve o que foi removido das mãos
			player:addMoney(totalRemoved)
			return false
		end
	end

	return true
end

function refill.onSay(player, words, param)
	local message = "You have refilled"
	if not hasCapacityToChange(player, message) then
		return true
	end

	local refilledItems = {}
	local totalCost = 0
	for itemName, itemData in pairs(chargeItem) do
		local chargeableCount = player:getItemCount(itemData.noChargeID)
		local totalGold = getTotalGold(player) + player:getBankBalance()
		if chargeableCount >= 1 and totalGold >= itemData.cost then
			if removeGold(player, itemData.cost) then
				totalCost = totalCost + itemData.cost
				table.insert(refilledItems, itemName)
				player:removeItem(itemData.noChargeID, 1)
				player:addItem(itemData.ChargeID, 1)
			end
		end
	end
	if #refilledItems == 0 then
		player:sendTextMessage(MESSAGE_LOOK, "You do not have any items to refill or lack the necessary gold.")
	else
		local itemList = table.concat(refilledItems, ", ")
		player:sendTextMessage(MESSAGE_LOOK, "Refilled " .. itemList .. " for a total cost of " .. totalCost .. " gold coins.")
	end
	return true
end

refill:separator(" ")
refill:groupType("normal")
refill:register()
