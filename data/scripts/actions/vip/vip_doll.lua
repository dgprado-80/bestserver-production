local vipDoll = Action()

function vipDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local VIP_DAYS = 30

    if item.itemid == 22120 then
        -- Verifica se o sistema VIP está habilitado
        if not configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
            player:sendCancelMessage("VIP System is not enabled!")
            return true
        end

        -- Adiciona os dias de VIP ao jogador
        player:addPremiumDays(VIP_DAYS)
        player:onAddVip(VIP_DAYS, false)
        
        -- Envia mensagem e remove o item
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have used a VIP Doll and received %d days of VIP status.", VIP_DAYS))
        item:remove(1)
    else
        player:sendCancelMessage("This is not a valid VIP Doll.")
    end
    return true
end

vipDoll:id(22120)
vipDoll:register()
