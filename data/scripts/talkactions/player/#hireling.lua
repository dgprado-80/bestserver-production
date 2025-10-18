local talk = TalkAction("!hireling")
local hirelingPrice = 150
local offertId = 25440

function talk.onSay(player, words, param)
    local split = param:split(",")
    if #split < 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please provide the name and sex for the hireling. Example: !hireling John,1 (1 = male, 0 = female)")
        return true
    end

    local name = split[1]:trim()
    local sex = tonumber(split[2])

    if not name or name == "" then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid name provided for the hireling.")
        return true
    end

    if sex ~= 0 and sex ~= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid sex provided for the hireling. Use 1 for male or 0 for female.")
        return true
    end

    local offer = GameStore.getOfferById(offertId)
    if not player:makeCoinTransaction(offer) then
        player:showInfoModal("Error", "You dont have Coins to buy this offer.")
        return true
    end

    local success, errorMessage = pcall(function()
        GameStore.processHirelingPurchase(player, offer, GameStore.ClientOfferTypes.CLIENT_STORE_OFFER_HIRELING, name, sex)
    end)

    if success then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        player:sendTextMessage(MESSAGE_LOOK, "Congratulations! You have purchased a hireling named " .. name .. " for " .. hirelingPrice .. " Tibia Coins.")
    end

    return true
end

talk:separator(" ")
talk:groupType("normal")
talk:register()