local mType = Game.createMonsterType("King Arthur")
local monster = {}

monster.description = "king arthur"
monster.experience = 40000
monster.outfit = {
	lookType = 1331,
	lookHead = 76,
	lookBody = 57,
	lookLegs = 78,
	lookFeet = 95,
	lookAddons = 1,
	lookMount = 1580,
}

monster.raceId = 1972
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Bounac, the Order of the Lion settlement.",
}

monster.health = 45000
monster.maxHealth = 45000
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
	staticAttackChance = 50,
	targetDistance = 1,
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
	{ text = "Only the king will tahe the excalibur!", yell = false },
	{ text = "Merlin kill him!", yell = false },
	{ text = "I am the king!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 9075, maxCount = 35 },
	{ name = "crystal coin", chance = 3075, maxCount = 25 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
    { name = "giant topaz", chance = 575, maxCount = 1 },
    { name = "giant amethyst", chance = 575, maxCount = 1 },
	{ name = "demon shield", chance = 1250 },
	{ name = "demonbone amulet", chance = 1250 },
	{ name = "demonrage sword", chance = 1250 },
	{ name = "giant amethyst", chance = 1250 },
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	
	{ id = 10345, chance = 6000 }, -- solitude charm
	{ id = 10344, chance = 6000 }, -- twin sun charm
	{ id = 10343, chance = 6000 }, -- spiritual charm
	{ id = 10342, chance = 6000 }, -- unity charm
	{ id = 10341, chance = 6000 }, -- phoenix charm
	
	{ id = 31738, chance = 200 }, -- demon horn
	{ id = 3035, chance = 100000, maxCount = 50 }, -- platinum coin
	{ id = 7643, chance = 100000, maxCount = 100 }, -- ultimate health potion
	{ id = 7642, chance = 100000, maxCount = 100 }, -- great spirit potion
	{ id = 238, chance = 100000, maxCount = 100 }, -- great mana potion
	{ id = 20279, chance = 25000 }, -- eye pod
	{ id = 20274, chance = 2500 }, -- nightmare horn

	{ id = 5741, chance = 2500 }, -- skull helmet
	{ id = 7417, chance = 2500, unique = true }, -- runed sword
	{ id = 20276, chance = 7000, unique = true }, -- dream warden mask
	{ id = 7418, chance = 1000 }, -- nightmare blade
	{ id = 820, chance = 1000 }, -- lightning boots
	{ id = 281, chance = 5000 }, -- giant shimmering pearl (green)
	{ id = 282, chance = 5000 }, -- giant shimmering pearl (brown)
		

	{ name = "Silver Token", chance = 1075, maxCount = 4 },
	{ name = "Small Topaz", chance = 1175, maxCount = 5 },
    { name = "Small Sapphire", chance = 1575, maxCount = 5 },
    { name = "Spiritual Horseshoe", chance = 35, maxCount = 1 },
	{ id = 3382, chance = 110 }, -- crown legs
	{ id = 3280, chance = 310 }, -- fire sword
	{ id = 3269, chance = 1610 }, -- halberd
	{ id = 39546, chance = 3 }, -- primal bag
    { name = "Alicorn Headguard", chance = 25, maxCount = 1 },
    { name = "Alicorn Ring", chance = 25, maxCount = 1 },
	{ name = "greater guardian gem", chance = 350 },

	{ id = 3004, chance = 510 }, -- wedding ring
	{ name = "inferniarch greataxe", chance = 45 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -1175 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -720, maxDamage = -3705, range = 7, radius = 1, shootEffect = 4, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -2950, radius = 4, effect = 269, target = false },
}

monster.defenses = {
	defense = 90,
	armor = 98,
	mitigation = 3.16,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 5250, effect = CONST_ME_MAGIC_BLUE, target = false },
	
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)