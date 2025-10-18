local mType = Game.createMonsterType("Merlin Mage")
local monster = {}

monster.description = "a merlin mage"
monster.experience = 50000
monster.outfit = {
	lookType = 634,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0,
}

monster.raceId = 21146
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
	{ name = "giant amethyst", chance = 1250 },
	
    { name = "bullseye potion", minCount = 0, maxCount = 10, chance = 22000 },
	{ name = "berserk potion", minCount = 0, maxCount = 10, chance = 22000 },
	{ name = "gold token", minCount = 0, maxCount = 3, chance = 1800 },
	{ name = "silver token", minCount = 0, maxCount = 3, chance = 2500 },
	{ name = "green gem", chance = 19000 },
	{ id = 3039, chance = 18500 }, -- red gem
	{ name = "yellow gem", chance = 1850 },
	{ name = "giant sapphire", chance = 1680 },
	{ id = 23543, chance = 1520 }, -- collar of green plasma
	{ name = "magma coat", chance = 1520 },
	{ name = "gold ingot", minCount = 0, maxCount = 1, chance = 18000 },
	{ name = "red tome", chance = 18200 },
	{ id = 23529, chance = 1200 }, -- ring of blue plasma
	{ id = 23533, chance = 1200 }, -- ring of red plasma
	{ name = "young lich worm", chance = 5500 },
	{ name = "mortal mace", chance = 1300 },
	{ name = "golden hyaena pendant", chance = 100 },
	{ name = "bow of cataclysm", chance = 600 },
	{ name = "galea mortis", chance = 50 },
	{ name = "shadow cowl", chance = 30 },
	{ name = "toga mortis", chance = 50 },
	{ name = "greater sage gem", chance = 350 },
	
	
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	{ id = 3382, chance = 110 }, -- crown legs
	{ id = 3280, chance = 310 }, -- fire sword
	{ id = 39546, chance = 10 }, -- primal bag
    { name = "Arcanomancer Sigil", chance = 15, maxCount = 1 },
    { name = "Arboreal Crown", chance = 15, maxCount = 1 },
    { name = "Arboreal Tome", chance = 15, maxCount = 1 },
    { name = "Sanguine Galoshes", chance = 15, maxCount = 1 },
	{ name = "Sanguine Coil", chance = 25 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -5175 },
    { name = "combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -720, maxDamage = -1705, range = 7, radius = 1, shootEffect = 4, target = true },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -1450, radius = 2, shootEffect = 34, effect = 32, target = false },
	{ name = "strength", interval = 4000, chance = 20, range = 7, shootEffect = 38, effect = 270, target = false },
	{ name = "combat", interval = 2000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -600, maxDamage = -1200, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -1250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1700, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -1500, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 150,
	armor = 98,
	mitigation = 3.76,
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