local mType = Game.createMonsterType("Arbaziloth")
local monster = {}

monster.description = "a arbaziloth"
monster.experience = 500000
monster.outfit = {
	lookType = 1798,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"ArbazilothBossOutFitDeath",
}

monster.bosstiary = {
	bossRaceId = 2598,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 1600000
monster.maxHealth = 1600000
monster.race = "undead"
monster.corpse = 50029
monster.speed = 200
monster.manaCost = 0



monster.changeTarget = {
	interval = 4000,
	chance = 40,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
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
	{ text = "I am superior!", yell = false },
	{ text = "You are mad to challenge a demon prince!", yell = false },
	{ text = "You can't stop me or my plans!", yell = false },
	{ text = "Pesky humans!", yell = false },
	{ text = "This insolence!", yell = false },
	{ text = "Nobody can stop me!", yell = false },
	{ text = "All will have to bow to me!", yell = false },
	{ text = "With this power I can crush everyone!", yell = false },
	{ text = "All that energy is mine!", yell = false },
	{ text = "Face the power of hell!", yell = false },
	{ text = "AHHH! THE POWER!!", yell = true }
}

monster.loot = {
	-- Comum
	{ name = "crystal coin", chance = 10000, maxCount = 3 },
	{ name = "platinum coin", chance = 10000, maxCount = 100 },
	-- Incomum
	{ name = "strong mana potion", chance = 5000, maxCount = 20 },
	{ name = "great mana potion", chance = 5000, maxCount = 15 },
	{ name = "great spirit potion", chance = 5000, maxCount = 6 },
	{ name = "ultimate mana potion", chance = 5000, maxCount = 40 },
	{ name = "ultimate health potion", chance = 5000, maxCount = 20 },
	{ name = "supreme health potion", chance = 5000, maxCount = 10 },
	{ name = "ultimate spirit potion", chance = 5000, maxCount = 15 },
	{ name = "blue gem", chance = 5000, maxCount = 2 },
	{ id = 36706, chance = 5000, maxCount = 2 },
	{ name = "yellow gem", chance = 5000, maxCount = 2 },
	-- Semi-Raro
	{ name = "devil helmet", chance = 2500 },
	{ name = "fire sword", chance = 2500 },
	{ name = "giant sword", chance = 2500 },
	{ name = "golden sickle", chance = 2500 },
	{ name = "ice rapier", chance = 2500 },
	{ id = 3052, chance = 2500 },
	{ name = "magma legs", chance = 2500 },
	{ name = "platinum amulet", chance = 2500 },
	{ id = 3098, chance = 2500 },
	{ name = "stone skin amulet", chance = 2500 },
	{ name = "strange helmet", chance = 2500 },
	{ name = "underworld rod", chance = 2500 },
	{ name = "wand of inferno", chance = 2500 },
	-- Raro
	{ name = "arbaziloth shoulder piece", chance = 1250 },
	{ name = "demon shield", chance = 1250 },
	{ name = "demonbone amulet", chance = 1250 },
	{ name = "demonrage sword", chance = 1250 },
	{ name = "giant amethyst", chance = 1250 },
	{ name = "giant ruby", chance = 1250 },
	{ name = "giant sapphire", chance = 1250 },
	{ name = "giant emerald", chance = 1250 },
	-- Muito Raro
	{ name = "demon claws", chance = 225 },
	{ id = 50061, chance = 225 },
	{ name = "demon in a green box", chance = 225 },
	{ name = "inferniarch arbalest", chance = 225 },
	{ name = "inferniarch battleaxe", chance = 225 },
	{ name = "inferniarch blade", chance = 225 },
	{ name = "inferniarch bow", chance = 225 },
	{ name = "inferniarch flail", chance = 225 },
	{ name = "inferniarch greataxe", chance = 225 },
	{ name = "inferniarch rod", chance = 225 },
	{ name = "inferniarch slayer", chance = 225 },
	{ name = "inferniarch wand", chance = 225 },
	{ name = "inferniarch warhammer", chance = 225 },
	{ name = "maliceforged helmet", chance = 225 },
	{ name = "hellstalker visor", chance = 225 },
	{ name = "dreadfire headpiece", chance = 225 },
	{ name = "demonfang mask", chance = 225 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 590, maxDamage = -4475 },
	{ name = "combat", interval = 2000, chance = 16, type = COMBAT_PHYSICALDAMAGE, minDamage = -1650, maxDamage = -4000, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = 269, target = true },
	{ name = "combat", interval = 2000, chance = 17, type = COMBAT_EARTHDAMAGE, minDamage = -550, maxDamage = -5550, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = 271, target = true },
	{ name = "combat", interval = 2500, chance = 14, type = COMBAT_EARTHDAMAGE, minDamage = -1330, maxDamage = -7130, length = 8, spread = 3, effect = 270, target = false },
	{ name = "combat", interval = 2500, chance = 22, type = COMBAT_MANADRAIN, minDamage = -850, maxDamage = -6100, range = 7, radius = 4, shootEffect = CONST_ANI_ICE, effect = CONST_ME_LOSEENERGY, target = true },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -300, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true, duration = 30000 },
	{ name = "condition", type = CONDITION_CURSED, interval = 2000, chance = 15, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK, target = true },
}

monster.defenses = {
	defense = 40,
	armor = 50,
	mitigation = 0.21,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 4000, maxDamage = 20000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = "COMBAT_PHYSICALDAMAGE", percent = 30 },
	{ type = "COMBAT_DEATHDAMAGE", percent = 20 },
	{ type = "COMBAT_HOLYDAMAGE", percent = 0 },
	{ type = "COMBAT_ICEDAMAGE", percent = 20 },
	{ type = "COMBAT_FIREDAMAGE", percent = 15 },
	{ type = "COMBAT_ENERGYDAMAGE", percent = 0 },
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

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onThink = function(monster, interval) end
mType.onDisappear = function(monster, creature) end
mType.onMove = function(monster, creature, fromPosition, toPosition) end
mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
