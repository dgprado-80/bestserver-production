local ElementalSwordEarthBossDeath = CreatureEvent("ElementalSwordEarthBossDeath")

-- Função para teletransportar jogadores num raio de 15 SQMs
local function teleportPlayersInRadius(centerPosition, destination)
    local radius = 15
    local spectators = Game.getSpectators(centerPosition, false, true, radius, radius, radius, radius)
    for _, spectator in ipairs(spectators) do
        local player = spectator:getPlayer()
        if player then
            player:teleportTo(destination)
            destination:sendMagicEffect(CONST_ME_TELEPORT)
        end
    end
end

function ElementalSwordEarthBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "earth power" then
        local center = creature:getPosition()
        local radius = 15

        -- Buscar todos os jogadores ao redor do boss morto
        local spectators = Game.getSpectators(center, false, true, radius, radius, radius, radius)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You will be teleported to the Ice stage in one minute. Be ready!", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Earth Seal has been completed.")
                player:setStorageValue(55601, 1)  -- Marca a conclusão do Earth Seal
            end
        end

        -- Teleporte após 20 segundos (altere para 60 se quiser tempo real)
        addEvent(teleportPlayersInRadius, 20 * 1000, center, Position(32990, 33282, 8))
    end
    return true
end

ElementalSwordEarthBossDeath:register()
