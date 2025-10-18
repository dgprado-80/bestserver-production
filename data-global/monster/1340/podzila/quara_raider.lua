local mType = Game.createMonsterType("Quara Raider")
local monster = {}

monster.description = "a quara raider"
monster.experience = 9240
monster.outfit = {
	lookType = 1759,  -- Substitua por lookType correto, se disponível.
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2541
monster.Bestiary = {
	class = "Aquatic",
	race = BESTY_RACE_AQUATIC,
	toKill = 5000,
	FirstUnlock = 200,
	SecondUnlock = 2000,
	CharmsPoints = 100,
	Stars = 4,
	Occurrence = 3,
	Locations = "Podzilla Bottom, Podzilla Underwater",
}

monster.health = 12500
monster.maxHealth = 12500
monster.race = "blood"
monster.corpse = 48393  -- Substitua por ID do cadáver correto, se disponível.
monster.speed = 215
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 1,  -- Atacante corpo a corpo.
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
	{ text = '<blubber>', yell = false },
	{ text = 'Gloh! Gloooh!', yell = false },
	{ text = 'Boohacha!!!', yell = false },
}

monster.loot = {
	{ name = "Platinum Coin", chance = 1000, minCount = 1, maxCount = 25 },
	{ name = "Amber Souvenir", chance = 500 },
	{ id = 3039, chance = 2600 }, -- red gem
	{ name = "Skull Staff", chance = 200 },
	{ name = "Resinous Fish Fin", chance = 200 },
	{ name = "Glacier Robe", chance = 100 },
	{ name = "Blue Gem", chance = 100 },
	{ name = "Crystalline Armor", chance = 100 },
	{ name = "Quara Pincers", chance = 100 },
	{ name = "Abyss Hammer", chance = 50 },
	{ name = "Preserved Light Blue Seed", chance = 50 },
	{ name = "Preserved Purple Seed", chance = 50 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -500, range = 1, effect = CONST_ME_HITAREA, target = true },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -600, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 0, effect = CONST_ME_ENERGYAREA, target = false },
}

monster.defenses = {
	defense = 95,
	armor = 95,
	mitigation = 2.75,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },  -- 90% Physical damage reduction
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },     -- 110% Energy damage (10% vulnerability)
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },      -- 115% Earth damage (15% vulnerability)
	{ type = COMBAT_FIREDAMAGE, percent = -20 },      -- 80% Fire damage (20% resistance)
	{ type = COMBAT_LIFEDRAIN, percent = 0 },         -- 100% Life Drain damage
	{ type = COMBAT_MANADRAIN, percent = 0 },         -- 100% Mana Drain damage
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },       -- 100% Drown damage
	{ type = COMBAT_ICEDAMAGE, percent = 0 },         -- 0% Ice damage (immune)
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },      -- 90% Holy damage (10% resistance)
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },       -- 100% Death damage (no modification)
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "invisible", condition = true },
	{ type = "outfit", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
