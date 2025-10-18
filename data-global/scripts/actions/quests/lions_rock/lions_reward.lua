local lionsRockReward = Action()

-- Lista de itens possíveis
local possibleItems = {3037, 21439, 36706, 3038, 9058, 282, 3010}

function lionsRockReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o valor de armazenamento é 6
    if player:getStorageValue(52290) >= 6 then
        -- Sorteia um item aleatório da lista
        local randomItem = possibleItems[math.random(#possibleItems)]
        
        -- Adiciona o item sorteado ao jogador
        player:addItem(randomItem, 1)
        
        -- Concede a conquista
        player:addAchievement("Lion's Den Explorer")
        
        -- Define o valor de armazenamento para -1 após o uso
        player:setStorageValue(52290, -1)
        
        -- Envia uma mensagem ao jogador
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You opened the Maxxen's chest and received a random reward.")
    else
        -- Se o valor de armazenamento não for 6, informa que o baú está vazio
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
    end
    return true
end

lionsRockReward:uid(43651)
lionsRockReward:register()