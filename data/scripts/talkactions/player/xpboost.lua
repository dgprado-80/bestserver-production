local xpBoost = TalkAction("!xpboost")

local offertId = 65010

function xpBoost.onSay(player, words, param)
    if player:getXpBoostTime() > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have an active XP Boost. Wait for it to expire before purchasing another.")
        return true
    end

    local offer = GameStore.getOfferById(offertId)
    if not player:makeCoinTransaction(offer) then
        player:showInfoModal("Error", "You dont have Coins to buy this offer.")
        return true
    end

    local success, errorMessage = pcall(function()
        GameStore.processExpBoostPurchase(player)
    end)

     if success then
        player:sendTextMessage(MESSAGE_LOOK, "You have purchased an XP Boost for 1 hour!")
    else
        player:sendTextMessage(MESSAGE_FAILURE, errorMessage)
    end

    return true
end

xpBoost:groupType("normal")
xpBoost:register()
