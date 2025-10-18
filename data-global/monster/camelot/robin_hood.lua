local mType = Game.createMonsterType("Robin Hood")
local monster = {}

monster.description = "a robin hood"
monster.experience = 25000
monster.outfit = {
	lookType = 684,
	lookHead = 120,
	lookBody = 120,
	lookLegs = 120,
	lookFeet = 115,
	lookAddons = 3,
	lookMount = 0,
}

monster.raceId = 51146
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
	staticAttackChance = 60,
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
	{ name = "crystal coin", chance = 19075, maxCount = 25 },
	{ name = "crystal coin", chance = 19075, maxCount = 10 },
	{ name = "yellow gem", chance = 1575, maxCount = 5 },
    { name = "violet gem", chance = 1575, maxCount = 5 },
    { name = "gold ingot", chance = 2575, maxCount = 1 },
    { name = "giant emerald", chance = 2575, maxCount = 1 },
    { name = "giant topaz", chance = 575, maxCount = 1 },
	
	{ id = 3035, chance = 10000, maxCount = 50 }, -- platinum coin
	{ id = 3033, chance = 10000, maxCount = 10 }, -- small amethyst
	{ id = 3028, chance = 10000, maxCount = 10 }, -- small diamond
	{ id = 3030, chance = 10000, maxCount = 10 }, -- small ruby
	{ id = 9057, chance = 10000, maxCount = 10 }, -- small topaz
	{ id = 238, chance = 10000, maxCount = 100 }, -- great mana potion
	{ id = 7642, chance = 10000, maxCount = 100 }, -- great spirit potion
	{ id = 20062, chance = 12000, maxCount = 2 }, -- cluster of solace
	{ id = 16119, chance = 2000, maxCount = 3 }, -- blue crystal shard
	{ id = 16121, chance = 5000, maxCount = 5 }, -- green crystal shard
	{ id = 20062, chance = 2000, maxCount = 2 }, -- cluster of solace
	{ id = 16120, chance = 5000, maxCount = 3 }, -- violet crystal shard
	{ id = 281, chance = 6000 }, -- giant shimmering pearl (green)
	{ id = 3038, chance = 2000 }, -- green gem
	{ id = 7440, chance = 2000 }, -- mastermind potion
	{ id = 22195, chance = 200 }, -- onyx pendant
	{ id = 3039, chance = 1000 }, -- red gem
	{ id = 3006, chance = 2000 }, -- ring of the sky
	{ id = 7451, chance = 2000 }, -- shadow sceptre
	{ id = 8075, chance = 100 }, -- spellbook of lost souls
	{ id = 8073, chance = 100 }, -- spellbook of warding
	{ id = 3324, chance = 1000 }, -- skull staff
	{ id = 3037, chance = 1000 }, -- yellow gem
	{ id = 16096, chance = 100 }, -- wand of defiance
	{ id = 22721, chance = 100000 }, -- gold token
	{ id = 22516, chance = 100000 }, -- silver token
	{ id = 3341, chance = 200 }, -- arcane staff
	{ id = 24973, chance = 200 }, -- shadow mask
	{ id = 24974, chance = 20 }, -- shadow paint
	{ id = 22755, chance = 20 }, -- book of lies
	
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
	--{ id = 39546, chance = 10 }, -- primal bag
    { name = "Soulbleeder", chance = 55, maxCount = 1 },

	{ id = 3004, chance = 510 }, -- wedding ring

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -1175 },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 200, maxDamage = -900, range = 7, shootEffect = 23, target = false },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 30, maxDamage = -2000, range = 7, shootEffect = CONST_ANI_ARROW, target = false },

	
}

monster.defenses = {
	defense = 80,
	armor = 68,
	mitigation = 3.46,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 500, maxDamage = 2250, effect = CONST_ME_MAGIC_BLUE, target = false },
	
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