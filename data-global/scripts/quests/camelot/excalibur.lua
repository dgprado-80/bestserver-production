local outfitItemID = 16276
local uniqueID = 53202
local outfitStorage = 53203 -- Armazena o progresso do outfit para o jogador
local missionStorage = 353206 -- Armazena o progresso da missão para derrotar o Venger

local DecayingDefenderOutfitAction = Action()

function DecayingDefenderOutfitAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verifica se o Unique ID está correto
    if item.uid ~= uniqueID then
        return false
    end

    -- Verifica se o jogador completou a missão do Venger
    if player:getStorageValue(missionStorage) < 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Only warriors who defeated Venger can touch Excalibur.")
        return true
    end

    -- Verifica se o jogador já recebeu o outfit
    if player:getStorageValue(outfitStorage) > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already received this outfit.")
        return true
    end

    -- Concede o outfit ao jogador
    if player:getSex() == PLAYERSEX_FEMALE then
        player:addOutfitAddon(1676, 3) -- Female outfit addon
    else
        player:addOutfitAddon(1675, 3) -- Male outfit addon
    end

    -- Atualiza a storage e envia mensagem
    player:setStorageValue(outfitStorage, 1)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! you receive the Darklight Evoker Outfit and addons. Now you can enter the castle reward room.")

    return true
end

-- Registra a action diretamente no final do arquivo
DecayingDefenderOutfitAction:id(outfitItemID)
DecayingDefenderOutfitAction:register()
