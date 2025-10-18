local bossStorage = 736721
local bossKillCountStorage = 736722 -- Nova storage para contar as mortes do boss

local bosses = {
    ["arbaziloth"] = true,
}

local ArbazilothBossOutFitKill = CreatureEvent("ArbazilothBossOutFitDeath")
function ArbazilothBossOutFitKill.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local targetName = creature:getName():lower()
    if bosses[targetName] then
        local player = mostdamagekiller
        if player and player:isPlayer() then
            local currentStorage = player:getStorageValue(bossStorage)
            local killCount = player:getStorageValue(bossKillCountStorage)

            -- Incrementa o contador de mortes do boss
            if killCount < 0 then
                killCount = 1
            else
                killCount = killCount + 1
            end
            player:setStorageValue(bossKillCountStorage, killCount)

            -- Verifica se o jogador já matou o boss antes
            if currentStorage < 1 then
                player:setStorageValue(bossStorage, 1) -- Marca que o boss já foi morto
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce ganhou o Fiend Slayer Outfit")
                if player:getSex() == PLAYERSEX_FEMALE then
                    player:addOutfitAddon(1808, 1) -- Female outfit addon
                else
                    player:addOutfitAddon(1809, 1) -- Male outfit addon
                end
            end
        end
    end
    return true
end

ArbazilothBossOutFitKill:register()
