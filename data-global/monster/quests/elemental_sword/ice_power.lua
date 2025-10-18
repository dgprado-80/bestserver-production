local mType = Game.createMonsterType("Ice Power")
local monster = {}

monster.description = "Ice Power"
monster.experience = 1000000
monster.outfit = {
	lookType = 1315,
	lookHead = 78,
	lookBody = 113,
	lookLegs = 94,
	lookFeet = 18,
	lookAddons = 3,
	lookMount = 0,
}

monster.events = {
	"ElementalSwordIceBossDeath",
}

monster.bosstiary = {
	bossRaceId = 31279,
	bossRace = RARITY_NEMESIS,
}

monster.health = 1500000
monster.maxHealth = 1500000
monster.race = "blood"
monster.corpse = 26133
monster.speed = 50
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4,
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 98,
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
	maxSummons = 8,
	summons = {
		{ name = "Courage Leech", chance = 30, interval = 1000, count = 5 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "platinum coin", chance = 90000, maxCount = 53 },
	{ name = "crystal coin", chance = 90000, maxCount = 12 },
	--{ name = "great spirit potion", chance = 90000, maxCount = 8 },
	--{ name = "supreme health potion", chance = 90000, maxCount = 8 },
	--{ name = "ultimate mana potion", chance = 90000, maxCount = 10 },
	--{ name = "ultimate spirit potion", chance = 90000, maxCount = 8 },
	{ name = "silver token", chance = 90000, maxCount = 6 },
	{ name = "bullseye potion", chance = 90000 },
	{ name = "demon horn", chance = 90000 },
	{ name = "magic sulphur", chance = 90000 },
	{ id = 3039, chance = 90000 }, -- red gem
	{ name = "stone skin amulet", chance = 90000 },
	{ name = "yellow gem", chance = 90000 },
	{ name = "wand of voodoo", chance = 90000 },
	{ name = "mastermind potion", chance = 30000, maxCount = 2 },
	{ name = "onyx chip", chance = 30000, maxCount = 12 },
	{ name = "small diamond", chance = 30000, maxCount = 12 },
	{ name = "small emerald", chance = 30000, maxCount = 12 },
	{ name = "small ruby", chance = 30000, maxCount = 12 },
	{ name = "small topaz", chance = 30000, maxCount = 12 },
	{ name = "blue gem", chance = 30000 },
	{ name = "solid rage", chance = 30000 },
	{ name = "gold token", chance = 1000 },
	{ name = "butcher's axe", chance = 1000 },
	{ name = "dreaded cleaver", chance = 1000 },
	{ name = "mercenary sword", chance = 1000 },
	{ id = 28341, chance = 1000 }, -- tessellated wall
	{ name = "slightly rusted shield", chance = 5880 },
	{ name = "slightly rusted helmet", chance = 35290 },
	{ name = "epaulette", chance = 500 },
	{ name = "giant emerald", chance = 500 },
	{ name = "unliving demonbone", chance = 500 },
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, skill = 150, attack = 380 },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -6500, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -210, maxDamage = -5200, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = -210, maxDamage = -2600, range = 7, radius = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -3000, range = 7, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -2300, length = 10, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -4800, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -1800, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -1200, length = 10, spread = 0, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, radius = 8, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
	{ name = "devourer summon", interval = 2000, chance = 25, target = false },
}

monster.defenses = {
	defense = 140,
	armor = 140,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
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
