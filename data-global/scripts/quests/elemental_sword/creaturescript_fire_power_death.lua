local ElementalSwordFireBossDeath = CreatureEvent("ElementalSwordFireBossDeath")

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

function ElementalSwordFireBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "fire power" then
        local center = creature:getPosition()
        local radius = 15

        -- Pega todos os jogadores ao redor do boss morto
        local spectators = Game.getSpectators(center, false, true, radius, radius, radius, radius)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:say("You now have 1 minute to exit this room. You will be teleported to the Earth Seal.", TALKTYPE_MONSTER_SAY)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Fire Seal has been completed.")
                player:setStorageValue(55600, 1)  -- Marca a conclusão do Fire Seal
            end
        end

        -- Agendar o teleporte após 20 segundos
        addEvent(teleportPlayersInRadius, 20 * 1000, center, Position(32979, 33224, 7))
    end
    return true
end

ElementalSwordFireBossDeath:register()
