local mType = Game.createMonsterType("Mestre dos Magos")
local monster = {}

monster.description = "a mestre dos magos"
monster.experience = 1500000
monster.outfit = {
	lookType = 1841,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 121,
	lookAddons = 3,
	lookMount = 0,
}

monster.events = {
	"DungeonBossDeath",
}

monster.bosstiary = {
	bossRaceId = 73679,
	bossRace = RARITY_NEMESIS,
}

monster.health = 2000000
monster.maxHealth = 2000000
monster.race = "blood"
monster.corpse = 30081
monster.speed = 280
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

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "dungeon demon hunter", chance = 13, interval = 1000, count = 2 },
		{ name = "dungeon demon killer", chance = 12, interval = 1000, count = 2 },
	},
}

monster.loot = {
	{ id = 3035, chance = 100000, maxCount = 40 }, -- platinum coin
	{ name = "crystal coin", chance = 4670, maxCount = 8 },
	{ id = 6558, chance = 30110 }, -- flask of demonic blood

	{ id = 3032, chance = 18010, maxCount = 8 }, -- small emerald
	{ name = "small enchanted ruby", chance = 9440, maxCount = 3 },
	{ id = 3030, chance = 11890, maxCount = 4 }, -- small ruby
	{ id = 9057, chance = 8560, maxCount = 2 }, -- small topaz
	{ name = "royal star", chance = 4050, maxCount = 3 },
	{ name = "diamond sceptre", chance = 150 },
	{ name = "terra amulet", chance = 500 },
	{ id = 8895, chance = 3300 }, -- rusted armor
	{ name = "small topaz", chance = 5280, maxCount = 2 },
	{ id = 44624, chance = 100 }, -- mystical dragon robe
	{ id = 49863, chance = 100 }, -- mystical dragon robe
	{ id = 49866, chance = 100 }, -- mystical dragon robe
	{ id = 49878, chance = 100 }, -- mystical dragon robe
	
	{ id = 49860, chance = 110 }, -- demonic essence
	{ id = 49872, chance = 200 }, -- focus cape
	{ id = 49869, chance = 400 }, -- golden lotus brooch
	{ id = 49887, chance = 180 }, -- magma coat
	{ id = 49881, chance = 220 }, -- mysterious fetish
	{ id = 49884, chance = 170 }, -- mystic turban
	{ id = 49875, chance = 110 }, -- oriental shoes


	{ id = 37111, chance = 330 }, -- Armillary Sphere
	{ id = 22154, chance = 340 }, -- Dark Wizard's Crown
	{ id = 37063, chance = 420 }, -- Evora

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1000, maxDamage = -4500 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -2600, range = 4, shootEffect = CONST_ANI_INFERNALBOLT, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -4400, radius = 4, effect = 274, target = true },
	{ name = "melee", interval = 1200, chance = 100, minDamage = 0, maxDamage = -77 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -66, maxDamage = -2720, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = 291, target = true },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -36, maxDamage = -5570, range = 7, shootEffect = CONST_ANI_ENERGY, effect = 286, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -4730, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -593, maxDamage = -3375, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 255,
	armor = 177,
	mitigation = 3.96,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 500, maxDamage = 5500, effect = CONST_ME_MAGIC_BLUE, target = false },
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
