local ElementalSwordEnergyBossDeath = CreatureEvent("ElementalSwordEnergyBossDeath")

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

function ElementalSwordEnergyBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "energy power" then
        local center = creature:getPosition()
        local radius = 15

        -- Pegar jogadores ao redor do boss no momento da morte
        local spectators = Game.getSpectators(center, false, true, radius, radius, radius, radius)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You will be teleported to the REWARD PLACE in ONE minute. Be ready!", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Energy Seal has been completed.")
                player:setStorageValue(55603, 1)  -- Marca a conclusão do Energy Seal
            end
        end

        -- Teleporta após 20 segundos (ajusta se quiser 60s de verdade)
        addEvent(teleportPlayersInRadius, 20 * 1000, center, Position(33083, 33319, 7))
    end
    return true
end

ElementalSwordEnergyBossDeath:register()
