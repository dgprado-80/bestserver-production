local config = {
    regenBonusPercent = 30, -- 30% mais rápido
    vipMessage = "You have a 30% faster regeneration rate for mana and health due to your VIP status." -- Mensagem para jogadores VIP
}

function applyRegenBonus(player)
    if player:isVip() then
        if not player:hasCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 31) then
            -- Cria a condição de regeneração para HP e mana
            local regenBoost = Condition(CONDITION_REGENERATION)
            regenBoost:setParameter(CONDITION_PARAM_SUBID, 31)
            regenBoost:setParameter(CONDITION_PARAM_TICKS, -1) -- Duração infinita
            regenBoost:setParameter(CONDITION_PARAM_HEALTHGAIN, config.regenBonusPercent)
            regenBoost:setParameter(CONDITION_PARAM_MANAGAIN, config.regenBonusPercent)
            regenBoost:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

            player:addCondition(regenBoost)

            -- Envia a mensagem informando o bônus de regeneração
            player:sendTextMessage(MESSAGE_LOOK, config.vipMessage)
        end
    else
        -- Remove a condição se o jogador não for mais VIP
        if player:hasCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 31) then
            player:removeCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 31)
            player:sendTextMessage(MESSAGE_LOOK, "Your VIP status has expired, and your regeneration bonus has been removed.")
        end
    end
end

function onThink(interval)
    local players = Game.getPlayers()

    for _, player in ipairs(players) do
        applyRegenBonus(player)
    end

    return true
end

function onLogin(player)
    -- Aplica ou remove o bônus de regeneração ao logar, dependendo do status VIP
    applyRegenBonus(player)
    return true
end

-- Registro do evento de login diretamente no Lua
local loginEvent = CreatureEvent("VipRegenOnLogin")
function loginEvent.onLogin(player)
    return onLogin(player)
end
loginEvent:register()

-- Registra o evento onThink para aplicar o bônus periodicamente
local regenBonusEvent = GlobalEvent("VipRegenBonus")
regenBonusEvent:interval(60000) -- Verifica a cada 60 segundos
regenBonusEvent:register()
