local mType = Game.createMonsterType("Brinebrute Inferniarch")
local monster = {}
    
monster.description = "a brinebrute inferniarch"
monster.experience = 23500
monster.outfit = {
	lookType = 1794,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2601
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
  
monster.health = 32000
monster.maxHealth = 32000
monster.race = "venom"
monster.corpse = 49998
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
	{ text = "Garrr...Garrr!", yell = false }
}

monster.loot = {
    -- Comum
    { name = "platinum coin", chance = 30000, maxCount = 10 },
    { name = "great spirit potion", chance = 30000, maxCount = 10 },
    { name = "brinebrute claw", chance = 30000, maxCount = 1 },
    -- Incomum
    { name = "blue crystal shard", chance = 5000, maxCount = 10 },
    { name = "green crystal shard", chance = 5000, maxCount = 10 },
    { name = "violet crystal shard", chance = 5000, maxCount = 10 },
    { name = "small sapphire", chance = 5000, maxCount = 10 },
    { name = "blue crystal splinter", chance = 1000, maxCount = 1 },
    { name = "green crystal splinter", chance = 5000, maxCount = 1 },
    { name = "brown crystal splinter", chance = 5000, maxCount = 1 },
    { id = 3039, chance = 1000, maxCount = 1 },
    -- Semi-Raro
    { name = "ultimate health potion", chance = 5000, maxCount = 10 },
    { name = "demonic core essence", chance = 5000, maxCount = 1 },
    { name = "demonic matter", chance = 5000, maxCount = 1 },
    { name = "bloodstained scythe", chance = 15000, maxCount = 1 },
    { name = "giant sword", chance = 15000, maxCount = 1 },
    { name = "green gem", chance = 15000, maxCount = 1 },
    { name = "might ring", chance = 15000, maxCount = 1 },
    { id = 3098, chance = 15000, maxCount = 1 },
    { name = "stone skin amulet", chance = 15000, maxCount = 1 },
    -- Raro
    { name = "mummified demon finger", chance = 10000, maxCount = 1 },
    { name = "gold ring", chance = 10000, maxCount = 1 },
    -- Muito Raro
    { name = "demonrage sword", chance = 200, maxCount = 1 },
    { name = "demon shield", chance = 200, maxCount = 1 },
    { name = "crusader helmet", chance = 200, maxCount = 1 }
}


monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 100, maxDamage = -700 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -650, length = 6, spread = 0, effect = 269, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -750, length = 8, spread = 0, effect = 271, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -450, radius = 3, effect = 243, target = true },
	{ name = "demon outcast skill reducer", interval = 2000, chance = 10, range = 5, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -80, maxDamage = -550, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 46,
	armor = 80,
	mitigation = 2.45,
}
  
monster.elements = {
	{ type = "COMBAT_PHYSICALDAMAGE", percent = 20 },
	{ type = "COMBAT_DEATHDAMAGE", percent = -10 },
	{ type = "COMBAT_HOLYDAMAGE", percent = 0 },
	{ type = "COMBAT_ICEDAMAGE", percent = 10 },
	{ type = "COMBAT_FIREDAMAGE", percent = 0 },
	{ type = "COMBAT_ENERGYDAMAGE", percent = 15 },
	{ type = "COMBAT_EARTHDAMAGE", percent = -10 },
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