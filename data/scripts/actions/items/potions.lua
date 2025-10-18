local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SUBID, 1001) -- SubID exclusivo para Berserk
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_SUBID, 1002) -- SubID exclusivo para Mastermind
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SUBID, 1003) -- SubID exclusivo para Bullseye
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local function magicshield(player)
    local condition = Condition(CONDITION_MANASHIELD)
    condition:setParameter(CONDITION_PARAM_TICKS, 60000)
    condition:setParameter(CONDITION_PARAM_MANASHIELD, math.min(player:getMaxMana(), 300 + 7.6 * player:getLevel() + 7 * player:getMagicLevel()))
    player:addCondition(condition)
end

-- Tempo de reutilização em segundos
local COOLDOWN_TIME = 600 -- 10 minutos

local potions = {
    [236] = { health = { 423, 592 }, vocations = { VOCATION.BASE_ID.PALADIN, VOCATION.BASE_ID.KNIGHT }, level = 50, description = "Only knights and paladins of level 50 or above may drink this fluid.", infinite = true },
    [237] = { mana = { 194, 312 }, level = 50, description = "Only players of level 50 or above may drink this fluid.", infinite = true },
    [238] = { mana = { 254, 423 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID, VOCATION.BASE_ID.PALADIN }, level = 80, description = "Only sorcerers, druids and paladins of level 80 or above may drink this fluid.", infinite = false },
    [239] = { health = { 718, 972 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 80, description = "Only knights of level 80 or above may drink this fluid.", infinite = false },
    [266] = { health = { 211, 296 }, infinite = true },
    [268] = { mana = { 127, 211 }, infinite = true },
    [6558] = { transform = { id = { 236, 237 } }, effect = CONST_ME_DRAWBLOOD, infinite = false },
    [7439] = { vocations = { VOCATION.BASE_ID.KNIGHT }, condition = berserk, effect = CONST_ME_MAGIC_RED, description = "Only knights may drink this potion.", text = "You feel stronger.", achievement = "Berserker", storage = 10001, infinite = false },
    [7440] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, condition = mastermind, effect = CONST_ME_MAGIC_BLUE, description = "Only sorcerers and druids may drink this potion.", text = "You feel smarter.", achievement = "Mastermind", storage = 10002, infinite = false },
    [7443] = { vocations = { VOCATION.BASE_ID.PALADIN }, condition = bullseye, effect = CONST_ME_MAGIC_GREEN, description = "Only paladins may drink this potion.", text = "You feel more accurate.", achievement = "Sharpshooter", storage = 10003, infinite = false },
    [7642] = { health = { 423, 592 }, mana = { 169, 338 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 80, description = "Only paladins of level 80 or above may drink this fluid.", infinite = false },
    [7643] = { health = { 1099, 1937 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 130, description = "Only knights of level 130 or above may drink this fluid.", infinite = false },
    [7644] = { combat = antidote, infinite = true },
    [7876] = { health = { 102, 152 }, infinite = true },
    [23373] = { mana = { 718, 972 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 130, description = "Only druids and sorcerers of level 130 or above may drink this fluid.", infinite = false },
    [23374] = { health = { 710, 980 }, mana = { 423, 592 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 130, description = "Only paladins of level 130 or above may drink this fluid.", infinite = false },
    [23375] = { health = { 1479, 2901 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 200, description = "Only knights of level 200 or above may drink this fluid.", infinite = false },
    [35563] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 14, func = magicshield, effect = CONST_ME_ENERGYAREA, description = "Only sorcerers and druids of level 14 or above may drink this potion.", storage = 10004, infinite = false },
}

local flaskPotion = Action()

function flaskPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or (type(target) == "userdata" and not target:isCreature()) then
        return false
    end

    local potion = potions[item:getId()]
    if not potion then
        return false -- Poção não encontrada na tabela
    end

    -- Verifica se a poção está em cooldown
    if potion.storage then
        local lastUse = player:getStorageValue(potion.storage)
        if lastUse > os.time() then
            player:say("You can't use this potion yet. Wait until the effect wears off.", MESSAGE_POTION)
            return true
        end
    end

    if not player:getGroup():getAccess() and (potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getBaseId())) then
        player:say(potion.description, MESSAGE_POTION)
        return true
    end

    -- Processa efeitos da poção
    if potion.health or potion.mana or potion.combat then
        if potion.health and target:isCreature() then
            doTargetCombatHealth(player, target, COMBAT_HEALING, potion.health[1], potion.health[2], CONST_ME_MAGIC_BLUE)
        end

        if potion.mana and target:isCreature() then
            doTargetCombatMana(0, target, potion.mana[1], potion.mana[2], CONST_ME_MAGIC_BLUE)
        end

        if potion.combat and target:isCreature() then
            potion.combat:execute(target, Variant(target:getId()))
        end

        if not potion.effect and target:getPosition() then
            target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        end

        player:addAchievementProgress("Potion Addict", 100000)
        target:say("Aaaah...", MESSAGE_POTION)

        local deactivatedFlasks = player:kv():get("talkaction.potions.flask") or false
        if not deactivatedFlasks and potion.flask then
            local container = Container(item:getParent().uid)
            if container then
                local storeInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
                if fromPosition.x == CONTAINER_POSITION and container ~= storeInbox and container:getEmptySlots() ~= 0 then
                    container:addItem(potion.flask, 1)
                else
                    player:addItem(potion.flask, 1)
                end
            else
                Game.createItem(potion.flask, 1, fromPosition)
            end
        end
    end

    player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ITEM_USE_POTION, player:isInGhostMode() and nil or player)

    if potion.func then
        potion.func(player)
        player:say("Aaaah...", MESSAGE_POTION)
        player:getPosition():sendMagicEffect(potion.effect)

        if potion.achievement then
            player:addAchievementProgress(potion.achievement, 100)
        end
    end

    if potion.condition then
        player:addCondition(potion.condition)
        player:say(potion.text, MESSAGE_POTION)
        player:getPosition():sendMagicEffect(potion.effect)
    end

    -- Coloca a poção em cooldown
    if potion.storage then
        player:setStorageValue(potion.storage, os.time() + COOLDOWN_TIME)
    end

    -- Verifica se a poção deve ser removida após o uso
    if not potion.infinite then
        item:remove(1)
    end

    if potion.transform then
        if item:getCount() >= 1 then
            item:remove(1)
            player:addItem(potion.transform.id[math.random(#potion.transform.id)], 1)
            item:getPosition():sendMagicEffect(potion.effect)
            player:addAchievementProgress("Demonic Barkeeper", 250)
            return true
        end
    end

    if not configManager.getBoolean(configKeys.REMOVE_POTION_CHARGES) then
        return true
    end

    -- Atualiza o tracker de suprimentos
    player:updateSupplyTracker(item)

    return true
end

-- Registra todas as poções configuradas
for index, value in pairs(potions) do
    flaskPotion:id(index)
end

flaskPotion:register()
