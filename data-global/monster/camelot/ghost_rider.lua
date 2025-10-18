local mType = Game.createMonsterType("Ghost Rider")
local monster = {}

monster.description = "a ghost rider"
monster.experience = 36000
monster.outfit = {
	lookType = 1332,
	lookHead = 114,
	lookBody = 114,
	lookLegs = 132,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 1578,
}

monster.raceId = 11146
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 5000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Old Fortress (north of Edron), Old Masonry, Forbidden Temple (Carlin).",
}

monster.health = 40000
monster.maxHealth = 40000
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
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Dont run!", yell = true },
	{ text = "Feel my power!", yell = true },
	{ text = "Take this!", yell = false },
	{ text = "Let's see how good you are!", yell = false },
	{ text = "A challenge at last!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 2700, maxCount = 15 },
	{ name = "crystal coin", chance = 1075, maxCount = 15 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
	
	{ id = 6499, chance = 1000, maxCount = 2 }, -- demonic essence
	{ id = 7643, chance = 10000, maxCount = 100 }, -- ultimate health potion
	{ id = 238, chance = 10000, maxCount = 100 }, -- great mana potion
	{ id = 7642, chance = 10000, maxCount = 100 }, -- great spirit potion
	{ id = 20063, chance = 10, maxCount = 3 }, -- dream matter
	{ id = 20062, chance = 12000, maxCount = 14 }, -- cluster of solace
	{ id = 3041, chance = 10000, maxCount = 2 }, -- blue gem
	{ id = 16122, chance = 10000, maxCount = 10 }, -- green crystal splinter
	{ id = 16120, chance = 10000, maxCount = 15 }, -- violet crystal shard
	{ id = 6528, chance = 6000 }, -- infernal bolt

	{ id = 5914, chance = 6000 }, -- yellow piece of cloth
	{ id = 5911, chance = 6000 }, -- red piece of cloth
	{ id = 20276, chance = 1100 }, -- dream warden mask
	{ id = 281, chance = 6000 }, -- giant shimmering pearl (green)
	{ id = 5954, chance = 6000 }, -- demon horn
	{ id = 20274, chance = 100, unique = true }, -- nightmare horn
	{ id = 3052, chance = 6000 }, -- life ring

	
	
    { name = "giant topaz", chance = 575, maxCount = 1 },
    { name = "giant amethyst", chance = 575, maxCount = 1 },
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
	{ id = 43895, chance = 3 }, -- bag you covet
    { name = "Pair of Soulwalkers", chance = 15, maxCount = 1 },
	{ id = 3004, chance = 510 }, -- wedding ring
	{ id = 49530, chance = 35 },
	
	{ name = "Greater Guardian Gem", chance = 700, maxCount = 1 },
	{ name = "Silver Token", chance = 1075, maxCount = 4 },
	{ name = "Small Topaz", chance = 1175, maxCount = 5 },
    { name = "Small Sapphire", chance = 1575, maxCount = 5 },
    { name = "Spectral Horseshoe", chance = 25, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -5175 },
		{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -720, maxDamage = -1405, range = 7, radius = 1, shootEffect = 30, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -1350, radius = 4, effect = 270, target = false },
}

monster.defenses = {
	defense = 90,
	armor = 78,
	mitigation = 3.46,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 5250, effect = CONST_ME_MAGIC_BLUE, target = false },

}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
