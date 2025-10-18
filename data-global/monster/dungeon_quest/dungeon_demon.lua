local mType = Game.createMonsterType("Dungeon Demon")
local monster = {}

monster.description = "a dungeon demon"
monster.experience = 60000
monster.outfit = {
	lookType = 1828,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 71930
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 5000,
	FirstUnlock = 200,
	SecondUnlock = 2000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Claustrophobic Inferno.",
}

monster.health = 70000
monster.maxHealth = 70000
monster.race = "blood"
monster.corpse = 42247
monster.speed = 220
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
	{ text = "Feel the heat!", yell = false },
	{ text = "Hand over your life.", yell = false },
	{ text = "I can give you a hand... or two.", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 58990 },
	--{ name = "ultimate health potion", chance = 29110, maxCount = 4 },
	{ name = "violet gem", chance = 1390 },
	{ name = "crystal coin", chance = 5760, maxCount = 1 },
	{ id = 3035, chance = 100000, maxCount = 8 }, -- platinum coin
	{ id = 7368, chance = 9210, maxCount = 5 }, -- assassin star
	{ id = 3027, chance = 9870, maxCount = 2 }, -- black pearl
	{ id = 6558, chance = 20540 }, -- flask of demonic blood
	{ id = 6499, chance = 10730 }, -- demonic essence
	{ id = 3028, chance = 15630, maxCount = 2 }, -- small diamond
	{ id = 3032, chance = 7750, maxCount = 2 }, -- small emerald
	{ id = 3030, chance = 7830, maxCount = 2 }, -- small ruby
	{ id = 3029, chance = 12690, maxCount = 2 }, -- small sapphire
	{ id = 9057, chance = 8120, maxCount = 2 }, -- small topaz
	{ id = 239, chance = 19960, maxCount = 2 }, -- great health potion
	{ id = 3026, chance = 8170, maxCount = 2 }, -- white pearl
	{ name = "epee", chance = 3290 },
	{ name = "crystal mace", chance = 1690 },
	{ name = "noble axe", chance = 1600 },
	{ name = "spellbook of mind control", chance = 1180 },
	{ name = "skull staff", chance = 930 },
	{ id = 23531, chance = 930 }, -- ring of green plasma
	{ name = "royal helmet", chance = 840 },
	{ name = "jade hammer", chance = 840 },
	{ name = "metal bat", chance = 760 },
	{ name = "diabolic skull", chance = 590 },
	{ name = "fire axe", chance = 590 },
	{ name = "Draining Inferniarch Greataxe", chance = 10 },
	{ name = "Draining Inferniarch Battleaxe", chance = 20 },
	{ name = "mastermind shield", chance = 20 },
	{ name = "Draining Inferniarch Blade", chance = 40 },
	{ name = "alloy legs", chance = 170 },
	{ id = 49532, chance = 10 }, -- bag you desire
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2950 },
	{ name = "combat", interval = 2000, chance = 24, type = COMBAT_FIREDAMAGE, minDamage = -1100, maxDamage = -4550, radius = 4, effect = 275, target = false },
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -2280, radius = 4, effect = 268, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1150, maxDamage = -3460, range = 7, effect = 277, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -3100, range = 7, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "destroy magic walls", interval = 1000, chance = 30 },
}

monster.defenses = {
	defense = 140,
	armor = 120,
	mitigation = 3.75,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -35 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
