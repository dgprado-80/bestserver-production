local function revertHorror()
    local melting = Tile(Position(32267, 31071, 14)):getTopCreature()
    local diference, pos, monster = 0, 0, false
    local specs, spec = Game.getSpectators(Position(32269, 31091, 14), false, false, 12, 12, 12, 12)
    for i = 1, #specs do
        spec = specs[i]
        if spec:isMonster() and spec:getName():lower() == "melting frozen horror" then
            local health = spec:getHealth()
            pos = spec:getPosition()
            spec:teleportTo(Position(32267, 31071, 14))
            diference = melting:getHealth() - health
            melting:addHealth(-diference)
            melting:teleportTo(pos)
            monster = true
        end
    end
    if not monster and melting then
        melting:remove()
    end
end

local function changeHorror()
    local meltingTile = Tile(Position(32267, 31071, 14))
    if not meltingTile then
        logger.error("Tile not exist on position '{}'", Position(32267, 31071, 14):toString())
        return
    end

    local meltingCreature = meltingTile:getTopCreature()
    local pos = 0
    local specs, spec = Game.getSpectators(Position(32269, 31091, 14), false, false, 12, 12, 12, 12)
    for i = 1, #specs do
        spec = specs[i]
        if spec:isMonster() and spec:getName():lower() == "solid frozen horror" then
            pos = spec:getPosition()
            spec:teleportTo(Position(32267, 31071, 14))
            meltingCreature:teleportTo(pos)
        end
    end
    addEvent(revertHorror, 20 * 1000)
end

local dragonEggPrepareDeath = CreatureEvent("DragonEggPrepareDeath")
function dragonEggPrepareDeath.onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
    if creature:getName():lower() == "dragon egg" and creature:isMonster() then
        creature:addHealth(200, false)
        return false -- Evita a morte do ovo
    end
    return true
end

dragonEggPrepareDeath:register()

local dragonEggHealthChange = CreatureEvent("DragonEggHealthChange")
function dragonEggHealthChange.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if creature:getName():lower() == "dragon egg" then
        if primaryType == COMBAT_HEALING then
            -- Garante que o ovo nunca tenha menos de 1 HP
            if creature:getHealth() > 200 then
                local damage = math.min(primaryDamage, creature:getHealth() - 200)
                doTargetCombatHealth(0, creature, COMBAT_ICEDAMAGE, -damage, -damage, CONST_ME_MAGIC_GREEN)
            end
            return false -- Impede qualquer morte por erro
        end

        if primaryType == COMBAT_FIREDAMAGE then
            creature:addHealth(primaryDamage, true)
            if creature:getHealth() == creature:getMaxHealth() then
                creature:say("The egg sends out a fiery eruption!\nWeakening the frozen horror significantly!", TALKTYPE_MONSTER_SAY)
                doTargetCombatHealth(0, creature, COMBAT_ICEDAMAGE, -1500, -1500, CONST_ME_MAGIC_GREEN)
                changeHorror()
            end
            return false
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

dragonEggHealthChange:register()
