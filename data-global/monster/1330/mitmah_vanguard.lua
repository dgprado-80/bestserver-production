local mType = Game.createMonsterType("Mitmah Vanguard")
local monster = {}

monster.description = "an mitmah vanguard"
monster.experience = 300000
monster.outfit = {
	lookType = 1716,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 2464,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "venom"
monster.corpse = 44686
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	illusionable = true,
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
		{ name = "Mitmah Scout", chance = 100, interval = 2000, count = 2 },
		{ name = "Iks Yapunac", chance = 100, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Die, human. Now!", yell = true },
	{ text = "FEAR THE CURSE!", yell = true },
	{ text = "You're the intruder.", yell = true },
	{ text = "GOT YOU NOW!", yell = true },
}

monster.loot = {
	{ id = 44622, chance = 440 }, -- gear wheel
	{ id = 44623, chance = 440, maxCount = 1 }, -- gold coin
	{ id = 44621, chance = 440 }, -- health potion
	{ id = 44624, chance = 440 }, -- halberd
	{ name = "Gold Coin", chance = 9650, maxCount = 400 },
	{ name = "Crystal Coin", chance = 700,  maxCount = 2 },
	--{ name = "great spirit potion", chance = 2450 },
	--{ name = "ultimate mana potion", chance = 5450, maxCount = 15 },
	--{ name = "ultimate health potion", chance = 5450, maxCount = 15 },
	{ name = "Platinum Coin", chance = 2450, maxCount = 15 },
	
	    -- Comum
    { name = "gold coin", chance = 10000, maxCount = 380 },
    { name = "great health potion", chance = 10000, maxCount = 12 },
    ----{ name = "great mana potion", chance = 10000, maxCount = 13 },
    --{ name = "great spirit potion", chance = 10000, maxCount = 9 },
    { name = "crystal of the mitmah", chance = 10000, maxCount = 1 },
    { name = "broken mitmah necklace", chance = 10000, maxCount = 1 },
    -- Incomum
    { name = "white gem", chance = 5000, maxCount = 1 },
    { name = "blue gem", chance = 5000, maxCount = 1 },
    { name = "platinum coin", chance = 5000, maxCount = 60 },
    { name = "yellow gem", chance = 5000, maxCount = 2 },
    -- Raro
    { name = "broken mitmah chestplate", chance = 2500, maxCount = 1 },
    { name = "giant sapphire", chance = 2500, maxCount = 1 },
    { name = "splintered mitmah gem", chance = 2500, maxCount = 1 },
    -- Muito Raro
    { name = "stoic iks boots", chance = 700, maxCount = 1 },
    { name = "stoic iks casque", chance = 700, maxCount = 1 },
    { name = "stoic iks chestplate", chance = 700, maxCount = 1 },
    { name = "stoic iks culet", chance = 700, maxCount = 1 },
    { name = "stoic iks faulds", chance = 700, maxCount = 1 },
    { name = "stoic iks headpiece", chance = 700, maxCount = 1 },
    { name = "stoic iks sandals", chance = 700, maxCount = 1 },
    { name = "stoic iks cuirass", chance = 700, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -920 },
	{ name = "mitmah soulfire", interval = 2000, chance = 2, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -450, maxDamage = -1750, range = 3, radius = 6, effect = 45, target = false },
	{ name = "energy strike", interval = 2000, chance = 10, minDamage = -350, maxDamage = -900, range = 1, target = true },
	{ name = "mitmah electrify", interval = 2000, chance = 10, minDamage = -100, maxDamage = -1520, target = false },
	{ name = "mitmah ring", interval = 2000, chance = 10, minDamage = -300, maxDamage = -1220, target = false },
	{ name = "mitmah fire", interval = 2000, chance = 10, minDamage = -200, maxDamage = -1220, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 45,
	mitigation = 3.00,
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 5000, effect = CONST_ME_MAGIC_GREEN, target = false },

}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
}

mType:register(monster)
