local ElementalSwordIceBossDeath = CreatureEvent("ElementalSwordIceBossDeath")

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

function ElementalSwordIceBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "ice power" then
        -- Definir a área da sala usando as coordenadas fornecidas
        local specPos = {
            from = Position(33080, 33162, 8),  -- Posição inicial da área especial
            to = Position(33113, 33184, 8),    -- Posição final da área especial
        }

        -- Enviar mensagens e atribuir storage aos jogadores na área
        local spectators = Game.getSpectators(specPos.from, false, true, specPos.to.x - specPos.from.x, specPos.to.y - specPos.from.y, specPos.to.z - specPos.from.z)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You will be teleported to the Energy stage in one minute. Be ready!", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Ice Seal has been completed.")
                player:setStorageValue(55602, 1)  -- Marca a conclusão do Ice Seal
            end
        end

        -- Agendar o teletransporte após 60 segundos
        addEvent(teleportPlayersInRoom, 20 * 1000, specPos, Position(33093, 33172, 8))  -- Posição de destino
    end
    return true
end

ElementalSwordIceBossDeath:register()