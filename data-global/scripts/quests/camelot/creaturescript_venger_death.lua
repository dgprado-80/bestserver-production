local CamelotBossDeath = CreatureEvent("CamelotBossDeath")

function CamelotBossDeath.onDeath(creature)
    local targetName = creature:getName():lower()
    if targetName == "venger" then
        -- Envia uma mensagem a todos os jogadores na sala
        local spectators = Game.getSpectators(Position(32817, 33464, 10), false, true, 20, 20, 20, 20)
        for _, spectator in ipairs(spectators) do
            local player = spectator:getPlayer()
            if player then
                -- Verifica se o jogador já completou a missão
                if player:getStorageValue(353206) ~= 1 then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Venger was defeated. Now you can touch the Excalibur.")
                    player:setStorageValue(353206, 1) -- Marca a conclusão do Venger
                end
            end
        end
    end
    
    return true
end

CamelotBossDeath:register()
