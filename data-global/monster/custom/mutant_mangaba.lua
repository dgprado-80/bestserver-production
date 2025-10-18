local mType = Game.createMonsterType("Mutant Mangaba")
local monster = {}

monster.description = "a mutant mangaba"
monster.experience = 10000
monster.outfit = {
	lookType = 1393,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 121,
	lookAddons = 3,
	lookMount = 0,
}

monster.raceId = 42470
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "",
}

monster.health = 12500
monster.maxHealth = 12500
monster.race = "blood"
monster.corpse = 30081
monster.speed = 180
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
}

monster.loot = {
	{ id = 3035, chance = 100000, maxCount = 8 }, -- platinum coin
	{ name = "crystal coin", chance = 4670, maxCount = 1 },
	{ id = 6558, chance = 30110 }, -- flask of demonic blood
	{ id = 238, chance = 16560, maxCount = 2 }, -- great mana potion
	{ id = 3033, chance = 6810, maxCount = 2 }, -- small amethyst
	{ id = 3028, chance = 7500, maxCount = 2 }, -- small diamond
	{ id = 3032, chance = 18010, maxCount = 2 }, -- small emerald
	{ name = "small enchanted ruby", chance = 9440, maxCount = 3 },
	{ id = 3030, chance = 11890, maxCount = 2 }, -- small ruby
	{ id = 9057, chance = 8560, maxCount = 2 }, -- small topaz
	{ name = "royal star", chance = 4050, maxCount = 3 },
	{ id = 3041, chance = 1300 }, -- blue gem
	{ id = 3039, chance = 3800 }, -- red gem
	
	
	

	{ id = 44642, chance = 50 }, -- mystical dragon robe
	{ id = 44643, chance = 50 }, -- mystical dragon robe

	{ id = 6499, chance = 22110 }, -- demonic essence
	{ id = 8043, chance = 2200 }, -- focus cape
	{ id = 21974, chance = 100 }, -- golden lotus brooch
	{ id = 826, chance = 1980 }, -- magma coat
	{ name = "alchemist's notepad", chance = 420 },
	{ name = "antler-horn helmet", chance = 390 },
	{ name = "mutant bone kilt", chance = 450 },
	{ name = "mutated skin armor", chance = 430 },
	{ name = "mutated skin legs", chance = 410 },
	{ name = "stitched mutant hide legs", chance = 440 },
	{ name = "alchemist's boots", chance = 460 },
	{ name = "mutant bone boots", chance = 400 },
	{ id = 5944, chance = 2140 }, -- soul orb
	{ id = 8074, chance = 620 }, -- spellbook of mind control
	{ id = 3071, chance = 1440 }, -- wand of inferno
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -600, range = 4, shootEffect = CONST_ANI_INFERNALBOLT, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -400, radius = 4, effect = CONST_ME_ENERGYAREA, target = true },
	{ name = "melee", interval = 1200, chance = 100, minDamage = 0, maxDamage = -77 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -330, maxDamage = -1578, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -66, maxDamage = -1720, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -36, maxDamage = -570, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -70, maxDamage = -473, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -59, maxDamage = -375, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 55,
	armor = 77,
	mitigation = 2.16,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 2500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 320, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
