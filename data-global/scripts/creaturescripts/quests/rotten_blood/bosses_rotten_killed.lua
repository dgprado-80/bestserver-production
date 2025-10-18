local bossStorage = 45671

local bosses = {
    ["murcion"] = true,
    ["vemiath"] = true,
    ["chagorz"] = true,
    ["ichgahal"] = true,
}

local RottenBloodBossKill = CreatureEvent("RottenBloodBossDeath")
function RottenBloodBossKill.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local targetName = creature:getName():lower()
    if bosses[targetName] then
        local spectators = Game.getSpectators(creature:getPosition(), false, false, 10, 10, 10, 10)
        for _, spectator in ipairs(spectators) do
            if spectator:isPlayer() then
                local newValue = math.max(0, spectator:getStorageValue(bossStorage)) + 1
                spectator:setStorageValue(bossStorage, newValue)
                spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You killed the boss" .. targetName .. ".")
            end
        end
    end
    return true
end

RottenBloodBossKill:register()

