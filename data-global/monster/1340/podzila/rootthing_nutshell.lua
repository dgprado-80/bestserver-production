local mType = Game.createMonsterType("Rootthing Nutshell")
local monster = {}

monster.description = "a rootthing nutshell"
monster.experience = 10430
monster.outfit = {
    lookType = 1760,  -- Substitua por lookType correto, se disponível.
    lookHead = 85,
    lookBody = 1,
    lookLegs = 85,
    lookFeet = 105,
    lookAddons = 3,
    lookMount = 0,
}

monster.raceId = 2540
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

monster.health = 13500
monster.maxHealth = 13500
monster.race = "blood"
monster.corpse = 49147  -- ID do cadáver, se disponível.
monster.speed = 190
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
    { text = "<CREEAK>", yell = false },
    { text = "<KNARRR>", yell = false },
    { text = "<KNOORRR>", yell = false },
}

monster.loot = {
    { name = "Platinum Coin", chance = 1000, minCount = 7, maxCount = 41 },
    { name = "Demon Root", chance = 800 },
    { name = "Terra Helmet", chance = 500 },
    { name = "Small Emerald", chance = 500 },
    { name = "Epee", chance = 500 },
    { name = "Resin Parasite", chance = 500 },
    { name = "Green Gem", chance = 200 },
    { name = "Swamplair Armor", chance = 200 },
    { name = "Ruthless Axe", chance = 50 },
    { name = "Preserved Pink Seed", chance = 50 },
    { name = "Preserved Red Seed", chance = 50 },
    { name = "Preserved Yellow Seed", chance = 50 },
}

monster.attacks = {
    { name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -800, effect = CONST_ME_CARNIPHILA },
    { name = "combat", interval = 3000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -900, effect = CONST_ME_HITAREA, target = false },
    { name = "combat", interval = 3200, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = -800, maxDamage = -1000, radius = 3, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
    defense = 85,
    armor = 85,
    mitigation = 2.31,
}

monster.elements = {
    { type = COMBAT_PHYSICALDAMAGE, percent = -25 },  -- 75% Physical damage reduction
    { type = COMBAT_ENERGYDAMAGE, percent = -15 },    -- 85% Energy damage reduction
    { type = COMBAT_EARTHDAMAGE, percent = 0 },       -- 0% Earth damage (no reduction)
    { type = COMBAT_FIREDAMAGE, percent = 15 },       -- 115% Fire damage (15% vulnerability)
    { type = COMBAT_LIFEDRAIN, percent = 0 },         -- 100% Life Drain damage
    { type = COMBAT_MANADRAIN, percent = 0 },         -- 100% Mana Drain damage
    { type = COMBAT_DROWNDAMAGE, percent = 0 },       -- 100% Drown damage
    { type = COMBAT_ICEDAMAGE, percent = 5 },         -- 105% Ice damage (5% vulnerability)
    { type = COMBAT_HOLYDAMAGE, percent = -5 },       -- 95% Holy damage reduction
    { type = COMBAT_DEATHDAMAGE, percent = 10 },      -- 110% Death damage (10% vulnerability)
}

monster.immunities = {
    { type = "paralyze", condition = true },
    { type = "invisible", condition = true },
    { type = "outfit", condition = false },
    { type = "bleed", condition = false },
}

mType:register(monster)
