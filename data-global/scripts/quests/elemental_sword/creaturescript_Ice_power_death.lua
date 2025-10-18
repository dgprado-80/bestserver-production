local ElementalSwordIceBossDeath = CreatureEvent("ElementalSwordIceBossDeath")

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

function ElementalSwordIceBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "ice power" then
        local center = creature:getPosition()
        local radius = 15

        -- Buscar jogadores próximos ao boss
        local spectators = Game.getSpectators(center, false, true, radius, radius, radius, radius)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You will be teleported to the Energy stage in one minute. Be ready!", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Ice Seal has been completed.")
                player:setStorageValue(55602, 1)  -- Marca a conclusão do Ice Seal
            end
        end

        -- Agendar teleporte após 20 segundos (ajuste para 60 se quiser)
        addEvent(teleportPlayersInRadius, 20 * 1000, center, Position(33093, 33172, 8))
    end
    return true
end

ElementalSwordIceBossDeath:register()
