local ElementalSwordEnergyBossDeath = CreatureEvent("ElementalSwordEnergyBossDeath")

-- Função para teletransportar jogadores na sala
local function teleportPlayersInRoom(specPos, destination)
    -- Obter todos os jogadores na área retangular definida por specPos
    local spectators = Game.getSpectators(specPos.from, false, true, specPos.to.x - specPos.from.x, specPos.to.y - specPos.from.y, specPos.to.z - specPos.from.z)
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
        -- Definir a área da sala usando as coordenadas fornecidas
        local specPos = {
            from = Position(33074, 33309, 7),  -- Posição inicial da área especial
            to = Position(33093, 33331, 7),    -- Posição final da área especial
        }

        -- Enviar mensagens e atribuir storage aos jogadores na área
        local spectators = Game.getSpectators(specPos.from, false, true, specPos.to.x - specPos.from.x, specPos.to.y - specPos.from.y, specPos.to.z - specPos.from.z)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You will be teleported to the REWARD PLACE in ONE minute. Be ready!", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Energy Seal has been completed.")
                player:setStorageValue(55603, 1)  -- Marca a conclusão do Energy Seal
            end
        end

        -- Agendar o teletransporte após 60 segundos
        addEvent(teleportPlayersInRoom, 20 * 1000, specPos, Position(33083, 33319, 7))  -- Posição de destino
    end
    return true
end

ElementalSwordEnergyBossDeath:register()