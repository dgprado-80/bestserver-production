local mType = Game.createMonsterType("Rootthing Bug Tracker")
local monster = {}

monster.description = "a rootthing bug tracker"
monster.experience = 10600
monster.outfit = {
    lookType = 1763,
    lookHead = 85,
    lookBody = 1,
    lookLegs = 85,
    lookFeet = 105,
    lookAddons = 3,
    lookMount = 0,
}

monster.raceId = 1763
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

monster.health = 12500
monster.maxHealth = 12500
monster.race = "blood"
monster.corpse = 49147
monster.speed = 195
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
    targetDistance = 4,
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
    { text = "Ktsktskts!", yell = false },
    { text = "BRRRRN!!!", yell = false },
    { text = "FRRRRR!!!", yell = false },
}

monster.loot = {
    { name = "Platinum Coin", chance = 1000, minCount = 1, maxCount = 44 },
    { name = "Demon Root", chance = 800 },
    { name = "Resin Parasite", chance = 800 },
    { name = "Small Emerald", chance = 500 },
    { name = "Wood Cape", chance = 500 },
    { name = "Springsprout Rod", chance = 500 },
    { name = "Green Gem", chance = 200 },
    { name = "Golden Legs", chance = 50 },
    { name = "Composite Hornbow", chance = 50 },
    { name = "Preserved Pink Seed", chance = 50 },
    { name = "Preserved Red Seed", chance = 50 },
    { name = "Preserved Yellow Seed", chance = 50 },
}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400, effect = CONST_ME_CARNIPHILA },
    { name = "combat", interval = 3000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -900, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_HITAREA, target = true },
    { name = "combat", interval = 3200, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -800, maxDamage = -1000, radius = 4, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
    defense = 92,
    armor = 92,
    mitigation = 2.51,
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = -15 },
    { type = COMBAT_ENERGYDAMAGE, percent = -25 },
    { type = COMBAT_EARTHDAMAGE, percent = 0 },
    { type = COMBAT_FIREDAMAGE, percent = 15 },
    { type = COMBAT_LIFEDRAIN, percent = 0 },
    { type = COMBAT_MANADRAIN, percent = 0 },
    { type = COMBAT_DROWNDAMAGE, percent = 0 },
    { type = COMBAT_ICEDAMAGE, percent = 5 },
    { type = COMBAT_HOLYDAMAGE, percent = 0 },
    { type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
    { type = "paralyze", condition = true },
    { type = "outfit", condition = false },
    { type = "invisible", condition = true },
    { type = "bleed", condition = false },
}

mType:register(monster)
