local BOSS_NAME = "the best beast" -- Nome do boss (lowercase)
local REWARD_RADIUS = 5 -- raio para detectar players

-- Listas de recompensas
local rareItems = {
    {id = 43898, count = 1},
	{id = 44527, count = 1},
    {id = 50063, count = 1},
    {id = 5903, count = 1},
    {id = 51296, count = 1},
    {id = 51304, count = 1},
    {id = 51297, count = 1},
	{id = 51295, count = 1},
    {id = 48250, count = 60},
    {id = 48249, count = 60},
    {id = 3043, count = 300},
    {id = 38677, count = 1},	
    {id = 44054, count = 1},
    {id = 36979, count = 1},
    {id = 22120, count = 1},
    {id = 22721, count = 100},
    {id = 22516, count = 100}

}

local semiRareItems = {
    {id = 36724, count = 5},
	{id = 36726, count = 5},
    {id = 36723, count = 5},
    {id = 3043, count = 100},
    {id = 44062, count = 1},
    {id = 49273, count = 1},
    {id = 37750, count = 1},
	{id = 36728, count = 1},
	{id = 19083, count = 50},
	{id = 34109, count = 1},
    {id = 39546, count = 1},
    {id = 48249, count = 30},
    {id = 48250, count = 30},
    {id = 22721, count = 50},
    {id = 22516, count = 50}

}

local commonItems = {
    {id = 3043, count = 30},
	{id = 36727, count = 2},
    {id = 36734, count = 2},
    {id = 36735, count = 2},
    {id = 36733, count = 2},
    {id = 44604, count = 2},
    {id = 44613, count = 2},
	{id = 44610, count = 2},
    {id = 48249, count = 10},
    {id = 48250, count = 10},
    {id = 22721, count = 10},
    {id = 22516, count = 10},	
    {id = 3028, count = 100},
    {id = 3029, count = 100},
    {id = 3032, count = 100},
    {id = 3030, count = 100}
   
}

local function getRandomItemFromList(list)
    return list[math.random(#list)]
end

local function giveReward(player, item)
    player:addItem(item.id, item.count)
end

local function getTopDamagers(damageMap)
    local damagers = {}

    for attackerId, damage in pairs(damageMap) do
        local attacker = Player(attackerId)
        if attacker and attacker:isPlayer() then
            table.insert(damagers, {player = attacker, damage = damage})
        end
    end

    table.sort(damagers, function(a, b) return a.damage > b.damage end)
    return damagers
end

local BossRewardScript = CreatureEvent("BossRewardScript")

function BossRewardScript.onDeath(creature, corpse, killer, mostDamageKiller, lasthitunjustified, mostdamageunjustified)
    local bossName = creature:getName():lower()
    if bossName ~= BOSS_NAME then
        return true
    end

    local damageMap = creature:getDamageMap()
    local topDamagers = getTopDamagers(damageMap)

    local first = topDamagers[1] and topDamagers[1].player
    local second = topDamagers[2] and topDamagers[2].player
    local third = topDamagers[3] and topDamagers[3].player

    local bossPos = creature:getPosition()
    local spectators = Game.getSpectators(bossPos, false, true, REWARD_RADIUS, REWARD_RADIUS, REWARD_RADIUS, REWARD_RADIUS)

    for _, player in ipairs(spectators) do
        if player:isPlayer() then
            local reward
            if first and player == first then
                reward = getRandomItemFromList(rareItems)
                giveReward(player, reward)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You received a rare reward: " .. ItemType(reward.id):getName() .. ".")
                print("[Boss Reward] " .. player:getName() .. " received RARE item: " .. ItemType(reward.id):getName())
            elseif (second and player == second) or (third and player == third) then
                reward = getRandomItemFromList(semiRareItems)
                giveReward(player, reward)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a semi-rare reward: " .. ItemType(reward.id):getName() .. ".")
                print("[Boss Reward] " .. player:getName() .. " received SEMI-RARE item: " .. ItemType(reward.id):getName())
            else
                reward = getRandomItemFromList(commonItems)
                giveReward(player, reward)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a common reward: " .. ItemType(reward.id):getName() .. ".")
                print("[Boss Reward] " .. player:getName() .. " received COMMON item: " .. ItemType(reward.id):getName())
            end
        end
    end

    -- 📢 Broadcast com os nomes do top 3
    local msg = "[Boss Event] The boss '" .. creature:getName() .. "' has been defeated!"
    if first then msg = msg .. " Top damager: " .. first:getName() end
    if second then msg = msg .. ", Second: " .. second:getName() end
    if third then msg = msg .. ", Third: " .. third:getName() end
    Game.broadcastMessage(msg, MESSAGE_EVENT_ADVANCE)

    return true
end

BossRewardScript:register()
