local mType = Game.createMonsterType("Dungeon Demon Killer")
local monster = {}

monster.description = "an dungeon demon killer"
monster.experience = 100000
monster.outfit = {
	lookType = 1823,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 51938
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

monster.health = 120000
monster.maxHealth = 120000
monster.race = "blood"
monster.corpse = 42247
monster.speed = 200
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
	canWalkOnEnergy = false,
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
	{ text = "The smell of fear follows you.", yell = false },
	{ text = "Your soul will burn.", yell = false },
}

monster.loot = {
	{ name = "violet gem", chance = 1390 },
	{ name = "crystal coin", chance = 760, maxCount = 4 },
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
	{ name = "crystal coin", chance = 64000 },
	--{ name = "ultimate health potion", chance = 22860, maxCount = 5 },
	{ name = "gold ingot", chance = 18860 },
	{ name = "cyan crystal fragment", chance = 7430 },
	{ name = "red crystal fragment", chance = 7430 },
	{ name = "blue crystal shard", chance = 5710 },
	{ name = "small diamond", chance = 4570 },
	{ name = "blue gem", chance = 4570 },
	{ name = "green crystal fragment", chance = 3430 },
	{ name = "magma amulet", chance = 3430 },
	{ name = "Rending Inferniarch Bow", chance = 60 },
	{ name = "Rending Inferniarch Warhammer", chance = 60 },
	{ name = "Rending Inferniarch Wand", chance = 60 },
	{ name = "Rending Inferniarch Greataxe", chance = 60 },
	{ name = "magma boots", chance = 2290 },
	{ name = "stone skin amulet", chance = 570 },
	{ id = 34109, chance = 10 }, -- bag you desire

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2850 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -850, maxDamage = -4400, range = 7, shootEffect = CONST_ANI_FIRE, effect = 270, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -3250, length = 8, effect = 288, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -900, maxDamage = -2350, radius = 4, effect = 273, target = false },
	{ name = "death chain", interval = 2000, chance = 20, minDamage = -1100, maxDamage = -2380, target = true },
}

monster.defenses = {
	defense = 190,
	armor = 170,
	mitigation = 4.10,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
