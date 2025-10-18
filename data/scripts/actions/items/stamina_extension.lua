local smallstaminaextension = Action()
local cooldownStorage = 67345 -- Escolha um número de storage que não esteja em uso.
local cooldownTime = 18000 -- 5 horas em segundos
local staminaToAdd = 240 * 60 -- 4 horas em segundos (240 minutos)

function smallstaminaextension.onUse(player, item, ...)
    local lastUse = player:getStorageValue(cooldownStorage)
    local currentTime = os.time()

    if lastUse > 0 and currentTime - lastUse < cooldownTime then
        local remainingTime = cooldownTime - (currentTime - lastUse)
        player:sendCancelMessage("You need to wait " .. math.ceil(remainingTime / 3600) .. " hours to use this again.")
        return true
    end

    local stamina = player:getStamina()
    if stamina >= 2520 then
        player:sendCancelMessage("You have full stamina.")
        return true
    end

    player:setStamina(math.min(2520, stamina + staminaToAdd))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendCancelMessage("You have regenerated 4 hours of your stamina.")
    item:remove(1)

    player:setStorageValue(cooldownStorage, currentTime)
    return true
end

smallstaminaextension:id(36725)
smallstaminaextension:register()
