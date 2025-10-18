local ElementalSwordFireBossDeath = CreatureEvent("ElementalSwordFireBossDeath")

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

function ElementalSwordFireBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "fire power" then
        -- Definir a área da sala usando as coordenadas fornecidas
        local specPos = {
            from = Position(32983, 33203, 7),  -- Posição inicial da área especial
            to = Position(32995, 33216, 7),    -- Posição final da área especial
        }

        -- Enviar mensagens e atribuir storage aos jogadores na área
        local spectators = Game.getSpectators(specPos.from, false, true, specPos.to.x - specPos.from.x, specPos.to.y - specPos.from.y, specPos.to.z - specPos.from.z)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You now have 1 minute to exit this room. You will be teleported to the Earth Seal.", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Fire Seal has been completed.")
                player:setStorageValue(55600, 1)  -- Marca a conclusão do Fire Seal
            end
        end

        -- Agendar o teletransporte após 60 segundos
        addEvent(teleportPlayersInRoom, 20 * 1000, specPos, Position(32979, 33224, 7))
    end
    return true
end

ElementalSwordFireBossDeath:register()