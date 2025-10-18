local config = {
    storage = 26700, -- Mude o armazenamento para um que esteja livre
    vipPointsPerInterval = 3, -- Quantidade de Tibia Coins para jogadores VIP
    nonVipPointsPerInterval = 1, -- Quantidade de Tibia Coins para jogadores não VIP
    intervalMinutes = 30, -- Intervalo de 30 minutos
    checkDuplicateIps = false,
    showLog = false -- Mostrar mensagem no console?
}

local onlinePointsEvent = GlobalEvent("GainPointPerInterval")
local intervalShort = config.intervalMinutes * 60 * 1000 -- Intervalo em milissegundos

function onlinePointsEvent.onThink(interval)
    local players = Game.getPlayers()
    local playerCount = #players

    if playerCount == 0 then
        onlinePointsEvent:interval(intervalShort)
        return true
    end

    local checkIp = {}
    local storage = config.storage
    local checkDuplicateIps = config.checkDuplicateIps
    local showLog = config.showLog

    local ipSet = {}
    for i, player in ipairs(players) do
        local ip = player:getIp()
        if ip ~= 0 and (not checkDuplicateIps or not ipSet[ip]) then
            ipSet[ip] = true
            local pointsToAdd = player:isVip() and config.vipPointsPerInterval or config.nonVipPointsPerInterval
            player:addTibiaCoins(pointsToAdd)
            player:sendTextMessage(MESSAGE_LOOT, string.format("Voce recebeu %d Tibia Coins em sua conta por estar online.", pointsToAdd))
            if showLog then
                local playerName = player:getName()
                Spdlog.info("Player Rewarded: " .. playerName .. " [Success]")
            end
        end
    end

    return true
end

onlinePointsEvent:interval(intervalShort)
onlinePointsEvent:register()
