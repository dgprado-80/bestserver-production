local mType = Game.createMonsterType("Quara Plunderer")
local monster = {}

monster.description = "a quara plunderer"
monster.experience = 11500
monster.outfit = {
	lookType = 1758,  -- Substitua por lookType correto, se disponível.
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2542
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

monster.health = 13500
monster.maxHealth = 13500
monster.race = "blood"
monster.corpse = 48389  -- Substitua por ID do cadáver correto, se disponível.
monster.speed = 205
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
	{ text = 'Tssssh!!!', yell = false },
	{ text = 'BLUP! BLUP!', yell = false },
	{ text = 'Burp!', yell = false },
}

monster.loot = {
	{ name = "platinum coin", chance = 80000, maxCount = 25 },
	{ name = "Amber Souvenir", chance = 5000 },
	{ name = "Blue Gem", chance = 3000 },
	{ name = "Haunted Blade", chance = 2000 },
	{ id = 3039, chance = 2600 }, -- red gem
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -500, range = 5, shootEffect = CONST_ANI_HUNTINGSPEAR, target = false },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -600, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 0, effect = CONST_ME_ENERGYAREA, target = false },
}

monster.defenses = {
	defense = 90,
	armor = 90,
	mitigation = 2.45,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },   -- 100% Physical damage (no modification)
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },    -- 110% Energy damage (10% vulnerability)
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },     -- 110% Earth damage (10% vulnerability)
	{ type = COMBAT_FIREDAMAGE, percent = -20 },     -- 80% Fire damage (20% resistance)
	{ type = COMBAT_LIFEDRAIN, percent = 0 },        -- 100% Life Drain damage
	{ type = COMBAT_MANADRAIN, percent = 0 },        -- 100% Mana Drain damage
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },      -- 100% Drown damage
	{ type = COMBAT_ICEDAMAGE, percent = 0 },        -- 0% Ice damage (immune)
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },     -- 85% Holy damage (15% resistance)
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },    -- 90% Death damage (10% resistance)
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "invisible", condition = true },
	{ type = "outfit", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
