local mType = Game.createMonsterType("Twisterror")
local monster = {}

monster.description = "an twisterror"
monster.experience = 24000
monster.outfit = {
		lookType = 1792,
		lookHead = 0,
		lookBody = 0,
		lookLegs = 0,
		lookFeet = 0,
		lookAddons = 3,
		lookMount = 0,
	}
	
	monster.health = 35000
	monster.maxHealth = 35000
	monster.race = "undead"
	monster.corpse = 50039
	monster.speed = 160
	monster.manaCost = 0
	
	monster.changeTarget = {
		interval = 4000,
		chance = 10,
	}
	
	monster.strategiesTarget = {
		nearest = 80,
		health = 10,
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
	
	monster.voices = {
		interval = 5000,
		chance = 10,
		{ text = "I am superior!", yell = true },
		{ text = "You are mad to challange a demon prince!", yell = true },
		{ text = "You can't stop me or my plans!", yell = true },
		{ text = "Pesky humans!", yell = true },
		{ text = "This insolence!", yell = true },
		{ text = "Nobody can stop me!", yell = true },
		{ text = "All will have to bow to me!", yell = true },
		{ text = "With this power I can crush everyone!", yell = true },
		{ text = "All that energy is mine!", yell = true },
		{ text = "Face the power of hell!", yell = true },
		{ text = "AHHH! THE POWER!!", yell = true },
	}
	
	monster.loot = {
		{ id = 3035, chance = 99000, maxCount = 50 }, -- platinum coin		
		{ id = 49894, chance = 7000, maxCount = 1 }, -- demonic matter
		{ id = 49891, chance = 200, maxCount = 1 }, -- Skin of Twisterror
		{ id = 50054, chance = 7500, maxCount = 1 },
	
	}
	
	monster.attacks = {
		{ name = "melee", interval = 2000, chance = 100, minDamage = 400, maxDamage = -500 },
		}
	
	monster.defenses = {
		defense = 80,
		armor = 80,
		mitigation = 1.45,
		{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 600, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false },
	}
	
	monster.elements = {
		{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
		{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
		{ type = COMBAT_EARTHDAMAGE, percent = 0 },
		{ type = COMBAT_FIREDAMAGE, percent = 15 },
		{ type = COMBAT_LIFEDRAIN, percent = 0 },
		{ type = COMBAT_MANADRAIN, percent = 0 },
		{ type = COMBAT_DROWNDAMAGE, percent = 0 },
		{ type = COMBAT_ICEDAMAGE, percent = 20 },
		{ type = COMBAT_HOLYDAMAGE, percent = 0 },
		{ type = COMBAT_DEATHDAMAGE, percent = 20 },
	}
	
	monster.immunities = {
		{ type = "paralyze", condition = true },
		{ type = "outfit", condition = true },
		{ type = "invisible", condition = true },
		{ type = "bleed", condition = true },
	}
	
	
	mType.onAppear = function(monster, creature)
		if monster:getType():isRewardBoss() then
			monster:setReward(true)
		end
	end
	
	mType.onDisappear = function(monster, creature)
	
	end
	
	mType.onMove = function(monster, creature, fromPosition, toPosition) end
	
	mType.onSay = function(monster, creature, type, message) end
	
	mType:register(monster)
	
	
local maxMonsters = 6 -- Máximo de monstruos permitidos en el área
local aditionalMonsters = {
    { name = "Spellreaper Inferniarch", pos = Position(33814, 32297, 9) },
    { name = "Spellreaper Inferniarch", pos = Position(33816, 32297, 9) },
    { name = "Spellreaper Inferniarch", pos = Position(33816, 32300, 9) },
    { name = "Spellreaper Inferniarch", pos = Position(33812, 32298, 9) },
    { name = "Spellreaper Inferniarch", pos = Position(33812, 32301, 9) },
    { name = "Spellreaper Inferniarch", pos = Position(33814, 32300, 9) },
    { name = "Spellreaper Inferniarch", pos = Position(33816, 32300, 9) },
}

local areaTopLeft = Position(33805, 32289, 9) -- Esquina superior izquierda del área a verificar
local areaBottomRight = Position(33824, 32303, 9) -- Esquina inferior derecha del área a verificar

local accumulatedTime = 0
local summonInterval = 0
local activeSummons = {}

-- Función para contar cuántos monstruos hay en el área
local function countMonstersInArea(monsterName)
    local count = 0
    for x = areaTopLeft.x, areaBottomRight.x do
        for y = areaTopLeft.y, areaBottomRight.y do
            local tile = Tile(Position(x, y, areaTopLeft.z))
            if tile then
                local creatures = tile:getCreatures()
                for _, creature in ipairs(creatures) do
                    if creature:isMonster() and creature:getName():lower() == monsterName:lower() then
                        count = count + 1
                    end
                end
            end
        end
    end
    return count
end

local function validateAndSummonCreatures()
    -- Limpiar la lista de invocaciones activas eliminando criaturas muertas o inexistentes
    for i = #activeSummons, 1, -1 do
        if not Creature(activeSummons[i]) then
            table.remove(activeSummons, i)
        end
    end

    -- Contar cuántos monstruos hay en el área
    local currentCount = countMonstersInArea("Spellreaper Inferniarch")

    -- Si ya hay 6 o más, no invocar más
    if currentCount >= maxMonsters then
        return
    end

    -- Calcular cuántos monstruos faltan para llegar a 6
    local missingMonsters = maxMonsters - currentCount

    -- Invocar solo los necesarios hasta completar 6
    local summoned = 0
    for _, monsterData in ipairs(aditionalMonsters) do
        if summoned >= missingMonsters then
            break
        end
        local summon = Game.createMonster(monsterData.name, monsterData.pos)
        if summon then
            table.insert(activeSummons, summon:getId())
            summoned = summoned + 1
        end
    end
end

mType.onThink = function(monster, interval)
    accumulatedTime = accumulatedTime + interval
    if accumulatedTime >= summonInterval then
        validateAndSummonCreatures()
        accumulatedTime = 0
        summonInterval = math.random(8000, 12000) -- Entre 8 y 12 segundos
    end
end

	mType:register(monster)
	