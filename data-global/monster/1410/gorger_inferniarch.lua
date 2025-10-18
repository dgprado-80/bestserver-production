local mType = Game.createMonsterType("Gorger Inferniarch")
local monster = {}
    
monster.description = "a gorger inferniarch"
monster.experience = 7680
monster.outfit = {
	lookType = 1797,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2604
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
  
monster.health = 9450
monster.maxHealth = 9450
monster.race = "venom"
monster.corpse = 50010
monster.speed = 160
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
	{ text = "Kar Ath... Ul", yell = false },
	{ text = "Rezzz Kor ... Urrrgh!", yell = false }
}

monster.loot = {
    -- Comum
    { name = "platinum coin", chance = 10000, maxCount = 10 },
    -- Semi-Raro
    { name = "small sapphire", chance = 5000, maxCount = 10 },
    { name = "demonic core essence", chance = 5000, maxCount = 1 },
    { name = "gorger antlers", chance = 5000, maxCount = 1 },
    { id = 3093, chance = 5000, maxCount = 1 },
    { name = "spiked squelcher", chance = 5000, maxCount = 1 },
    -- Raro
    { name = "mummified demon finger", chance = 2500, maxCount = 1 },
    { name = "demonic matter", chance = 2500, maxCount = 1 },
    { id = 3053, chance = 2500, maxCount = 1 },
    -- Muito Raro
    { id = 3040, chance = 550, maxCount = 1 }
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -168, maxDamage = -500, range = 6, radius = 4, shootEffect = 32, effect = 18, target = true },
	{ name = "energy strike", interval = 2000, chance = 30, minDamage = -50, maxDamage = -180, range = 1, target = false },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 1000, chance = 15, radius = 3, effect = CONST_ME_YELLOWENERGY, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 74,
	mitigation = 1.99,
}
  
monster.elements = {
	{ type = "COMBAT_PHYSICALDAMAGE", percent = 0 },
	{ type = "COMBAT_DEATHDAMAGE", percent = 10 },
	{ type = "COMBAT_HOLYDAMAGE", percent = 0 },
	{ type = "COMBAT_ICEDAMAGE", percent = -10 },
	{ type = "COMBAT_FIREDAMAGE", percent = 20 },
	{ type = "COMBAT_ENERGYDAMAGE", percent = -10 },
	{ type = "COMBAT_EARTHDAMAGE", percent = 0 },
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