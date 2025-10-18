local mType = Game.createMonsterType("Unholy Wizard")
local monster = {}

monster.description = "a unholy wizard"
monster.experience = 40000
monster.outfit = {
	lookType = 1675,
	lookHead = 114,
	lookBody = 57,
	lookLegs = 118,
	lookFeet = 114,
	lookAddons = 3,
	lookMount = 0,
}

monster.raceId = 71146
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
	
		{ name = "wand of starstorm", chance = 10000 },
	{ name = "mastermind potion", chance = 10000 },
	{ name = "violet crystal shard", chance = 7179, maxCount = 5 },
	{ name = "blue crystal shard", chance = 6923, maxCount = 5 },
	--{ name = "great spirit potion", chance = 61540, maxCount = 10 },
	--{ name = "ultimate health potion", chance = 56410, maxCount = 10 },
	{ name = "green crystal shard", chance = 56410, maxCount = 5 },
	----{ name = "great mana potion", chance = 46150, maxCount = 10 },
	{ name = "luminous orb", chance = 41030 },
	{ id = 23542, chance = 3846 }, -- collar of blue plasma
	{ name = "gold token", chance = 30770 },
	{ id = 282, chance = 3077 }, -- giant shimmering pearl
	{ name = "rusted armor", chance = 28210 },
	{ id = 3039, chance = 28210 }, -- red gem
	{ name = "small emerald", chance = 25640, maxCount = 10 },
	{ name = "small amethyst", chance = 25640, maxCount = 12 },
	{ name = "silver token", chance = 2564 },
	{ name = "small topaz", chance = 20510, maxCount = 10 },
	{ name = "small ruby", chance = 17950, maxCount = 18 },
	{ name = "spellbook of warding", chance = 15380 },
	{ name = "yellow gem", chance = 12820 },
	{ name = "small diamond", chance = 10260, maxCount = 10 },
	{ name = "white piece of cloth", chance = 10260, maxCount = 3 },
	{ name = "piece of hell steel", chance = 10260, maxCount = 3 },
	{ name = "blue gem", chance = 1026 },
	{ name = "green gem", chance = 1026 },
	{ name = "lightning legs", chance = 7690 },
	{ name = "violet gem", chance = 7690 },
	{ name = "spellweaver's robe", chance = 5130 },
	{ name = "demon helmet", chance = 5130 },
	{ name = "boots of haste", chance = 2560 },
	{ name = "demon shield", chance = 1250 },
	{ name = "demonbone amulet", chance = 1250 },
	{ name = "demonrage sword", chance = 1250 },
	{ name = "giant amethyst", chance = 1250 },
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	{ id = 3382, chance = 110 }, -- crown legs
	{ id = 3280, chance = 310 }, -- fire sword
	{ id = 3269, chance = 1610 }, -- halberd
	{ id = 39546, chance = 3 }, -- primal bag
    { name = "Sanguine Galoshes", chance = 55, maxCount = 1 },
	{ id = 3004, chance = 510 }, -- wedding ring
	{ name = "Sanguine Coil", chance = 15 },
	{ name = "greater mystic gem", chance = 350 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -5175 },
    { name = "combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -720, maxDamage = -1705, range = 7, radius = 1, shootEffect = 4, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -650, radius = 4, effect = 269, target = false },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -1450, radius = 2, shootEffect = 34, effect = 32, target = false },
	{ name = "strength", interval = 4000, chance = 20, range = 7, shootEffect = 38, effect = 270, target = false },
	{ name = "combat", interval = 2000, chance = 34, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -1200, range = 7, radius = 7, shootEffect = 36, effect = 12, target = true },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -1250, range = 7, radius = 7, shootEffect = 5, effect = 243, target = true },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -1700, length = 8, spread = 3, effect = 241, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -1500, length = 8, spread = 3, effect = 234, target = false },
}

monster.defenses = {
	defense = 104,
	armor = 104,
	mitigation = 3.16,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 5250, effect = CONST_ME_MAGIC_BLUE, target = false },
	
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = -30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)