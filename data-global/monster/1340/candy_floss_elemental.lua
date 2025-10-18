local mType = Game.createMonsterType("Candy Floss Elemental")
local monster = {}

monster.description = "a candy floss elemental"
monster.experience = 3380
monster.outfit = {
	lookType = 1749,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2533
monster.Bestiary = {
	class = "Plant",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Warzone 1, Rathleton Sewers, unreachable location in Tiquanda Laboratory.",
}

monster.health = 3700
monster.maxHealth = 3700
monster.race = "blood"
monster.corpse = 48346
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 80,
	targetDistance = 1,
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
	{ text = "Want fairy floss? I will feed you up!", yell = false },
}

monster.loot = {
-- Comum
    { name = "gold coin", chance = 6000, maxCount = 100 },  -- Quantidade máxima indefinida
    { name = "platinum coin", chance = 6000, maxCount = 20 },  -- Quantidade máxima indefinida
    -- Incomum
    { name = "fairy wings", chance = 5000, maxCount = 1 },
    -- Semi-Raro
    { name = "violet gem", chance = 700, maxCount = 1 },
    { name = "violet crystal shard", chance = 2500, maxCount = 1 },
    { name = "opal", chance = 500, maxCount = 1 },
    { name = "energy bar", chance = 500, maxCount = 1 },
    { name = "rainbow quartz", chance = 2500, maxCount = 1 },
    { name = "gummy rotworm", chance = 500, maxCount = 1 },
    { name = "wad of fairy floss", chance = 500, maxCount = 1 },
    -- Raro
    { name = "springsprout rod", chance = 350, maxCount = 1 },
    { name = "milk chocolate coin", chance = 350, maxCount = 3 },
    -- Muito Raro
    { id = 3093, chance = 300 }, -- club ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -330 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -180, maxDamage = -350, range = 7, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "poisonfield", interval = 2000, chance = 20, radius = 4, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -130, maxDamage = -260, length = 5, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -400, maxDamage = -640, range = 7, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 0,
	armor = 70,
	mitigation = 2.02,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 225, maxDamage = 380, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
