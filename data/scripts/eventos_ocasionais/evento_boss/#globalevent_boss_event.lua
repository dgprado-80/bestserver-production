local bossName = "The Best Beast"
local spawnStorage = 80000
local eventDay = "Friday" -- Dia da semana em que o evento ocorre

local bossSpawns = {
    {city = "Thais", position = Position(32368, 32227, 7)},
    {city = "Carlin", position = Position(32360, 31790, 7)},
    {city = "Venore", position = Position(32956, 32074, 6)},
    {city = "Edron", position = Position(33202, 31816, 7)},
    {city = "Darashia", position = Position(33214, 32449, 7)}
}

---------------------------------------
-- 1. AVISO INICIAL + REPETIÇÕES
---------------------------------------

local BossSpawnWarning = GlobalEvent("BossSpawnWarning")

function BossSpawnWarning.onThink(interval, lastExecution)
    local day = os.date("%A")
    if day ~= eventDay then
        return true
    end

    local index = math.random(#bossSpawns)
    Game.setStorageValue(spawnStorage, index)

    local spawn = bossSpawns[index]

    -- Envia aviso inicial
    Game.broadcastMessage("[BOSS EVENT] The Best Beast will spawn near " .. spawn.city .. " temple in 5 minutes!", MESSAGE_EVENT_ADVANCE)
    print("[BossSpawnWarning] Boss will spawn near " .. spawn.city .. " in 5 minutes.")

    -- Avisos restantes a cada 1 minuto
    for i = 1, 4 do
        addEvent(function()
            Game.broadcastMessage("[BOSS EVENT] The Best Beast will spawn near " .. spawn.city .. " temple in " .. (5 - i) .. " minutes!", MESSAGE_EVENT_ADVANCE)
        end, i * 60 * 1000)
    end

    return true
end

BossSpawnWarning:time("21:55:00")
BossSpawnWarning:register()

---------------------------------------
-- 2. SPAWN FINAL DO BOSS
---------------------------------------

local BossRealSpawn = GlobalEvent("BossRealSpawn")

function BossRealSpawn.onThink(interval, lastExecution)
    local day = os.date("%A")
    if day ~= eventDay then
        return true
    end

    local index = Game.getStorageValue(spawnStorage)
    if index < 1 or index > #bossSpawns then
        print("[BossRealSpawn] Invalid or missing spawn index.")
        return true
    end

    local spawn = bossSpawns[index]
    local monster = Game.createMonster(bossName, spawn.position, true, true)

    if monster then
        Game.broadcastMessage("[BOSS EVENT] The boss '" .. bossName .. "' has spawned near " .. spawn.city .. "! Prepare for battle!", MESSAGE_EVENT_ADVANCE)
        spawn.position:sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        print("[BossRealSpawn] Spawned '" .. bossName .. "' near " .. spawn.city)
    else
        print("[BossRealSpawn] Failed to spawn boss at " .. spawn.city)
    end

    return true
end

BossRealSpawn:time("22:00:00")
BossRealSpawn:register()
