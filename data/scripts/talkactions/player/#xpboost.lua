local xpBoost = TalkAction("!xpboost")

-- Configurações dos preços e máximo de compras por dia
local prices = {30, 45, 90, 180, 360}
local maxDailyPurchases = 5 -- Limite total de compras por dia (loja + talkaction)

function xpBoost.onSay(player, words, param)
    local today = os.date("%Y-%m-%d") -- Data atual no formato YYYY-MM-DD
    local purchasesToday = player:kv():get("daily-xpboost-purchases") or {}

    -- Verifica se o jogador já tem um boost ativo
    if player:getXpBoostTime() > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have an active XP Boost. Wait for it to expire before purchasing another.")
        return true
    end

    -- Recupera o número de boosts comprados na loja
    local storeBoosts = player:getStorageValue(GameStore.Storages.expBoostCount)
    if storeBoosts < 0 then
        storeBoosts = 0 -- Garante que o valor seja válido
    end

    -- Recupera o número de boosts comprados via talkaction
    local talkActionBoosts = purchasesToday[today] or 0

    -- Calcula o total de boosts comprados no dia (loja + talkaction)
    local totalBoostsToday = storeBoosts + talkActionBoosts

    -- Checa se o jogador já atingiu o limite de compras diárias
    if totalBoostsToday >= maxDailyPurchases then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have reached the daily limit of XP Boost purchases (5 total, including store purchases).")
        return true
    end

    -- Define o preço com base no número de compras realizadas hoje
    local purchaseCount = talkActionBoosts
    local price = prices[purchaseCount + 1]

    -- Deduz as Tibia Coins do jogador
    player:removeTibiaCoins(price)

    -- Configura o bônus de XP
    player:setXpBoostTime(player:getXpBoostTime() + (60 * 60)) -- Adiciona 1 hora de XP Boost
    player:setXpBoostPercent(50) -- Define o boost para 50%

    -- Atualiza as compras diárias na talkaction
    purchasesToday[today] = talkActionBoosts + 1
    player:kv():set("daily-xpboost-purchases", purchasesToday)

    -- Mensagem de sucesso
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have purchased an XP Boost for 1 hour! This is your " .. (totalBoostsToday + 1) .. "º boost of the day (including store purchases).")
    return true
end

xpBoost:groupType("normal")
xpBoost:register()
