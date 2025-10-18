local mType = Game.createMonsterType("Rootthing Amber Shaper")
local monster = {}

monster.description = "a rootthing amber shaper"
monster.experience = 13200
monster.outfit = {
    lookType = 1762,  -- Substitua por lookType correto, se disponível.
    lookHead = 85,
    lookBody = 1,
    lookLegs = 85,
    lookFeet = 105,
    lookAddons = 3,
    lookMount = 0,
}

monster.raceId = 2539
monster.Bestiary = {
    class = "Plant",
    race = BESTY_RACE_PLANT,
    toKill = 5000,
    FirstUnlock = 200,
    SecondUnlock = 2000,
    CharmsPoints = 100,
    Stars = 4,
    Occurrence = 3,
    Locations = "Podzilla Stalk",
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 49147  -- ID do cadáver, se disponível.
monster.speed = 185
monster.manaCost = 0

monster.changeTarget = {
    interval = 4000,
    chance = 10,
}

monster.strategiesTarget = {
    nearest = 100,
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = true,
    convinceable = false,
    pushable = false,
    rewardBoss = false,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 90,
    targetDistance = 1,  -- Ataque corpo a corpo.
    runHealth = 0,
    healthHidden = false,
    isBlockable = false,
    canWalkOnEnergy = true,
    canWalkOnFire = true,
    canWalkOnPoison = true,
}

monster.light = {
    level = 0,
    color = 0,
}

monster.voices = {
    interval = 5000,
    chance = 10,
    { text = "<KNARR>", yell = false },
    { text = "<RATTLE>", yell = false },
    { text = "<CROAK>", yell = false },
}

monster.loot = {
    { name = "Platinum Coin", chance = 1000, minCount = 2, maxCount = 37 },
    { name = "Amber Sickle", chance = 800 },
    { name = "Demon Root", chance = 800 },
    { name = "Resin Parasite", chance = 800 },
    { name = "Crystal Coin", chance = 500 },
    { name = "Amber Staff", chance = 500 },
    { name = "Wooden Spellbook", chance = 200 },
    { name = "Skull Helmet", chance = 50 },
    { name = "Jade Hammer", chance = 50 },
    { name = "Amber with a Bug", chance = 50 },
    { name = "Amber with a Dragonfly", chance = 50 },
    { name = "Preserved Pink Seed", chance = 50 },
    { name = "Preserved Red Seed", chance = 50 },
    { name = "Preserved Yellow Seed", chance = 50 },
    { name = "Preserved Dark Seed", chance = 50 },
}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_CARNIPHILA },
    { name = "combat", interval = 3000, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -900, maxDamage = -1200, radius = 3, effect = CONST_ME_POISONAREA, target = false },
    { name = "combat", interval = 2500, chance = 50, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -950, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
}

monster.defenses = {
    defense = 100,
    armor = 100,
    mitigation = 2.75,
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = -5 },   -- 95% Physical damage reduction
    { type = COMBAT_ENERGYDAMAGE, percent = -25 },    -- 75% Energy damage reduction
    { type = COMBAT_EARTHDAMAGE, percent = 0 },       -- 0% Earth damage (no reduction)
    { type = COMBAT_FIREDAMAGE, percent = 5 },        -- 105% Fire damage (5% vulnerability)
    { type = COMBAT_LIFEDRAIN, percent = 0 },         -- 100% Life Drain damage
    { type = COMBAT_MANADRAIN, percent = 0 },         -- 100% Mana Drain damage
    { type = COMBAT_DROWNDAMAGE, percent = 0 },       -- 100% Drown damage
    { type = COMBAT_ICEDAMAGE, percent = 5 },         -- 105% Ice damage (5% vulnerability)
    { type = COMBAT_HOLYDAMAGE, percent = 5 },        -- 105% Holy damage (5% vulnerability)
    { type = COMBAT_DEATHDAMAGE, percent = 0 },       -- 100% Death damage (no reduction)
}


monster.immunities = {
    { type = "paralyze", condition = true },
    { type = "invisible", condition = true },
    { type = "outfit", condition = false },
    { type = "bleed", condition = false },
}

mType:register(monster)
