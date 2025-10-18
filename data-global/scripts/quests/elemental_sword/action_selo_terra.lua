local earthSeal = Action()

function earthSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o item é o correto e tem a UID correta
    if item.itemid == 17341 and item.uid == 55501 then
        -- Verifica se o jogador já possui o selo de terra ativo
        if player:getStorageValue(55501) >= 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have the earth seal active.")
            return false
        end
        
        -- Verifica se o jogador possui a storage 55600 com valor 1
        if player:getStorageValue(55600) ~= 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have the Fire Seal completed.")
            return false
        end

        -- Define o armazenamento para registrar a conclusão do selo de terra
        local storageKey = 55501
        local currentTime = os.time()
        player:setStorageValue(storageKey, currentTime)
		local effectPosition = player:getPosition()
            effectPosition:sendMagicEffect(244)

        -- Notifica o jogador que ele completou o selo de terra
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Run find the earth portal.You have just 10 minutes to find this")

        -- Configura um evento para resetar o armazenamento após 10 minutos
        addEvent(function()
            if player:getStorageValue(storageKey) == currentTime then
                player:setStorageValue(storageKey, -1)
                player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "The earth seal has been reset.")
            end
        end, 40 * 60 * 1000) -- 10 minutos em milissegundos

        return true
    else
        player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You cannot use this item here.")
        return false
    end
end

earthSeal:uid(55501)
earthSeal:register()
