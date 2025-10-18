local fireSeal = Action()

function fireSeal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o item é o correto e tem a UID correta
    if item.itemid == 2115 and item.uid == 55500 then
        -- Define o armazenamento para registrar a conclusão do selo de fogo
        local storageKey = 55500

        -- Verifica se o jogador já possui o selo de fogo
        if player:getStorageValue(storageKey) >= 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have the fire seal.")
            return false
        end

        local currentTime = os.time()
        player:setStorageValue(storageKey, currentTime)
        local effectPosition = player:getPosition()
        effectPosition:sendMagicEffect(244)

        -- Notifica o jogador que ele completou o selo de fogo
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Run find the fire portal. You have just 10 minutes to find it.")

        -- Configura um evento para resetar o armazenamento após 10 minutos
        addEvent(function()
            if player:getStorageValue(storageKey) == currentTime then
                player:setStorageValue(storageKey, -1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The fire seal has been lost.")
            end
        end, 40 * 60 * 1000) -- 10 minutos em milissegundos

        return true
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this item here.")
        return false
    end
end

fireSeal:uid(55500)
fireSeal:register()
