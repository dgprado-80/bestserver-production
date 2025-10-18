local ElementalSwordEarthBossDeath = CreatureEvent("ElementalSwordEarthBossDeath")

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

function ElementalSwordEarthBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "earth power" then
        -- Definir a área da sala usando as coordenadas fornecidas
        local specPos = {
            from = Position(32976, 33271, 8),  -- Posição inicial da área especial
            to = Position(33001, 33293, 8),    -- Posição final da área especial
        }

        -- Enviar mensagens e atribuir storage aos jogadores na área
        local spectators = Game.getSpectators(specPos.from, false, true, specPos.to.x - specPos.from.x, specPos.to.y - specPos.from.y, specPos.to.z - specPos.from.z)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You will be teleported to the Ice stage in one minute. Be ready!", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Earth Seal has been completed.")
                player:setStorageValue(55601, 1)  -- Marca a conclusão do Earth Seal
            end
        end

        -- Agendar o teletransporte após 60 segundos
        addEvent(teleportPlayersInRoom, 20 * 1000, specPos, Position(32990, 33282, 8))  -- Posição de destino
    end
    return true
end

ElementalSwordEarthBossDeath:register()