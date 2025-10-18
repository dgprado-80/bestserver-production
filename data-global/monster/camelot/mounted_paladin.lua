local mType = Game.createMonsterType("Mounted Paladin")
local monster = {}

monster.description = "a mounted paladin"
monster.experience = 30000
monster.outfit = {
	lookType = 1618,
	lookHead = 114,
	lookBody = 57,
	lookLegs = 118,
	lookFeet = 114,
	lookAddons = 3,
	lookMount = 392,
}

monster.raceId = 31146
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

monster.health = 35000
monster.maxHealth = 35000
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
	targetDistance = 4,
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
	{ text = "You will die!", yell = false },
	{ text = "Im the lord of this fields!", yell = false },
	{ text = "Dieeeee!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 19075, maxCount = 35 },
	{ name = "crystal coin", chance = 19075, maxCount = 15 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
    { name = "giant topaz", chance = 575, maxCount = 1 },
    { name = "giant amethyst", chance = 575, maxCount = 1 },
	{ name = "demon shield", chance = 1250 },
	{ name = "demonbone amulet", chance = 1250 },
	
		{ name = "yellow gem", chance = 29600, maxCount = 2 },
	{ name = "royal star", chance = 26600, maxCount = 100 },
	{ id = 281, chance = 24000 }, -- giant shimmering pearl (green)
	{ name = "berserk potion", chance = 20300, maxCount = 10 },
	{ name = "blue gem", chance = 18500, maxCount = 2 },
	{ name = "bullseye potion", chance = 18500, maxCount = 10 },
	{ name = "magma coat", chance = 16600 },
	{ name = "terra rod", chance = 1100 },
	{ name = "crystal coin", chance = 9200 },
	{ name = "violet gem", chance = 9000 },
	{ name = "terra legs", chance = 8500 },
	{ name = "terra hood", chance = 7400 },
	{ name = "terra mantle", chance = 7250 },
	{ name = "magma amulet", chance = 5500 },
	{ name = "silver token", chance = 6000, maxCount = 4 },
	{ name = "gold ingot", chance = 5000 },
	{ name = "terra amulet", chance = 4800 },
	{ name = "giant sapphire", chance = 4800 },
	{ name = "magma monocle", chance = 3700 },
	{ name = "cobra club", chance = 700 },
	{ name = "cobra axe", chance = 600 },
	{ name = "cobra crossbow", chance = 600 },
	{ name = "cobra hood", chance = 400 },
	{ name = "cobra rod", chance = 650 },
	{ name = "cobra sword", chance = 650 },
	{ name = "cobra wand", chance = 650 },
	{ name = "cobra amulet", chance = 350 },
	{ name = "greater marksman gem", chance = 350 },
	
	
	
	
	{ name = "demonrage sword", chance = 1250 },
	{ name = "giant amethyst", chance = 1250 },
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	{ id = 3382, chance = 110 }, -- crown legs
	{ id = 3280, chance = 310 }, -- fire sword
	{ id = 3269, chance = 1610 }, -- halberd
	{ id = 39546, chance = 3 }, -- primal bag
    { name = "Alicorn Headguard", chance = 75, maxCount = 1 },
	{ id = 3004, chance = 510 }, -- wedding ring
	{ name = "inferniarch greataxe", chance = 85 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -3175 },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 800, maxDamage = -1900, range = 7, shootEffect = 23, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -220, maxDamage = -1405, range = 7, radius = 1, shootEffect = 31, effect = 224, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -1950, radius = 4, effect = 271, target = false },
	
}

monster.defenses = {
	defense = 80,
	armor = 78,
	mitigation = 2.76,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 5250, effect = CONST_ME_MAGIC_BLUE, target = false },
	
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)