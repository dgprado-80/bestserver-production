local mType = Game.createMonsterType("The Best Beast")
local monster = {}

monster.description = "a best beast"
monster.experience = 2000000
monster.outfit = {
	lookType = 1798,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 121,
	lookAddons = 3,
	lookMount = 0,
}

monster.events = {
	"BossRewardScript",
}

monster.bosstiary = {
	bossRaceId = 76792,
	bossRace = RARITY_NEMESIS,
}

monster.health = 3000000
monster.maxHealth = 3000000
monster.race = "blood"
monster.corpse = 50029
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

--monster.summon = {
--	maxSummons = 4,
--	summons = {
--		{ name = "dungeon demon hunter", chance = 13, interval = 1000, count = 2 },
--		{ name = "dungeon demon killer", chance = 12, interval = 1000, count = 2 },
--	},
--}

monster.loot = {
	

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1000, maxDamage = -4500 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -3600, range = 4, shootEffect = CONST_ANI_INFERNALBOLT, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -4400, radius = 4, effect = 274, target = true },
	{ name = "melee", interval = 1200, chance = 100, minDamage = 0, maxDamage = -77 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -66, maxDamage = -4720, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = 244, target = true },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -36, maxDamage = -5570, range = 7, shootEffect = CONST_ANI_ENERGY, effect = 291, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -4730, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -593, maxDamage = -3375, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 255,
	armor = 177,
	mitigation = 3.96,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 40000, effect = CONST_ME_MAGIC_BLUE, target = false },
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
