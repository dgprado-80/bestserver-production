local camelotReward = Action()

function camelotReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o Unique ID do item está correto
    if item.uid ~= 53203 then
        return false
    end

    -- Verifica se o jogador completou a missão anterior
    if player:getStorageValue(353206) < 1 then
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You haven't completed the required mission to claim this reward.")
    end

    -- Verifica se o jogador já recebeu o prêmio
    if player:getStorageValue(53207) == 1 then
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already claimed this reward.")
    end

    -- Entrega a recompensa
    player:addItem(48114, 1) -- Camelot Backpack
    player:addPremiumDays(15) -- Adiciona 15 dias de VIP
    player:onAddVip(15, false) -- Adiciona 15 dias VIP no sistema interno
    player:addTibiaCoins(1000) -- Adiciona 1000 Tibia Coins

    -- Atualiza a storage para marcar que o prêmio foi recebido
    player:setStorageValue(53207, 1)

    -- Mensagem de confirmação
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a Camelot Backpack. You received 15 VIP days and 1000 Tibia Coins.")

    return true
end

-- Configura a action para o item e UID especificados
camelotReward:id(24877)
camelotReward:uid(53203)
camelotReward:register()
