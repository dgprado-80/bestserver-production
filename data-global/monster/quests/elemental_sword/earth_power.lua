local mType = Game.createMonsterType("Earth Power")
local monster = {}

monster.description = "Earth Power"
monster.experience = 1000000
monster.outfit = {
	lookType = 1144,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"ElementalSwordEarthBossDeath",
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.race = "blood"
monster.corpse = 30159
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.bosstiary = {
	bossRaceId = 31718,
	bossRace = RARITY_NEMESIS,
	
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
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

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Converter", chance = 30, interval = 1000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = 23542, chance = 6450 }, -- collar of blue plasma
	{ id = 23529, chance = 3230 }, -- ring of blue plasma
	{ id = 23531, chance = 16129 }, -- ring of green plasma
	{ id = 23533, chance = 9680 }, -- ring of red plasma
	{ id = 23543, chance = 9680 }, -- collar of green plasma
	{ id = 23544, chance = 12900 }, -- collar of red plasma
	{ id = 30342, chance = 2830 }, -- enchanted sleep shawl
	{ id = 3039, chance = 41940, maxCount = 2 }, -- red gem
	{ name = "abyss hammer", chance = 2830 },
	{ id = 3341, chance = 3130 }, -- arcane staff
	{ name = "beast's nightmare-cushion", chance = 3770 },
	{ name = "berserk potion", chance = 16129, maxCount = 9 },
	{ name = "blue gem", chance = 6450 },
	{ name = "bullseye potion", chance = 32259, maxCount = 19 },
	{ name = "chaos mace", chance = 10380 },
	{ name = "crystal coin", chance = 22580, maxCount = 3 },
	{ name = "dark whispers", chance = 3230 },
	{ name = "dragon figurine", chance = 7550 },
	{ name = "energy bar", chance = 91510 },
	{ name = "giant emerald", chance = 1890 },
	{ name = "giant ruby", chance = 6450 },
	{ name = "giant sapphire", chance = 2830 },
	{ id = 282, chance = 9680 }, -- giant shimmering pearl
	{ name = "gold ingot", chance = 16129 },
	{ name = "gold token", chance = 64150 },
	{ name = "green gem", chance = 19350 },
	{ name = "huge chunk of crude iron", chance = 38710 },
	{ name = "ice shield", chance = 9680 },
	{ name = "magic sulphur", chance = 8490 },
	{ name = "mastermind potion", chance = 12900, maxCount = 18 },
	{ name = "mysterious remains", chance = 93400 },
	{ name = "piggy bank", chance = 100000 },
	{ name = "piggy bank", chance = 94340 },
	{ name = "platinum coin", chance = 100000, maxCount = 9 },
	{ name = "purple tendril lantern", chance = 6600 },
	{ name = "ring of the sky", chance = 4720 },
	{ name = "royal star", chance = 48390, maxCount = 193 },
	{ name = "silver token", chance = 98110, maxCount = 4 },
	{ name = "skull staff", chance = 12900 },
	{ name = "soul stone", chance = 4720 },
	--{ name = "supreme health potion", chance = 58060, maxCount = 29 },
	{ name = "turquoise tendril lantern", chance = 7550 },
	--{ name = "ultimate mana potion", chance = 64519, maxCount = 29 },
	--{ name = "ultimate spirit potion", chance = 58060, maxCount = 24 },
	{ name = "violet gem", chance = 6450 },
	{ name = "yellow gem", chance = 45160, maxCount = 2 },
}

monster.attacks = {
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -3500, target = true }, -- basic attack (1000-3500)
	{ name = "death beam", interval = 2000, chance = 25, minDamage = -1000, maxDamage = -6100, target = false }, -- -_death_beam(1000-2100)
	{ name = "big death wave", interval = 2000, chance = 25, minDamage = -1000, maxDamage = -2000, target = false }, -- -_death_wave(1000-2000)
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -2000, maxDamage = -5000, radius = 5, effect = CONST_ME_MORTAREA, target = false }, -- -_great_death_bomb(700-1000)
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -1900, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -6000, range = 4, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -1200, length = 10, spread = 3, effect = CONST_ME_POFF, target = false },
}

monster.defenses = {
	defense = 120,
	armor = 80,
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 4000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "invisible", interval = 1000, chance = 4, effect = CONST_ME_MAGIC_BLUE },
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
