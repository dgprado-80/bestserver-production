local DungeonBossDeath = CreatureEvent("DungeonBossDeath")

function DungeonBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "mestre dos magos" then
        -- Posição central será a posição do boss que morreu
        local center = creature:getPosition()
        local radius = 15

        -- Pega todos os jogadores no raio de 15 SQMs ao redor do boss
        local spectators = Game.getSpectators(center, false, true, radius, radius, radius, radius)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Mestre dos Magos was defeated. Now you can enter the reward room.")
                player:setStorageValue(82769, 1)
            end
        end
    end
    return true
end

DungeonBossDeath:register()
