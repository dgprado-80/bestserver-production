--UNKNOWN DATA

local mType = Game.createMonsterType("Norcferatu Minion")
local monster = {}

monster.description = "a norcferatu minion"
monster.experience = 4450 -- unknown
monster.outfit = {
	lookType = 1852,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 5700
monster.maxHealth = 5700
monster.race = "venom"
monster.corpse = 51533
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{ text = "Your essence will be mine!", yell = false },
	{ text = "I will feast on you!", yell = false },
	{ text = "Bloood!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 3000, maxCount = 100 },
	{ name = "platinum coin", chance = 3000, maxCount = 20 },
	{ name = "green crystal splinter", chance = 2000 },
	{ name = "heart amphora", chance = 1500 },
	{ name = "vampire teeth", chance = 1500 },
	{ name = "brown crystal splinter", chance = 1000 },
	{ name = "blue crystal splinter", chance = 1000 },
	{ name = "pot of orcish warpaint", chance = 500 },
	{ name = "war axe", chance = 500 },
	{ name = "chaos mace", chance = 300 },
	{ name = "greater garlic necklace", chance = 300 },
	{ name = "norcferatu talisman", chance = 100 },
	{ name = "vampire shield", chance = 100 },
}

monster.attacks = {
	-- Physical: Melee (150-280)
	{ name = "melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -280 },
	-- Physical: Fire Explosion (250-400)
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -400, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false },
	-- Death: Death Rain (270-320)
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -270, maxDamage = -320, radius = 5, effect = CONST_ME_MORTAREA, target = false },
	-- Heal: Lifesteal (30-60)
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -60, range = 5, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MAGIC_RED, target = true },
}

monster.defenses = {
	defense = 78,
	armor = 64,
	mitigation = 1.54,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = -30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
