local mType = Game.createMonsterType("Rider Mage")
local monster = {}

monster.description = "a rider mage"
monster.experience = 30000
monster.outfit = {
	lookType = 665,
	lookHead = 114,
	lookBody = 57,
	lookLegs = 118,
	lookFeet = 114,
	lookAddons = 3,
	lookMount = 1321,
}

monster.raceId = 41146
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

monster.health = 39000
monster.maxHealth = 39000
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
	staticAttackChance = 90,
	targetDistance = 3,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
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
	{ name = "crystal coin", chance = 8075, maxCount = 25 },
	{ name = "crystal coin", chance = 1075, maxCount = 15 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
    { name = "giant topaz", chance = 575, maxCount = 1 },
    { name = "giant amethyst", chance = 575, maxCount = 1 },
	{ name = "demon shield", chance = 1250 },
	{ name = "demonbone amulet", chance = 1250 },
	{ name = "demonrage sword", chance = 1250 },
	
	{ name = "bullseye potion", minCount = 0, maxCount = 10, chance = 12000 },
	{ name = "mastermind potion", minCount = 0, maxCount = 10, chance = 12000 },
	{ name = "berserk potion", minCount = 0, maxCount = 10, chance = 12000 },
	{ name = "piece of draconian steel", minCount = 0, maxCount = 3, chance = 9000 },
	{ id = 3039, minCount = 0, maxCount = 2, chance = 12000 }, -- red gem
	{ name = "silver token", minCount = 0, maxCount = 2, chance = 9500 },
	{ id = 23542, chance = 5200 }, -- collar of blue plasma
	{ id = 23544, chance = 5200 }, -- collar of red plasma
	{ id = 23529, chance = 5000 }, -- ring of blue plasma
	{ id = 23533, chance = 5000 }, -- ring of red plasma
	{ name = "warrior helmet", chance = 11000 },
	{ name = "guardian axe", chance = 6400 },
	{ name = "gold ingot", minCount = 0, maxCount = 1, chance = 10000 },
	{ name = "young lich worm", chance = 5800 },
	{ name = "embrace of nature", chance = 1600 },
	{ name = "token of love", chance = 1200 },
	{ name = "rotten heart", chance = 1700 },
	{ name = "terra helmet", chance = 730 },
	
	{ name = "giant amethyst", chance = 1250 },
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	{ id = 3382, chance = 110 }, -- crown legs
	{ id = 3280, chance = 310 }, -- fire sword
	{ id = 3269, chance = 1610 }, -- halberd
	--{ id = 39546, chance = 20 }, -- primal bag
    { name = "Arcanomancer Sigil", chance = 55, maxCount = 1 },
    { name = "Arboreal Crown", chance = 55, maxCount = 1 },

	{ id = 3004, chance = 510 }, -- wedding ring

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -2175 },
{ name = "combat", interval = 2000, chance = 16, type = COMBAT_MANADRAIN, minDamage = -525, maxDamage = -1010, radius = 6, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -25, maxDamage = -210, radius = 9, effect = 214, target = false },
	{ name = "combat", interval = 2000, chance = 21, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -1650, radius = 9, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -2450, radius = 6, effect = CONST_ME_POFF, target = false },
}

monster.defenses = {
	defense = 100,
	armor = 88,
	mitigation = 3.46,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 5250, effect = CONST_ME_MAGIC_BLUE, target = false },
	
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)