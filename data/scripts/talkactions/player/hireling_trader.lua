local hirelingTrader = TalkAction("!hirelingtrader")

function hirelingTrader.onSay(player, words, param)
    -- Configuração do serviço de Trader
    local serviceId = HIRELING_SKILLS.TRADER[1]
    local offer = {
        id = serviceId,
        type = GameStore.OfferTypes.OFFER_TYPE_HIRELING_SKILL,
        price = 500 -- Preço do serviço em Tibia Coins
    }

    -- Verifica se o jogador tem um hireling
    if player:getHirelingsCount() <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to have a hireling to purchase this service.")
        return true
    end

    -- Verifica se o serviço já foi adquirido
    local alreadyUnlocked = false
    local success, errorMessage = pcall(function()
        alreadyUnlocked = player:hasHirelingSkill(GetHirelingSkillNameById(serviceId))
    end)

    if not success then
        player:sendTextMessage(MESSAGE_FAILURE, errorMessage or "An error occurred while checking the Trader service.")
        return true
    end

    if alreadyUnlocked then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your hireling already has the Trader skill unlocked.")
        return true
    end

    -- Verifica se o jogador tem Tibia Coins suficientes
    if not player:canRemoveCoins(offer.price) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough Tibia Coins to purchase the Trader service. Cost: " .. offer.price .. " coins.")
        return true
    end

    -- Processa a compra diretamente pela GameStore
    local success, errorMessage = pcall(function()
        GameStore.processHirelingSkillPurchase(player, offer)
    end)

    if success then
        -- Deduz Tibia Coins após sucesso
        player:removeTibiaCoins(offer.price)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have successfully purchased the Trader skill for your hireling!")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    else
        -- Mensagem de erro caso o GameStore falhe
        player:sendTextMessage(MESSAGE_FAILURE, errorMessage or "An error occurred while processing your purchase.")
    end

    return true
end

hirelingTrader:groupType("normal")
hirelingTrader:register()
