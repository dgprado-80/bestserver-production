local bossStorage = 746720

local bosses = {
    ["the rootkraken"] = true,
}

local PodzillaBossOutFitKill = CreatureEvent("PodzillaBossOutFitDeath")
function PodzillaBossOutFitKill.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local targetName = creature:getName():lower()
    if bosses[targetName] then
        local player = mostdamagekiller
        if player and player:isPlayer() then
            local currentStorage = player:getStorageValue(bossStorage)
            if currentStorage < 1 then
                player:setStorageValue(bossStorage, 1) -- Marca que o boss já foi morto
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens! Voce ganhou o Rootwalker Outfit")
                if player:getSex() == PLAYERSEX_FEMALE then
                    player:addOutfitAddon(1775, 1) -- Female outfit addon
                else
                    player:addOutfitAddon(1774, 1) -- Male outfit addon
                end
            end
        end
    end
    return true
end

PodzillaBossOutFitKill:register()
