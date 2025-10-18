local VIP_DAYS = 15
local STORAGE_VIP_GIVEN = 4650000  -- Storage para verificar se já recebeu os 15 dias de VIP

local function addVipToAccount(player)
    -- Verifica se o sistema VIP está habilitado
    if not configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
        return false
    end

    -- Verifica se o jogador já recebeu os 15 dias de VIP
    if player:getStorageValue(STORAGE_VIP_GIVEN) == 1 then
        return false -- Já recebeu os 15 dias, não precisa mais
    end

    -- Verifica se o jogador já possui VIP ativo
    if not player:isVip() then
        -- Adiciona os 15 dias de VIP
        player:addPremiumDays(VIP_DAYS)
        player:onAddVip(VIP_DAYS, false)

        -- Grava no storage que o jogador já recebeu os 15 dias de VIP
        player:setStorageValue(STORAGE_VIP_GIVEN, 1)

        -- Envia uma mensagem ao jogador
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have been credited with %d days of VIP status.", VIP_DAYS))
    end

    return true
end

function onLogin(player)
    -- Chama a função para verificar e adicionar VIP, caso aplicável
    addVipToAccount(player)


    return true
end

-- Registrar o script globalmente
local playerLoginGlobal = CreatureEvent("playerLoginGlobal")
playerLoginGlobal:type("login")
playerLoginGlobal:register()
