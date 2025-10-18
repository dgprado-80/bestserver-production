local mType = Game.createMonsterType("Broodrider Inferniarch")
local monster = {}
    
monster.description = "a broodrider inferniarch"
monster.experience = 7850
monster.outfit = {
	lookType = 1796,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2603
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Azzilon Castle",
}
  
monster.health = 9600
monster.maxHealth = 9600
monster.race = "venom"
monster.corpse = 50006
monster.speed = 165
monster.manaCost = 0
  
monster.events = { }
  
monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}
  
monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Mah...Hun Hur...!", yell = false }
}

monster.loot = {
    -- Comum
    { name = "platinum coin", chance = 10000, maxCount = 10 },
    -- Incomum
    { name = "blue crystal splinter", chance = 7500, maxCount = 1 },
    -- Semi-Raro
    { name = "drill bolt", chance = 5000, maxCount = 10 },
    { name = "power bolt", chance = 5000, maxCount = 10 },
    { name = "onyx chip", chance = 5000, maxCount = 10 },
    { name = "demonic core essence", chance = 5000, maxCount = 1 },
    { name = "broodrider saddle", chance = 5000, maxCount = 1 },
    -- Raro
    { name = "mummified demon finger", chance = 2500, maxCount = 1 },
    { name = "demonic matter", chance = 2500, maxCount = 1 },
    { name = "magma legs", chance = 2500, maxCount = 1 },
    -- Muito Raro
    { name = "arbalest", chance = 250, maxCount = 1 }
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -900, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 3100, chance = 37, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -1000, length = 7, spread = 0, effect = 47, target = false },
	{ name = "combat", interval = 2500, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -725, range = 5, shootEffect = 3, effect = CONST_ME_DRAWBLOOD, target = true },
	{ name = "combat", interval = 2700, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -180, maxDamage = -250, range = 1, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 68,
	armor = 70,
	mitigation = 2.05,
}
  
monster.elements = {
	{ type = "COMBAT_PHYSICALDAMAGE", percent = -5 },
	{ type = "COMBAT_DEATHDAMAGE", percent = 15 },
	{ type = "COMBAT_HOLYDAMAGE", percent = -10 },
	{ type = "COMBAT_ICEDAMAGE", percent = -15 },
	{ type = "COMBAT_FIREDAMAGE", percent = 20 },
	{ type = "COMBAT_ENERGYDAMAGE", percent = -10 },
	{ type = "COMBAT_EARTHDAMAGE", percent = 10 },
	{ type = "COMBAT_LIFEDRAIN", percent = 0 },
	{ type = "COMBAT_MANADRAIN", percent = 0 },
	{ type = "COMBAT_DROWNDAMAGE", percent = 0 }
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false }
}

mType.onAppear = function(monster, creature) end

mType.onThink = function(monster, interval) end
mType.onDisappear = function(monster, creature) end
mType.onMove = function(monster, creature, fromPosition, toPosition) end
mType.onSay = function(monster, creature, type, message) end

mType:register(monster)