local charmConfig = {
    storageValue = 1221927, -- Valor de storage para controle de Charm Points
    charmPoints = 1000 -- Quantidade de Charm Points a serem adicionados 17400
}

local playerLoginCharm = CreatureEvent("PlayerLoginCharm")

function playerLoginCharm.onLogin(player)
	local storageValue = charmConfig.storageValue
	local charmPoints = charmConfig.charmPoints

	local currentCharmPoints = player:getStorageValue(storageValue)
    if currentCharmPoints == -1 then
        player:addCharmPoints(charmPoints)
        player:sendTextMessage(MESSAGE_LOGIN, "You received  " .. charmPoints .. " Charm Points at login.")
        player:setStorageValue(storageValue, charmPoints)
    end
	return true
end

playerLoginCharm:register()
