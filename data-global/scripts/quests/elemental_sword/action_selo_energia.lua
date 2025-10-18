local iceSeal = Action()

function iceSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o item é o correto e tem a UID correta
    if item.itemid == 5070 and item.uid == 55503 then
        -- Verifica se o jogador já possui o selo de terra ativo
        if player:getStorageValue(55503) >= 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have the energy acces.")
            return false
        end
        


        -- Define o armazenamento para registrar a conclusão do selo de gelo
        local storageKey = 55503
        local currentTime = os.time()
        player:setStorageValue(storageKey, currentTime)
		local effectPosition = player:getPosition()
            effectPosition:sendMagicEffect(244)

        -- Notifica o jogador que ele completou o selo de gelo
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Run find the energy portal.You have just 10 minutes to find this")

        -- Configura um evento para resetar o armazenamento após 10 minutos
        addEvent(function()
            if player:getStorageValue(storageKey) == currentTime then
                player:setStorageValue(storageKey, -1)
                player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "The energy seal has been lost.")
            end
        end, 40 * 60 * 1000) -- 10 minutos em milissegundos

        return true
    else
        player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You cannot use this item here.")
        return false
    end
end

iceSeal:uid(55503)
iceSeal:register()
