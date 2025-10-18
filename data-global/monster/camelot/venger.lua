local mType = Game.createMonsterType("Venger")
local monster = {}

monster.description = "venger"
monster.experience = 700000
monster.outfit = {
	lookType = 1795,
	lookHead = 57,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 95,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"CamelotBossDeath",
}

monster.bosstiary = {
	bossRaceId = 23679,
	bossRace = RARITY_NEMESIS,
}


monster.health = 2000000
monster.maxHealth = 2000000
monster.race = "blood"
monster.corpse = 50002
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 30,
	damage = 10,
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
	critChance = 10,
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
	maxSummons = 10,
	summons = {
		{ name = "merlin mage", chance = 60, interval = 1000, count = 3 },
		{ name = "sentenced witch", chance = 60, interval = 1000, count = 3 },
		{ name = "unholy wizard", chance = 60, interval = 1000, count = 3 },
		{ name = "robin hood", chance = 60, interval = 1000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You can't stop the future!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 8075, maxCount = 135 },
	{ name = "crystal coin", chance = 14075, maxCount = 25 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
    { name = "giant topaz", chance = 575, maxCount = 1 },
    { name = "giant amethyst", chance = 575, maxCount = 1 },
	
		{ name = "wand of starstorm", chance = 100000 },
	{ name = "mastermind potion", chance = 100000 },
	{ name = "violet crystal shard", chance = 71790, maxCount = 5 },
	{ name = "blue crystal shard", chance = 69230, maxCount = 5 },
	--{ name = "great spirit potion", chance = 61540, maxCount = 10 },
	--{ name = "ultimate health potion", chance = 56410, maxCount = 10 },
	{ name = "green crystal shard", chance = 56410, maxCount = 5 },
	----{ name = "great mana potion", chance = 46150, maxCount = 10 },
	{ name = "luminous orb", chance = 41030 },
	{ id = 23542, chance = 38460 }, -- collar of blue plasma
	{ name = "gold token", chance = 30770 },
	{ id = 282, chance = 30770 }, -- giant shimmering pearl
	{ name = "rusted armor", chance = 28210 },
	{ id = 3039, chance = 28210 }, -- red gem
	{ name = "small emerald", chance = 25640, maxCount = 10 },
	{ name = "small amethyst", chance = 25640, maxCount = 12 },
	{ name = "silver token", chance = 25640 },
	{ name = "small topaz", chance = 20510, maxCount = 10 },
	{ name = "small ruby", chance = 17950, maxCount = 18 },
	{ name = "spellbook of warding", chance = 15380 },
	{ name = "yellow gem", chance = 12820 },
	{ name = "small diamond", chance = 10260, maxCount = 10 },
	{ name = "white piece of cloth", chance = 10260, maxCount = 3 },
	{ name = "piece of hell steel", chance = 10260, maxCount = 3 },
	{ name = "blue gem", chance = 10260 },
	{ name = "green gem", chance = 10260 },
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
    { name = "Sanguine Galoshes", chance = 155, maxCount = 1 },
	{ name = "Sanguine Coil", chance = 255 },
	{ name = "Arcanomancer Sigil", chance = 155, maxCount = 1 },
    { id = 39546, chance = 170 }, -- primal bag
	{ id = 34109, chance = 130 }, --  bag you desire
	{ id = 43895, chance = 50 }, -- bag you vovet

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -5800 },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -2800, effect = CONST_ME_MAGIC_RED, target = false, radius = 3 },
	{ name = "doctor marrow explosion", interval = 10000, chance = 25, target = true, range = 1 },
	{ name = "fear", interval = 3500, chance = 10, target = true },
	{ name = "combat", interval = 4000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -1620, maxDamage = -3705, range = 7, radius = 1, shootEffect = 4, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -4950, radius = 4, effect = 269, target = false },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -1000, maxDamage = -3450, radius = 2, shootEffect = 34, effect = 32, target = false },
	{ name = "strength", interval = 4000, chance = 20, range = 7, shootEffect = 38, effect = 270, target = false },
	{ name = "combat", interval = 2000, chance = 34, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -3200, range = 7, radius = 7, shootEffect = 36, effect = 12, target = true },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -3250, range = 7, radius = 7, shootEffect = 5, effect = 243, target = true },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -3700, length = 8, spread = 3, effect = 241, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -4500, length = 8, spread = 3, effect = 234, target = false },
}

monster.defenses = {
	defense = 164,
	armor = 99,
	mitigation = 3.9,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 900, maxDamage = 10400, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
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
