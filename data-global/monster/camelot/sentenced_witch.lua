local mType = Game.createMonsterType("Sentenced Witch")
local monster = {}

monster.description = "a sentenced witch"
monster.experience = 48000
monster.outfit = {
	lookType = 1385,
	lookHead = 114,
	lookBody = 71,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 3,
	lookMount = 0,
}

monster.raceId = 61146
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Old Fortress (north of Edron), Old Masonry, Forbidden Temple (Carlin).",
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 18076
monster.speed = 235
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 30,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 30,
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
	staticAttackChance = 30,
	targetDistance = 3,
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
	{ text = "I am the greate mage!", yell = false },
	{ text = "Shamalaaaaladuuu!", yell = false },
	{ text = "Hail king!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 8075, maxCount = 35 },
	{ name = "crystal coin", chance = 14075, maxCount = 15 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
    { name = "giant topaz", chance = 575, maxCount = 1 },
    { name = "giant amethyst", chance = 575, maxCount = 1 },
	{ name = "demon shield", chance = 1250 },
	{ name = "demonbone amulet", chance = 1250 },
	{ name = "demonrage sword", chance = 1250 },
	
		{ id = 3031, chance = 100000, maxCount = 100 }, -- gold coin
	{ id = 3035, chance = 100000, maxCount = 25 }, -- platinum coin
	{ id = 3033, chance = 100000, maxCount = 10 }, -- small amethyst
	{ id = 3028, chance = 100000, maxCount = 10 }, -- small diamond
	{ id = 238, chance = 100000, maxCount = 5 }, -- great mana potion
	{ id = 7643, chance = 100000, maxCount = 10 }, -- ultimate health potion
	{ id = 16119, chance = 100000, maxCount = 3 }, -- blue crystal shard
	{ id = 16121, chance = 100000, maxCount = 3 }, -- green crystal shard
	{ id = 16120, chance = 100000, maxCount = 3 }, -- violet crystal shard
	{ id = 3041, chance = 100000 }, -- blue gem
	{ id = 11454, chance = 2000 }, -- luminous orb
	{ id = 7440, chance = 2000 }, -- mastermind potion
	{ id = 3098, chance = 2000 }, -- ring of healing
	{ id = 3036, chance = 2000 }, -- violet gem
	{ id = 3324, chance = 1000 }, -- skull staff
	{ id = 3081, chance = 1000 }, -- stone skin amulet
	{ id = 3439, chance = 100 }, -- phoenix shield
	{ id = 7417, chance = 100 }, -- runed sword
	{ id = 22721, chance = 1000 }, -- gold token
	{ id = 22516, chance = 1000 }, -- silver token
	
	{ name = "giant amethyst", chance = 1250 },
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	{ id = 3382, chance = 110 }, -- crown legs
	{ id = 3280, chance = 310 }, -- fire sword
	{ id = 3269, chance = 1610 }, -- halberd
	{ id = 39546, chance = 3 }, -- primal bag
    { name = "Arcanomancer Sigil", chance = 15, maxCount = 1 },
    { name = "Sanguine Galoshes", chance = 15, maxCount = 1 },
	{ id = 3004, chance = 510 }, -- wedding ring

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -5175 },
    { name = "combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -720, maxDamage = -1705, range = 7, radius = 1, shootEffect = 4, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -1950, radius = 4, effect = 269, target = false },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -1450, radius = 2, shootEffect = 34, effect = 32, target = false },
	{ name = "strength", interval = 4000, chance = 20, range = 7, shootEffect = 38, effect = 270, target = false },
	{ name = "combat", interval = 2000, chance = 34, type = COMBAT_ICEDAMAGE, minDamage = -600, maxDamage = -1200, range = 7, radius = 7, shootEffect = 29, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_ICEDAMAGE, minDamage = -350, maxDamage = -1250, range = 7, radius = 7, shootEffect = 37, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -1700, length = 8, spread = 3, effect = 241, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -1500, length = 8, spread = 3, effect = 234, target = false },
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 5250, effect = CONST_ME_MAGIC_BLUE, target = false },
	
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = -30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)