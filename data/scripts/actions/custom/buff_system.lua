local buffs = {
    healthManaBoost = {name = "30% Health/Mana Boost", conditionId = CONDITION_ATTRIBUTES, subId = 1, duration = 5 * 24 * 60 * 60, storage = 60000, cooldown = 6 * 24 * 60 * 60},
    regenBoost = {name = "15% Regen Boost", conditionId = CONDITION_ATTRIBUTES, subId = 2, duration = 5 * 24 * 60 * 60, healthGain = 15, manaGain = 15, storage = 60001, cooldown = 6 * 24 * 60 * 60},
    skillBoost = {name = "Skill Boost +10", conditionId = CONDITION_ATTRIBUTES, subId = 3, duration = 5 * 24 * 60 * 60, storage = 60002, cooldown = 6 * 24 * 60 * 60},
    criticalHitBoost = {name = "Critical Hit Boost", conditionId = CONDITION_ATTRIBUTES, subId = 4, duration = 5 * 24 * 60 * 60, critChanceIncrease = 1000, critDamageIncrease = 1500, storage = 60003, cooldown = 6 * 24 * 60 * 60}
}

-- IDs dos itens que serão usados
local itemIDs = {
    healthManaBoostItem = 51964,  -- Item ID para Health/Mana Boost
    regenBoostItem = 51965,       -- Item ID para Regen Boost
    skillBoostItem = 51962,       -- Item ID para Skill Boost
    criticalHitBoostItem = 51963  -- Item ID para Critical Hit Boost
}

-- Função auxiliar para remover o item de qualquer lugar (mochila ou chão)
local function removeItemFromPosition(player, item, position)
    if item then
        local parent = item:getParent()
        if parent and parent:isContainer() or parent == player then
            player:removeItem(item.itemid, 1)
        else
            local tile = Tile(position)
            if tile then
                local groundItem = tile:getItemById(item.itemid)
                if groundItem then
                    groundItem:remove(1)
                end
            end
        end
    end
end

-- Função para verificar o cooldown
local function isOnCooldown(player, storageId)
    local lastUsed = player:getStorageValue(storageId)
    return lastUsed > os.time()
end

-- Função para aplicar um buff de atributos com condição e sub-ID
local function applyAttributeCondition(player, healthBonusPercent, manaBonusPercent, subId, duration)
    local cond = Condition(CONDITION_ATTRIBUTES)
    cond:setParameter(CONDITION_PARAM_TICKS, duration * 1000)  -- Duração em milissegundos
    cond:setParameter(CONDITION_PARAM_SUBID, subId)  -- Sub-ID para não sobrepor condições

    -- Calcular o aumento de 30% com base no valor atual de vida e mana
    if healthBonusPercent and manaBonusPercent then
        local currentHealth = player:getMaxHealth()
        local currentMana = player:getMaxMana()
        
        local healthBonus = math.floor(currentHealth * healthBonusPercent)
        local manaBonus = math.floor(currentMana * manaBonusPercent)

        cond:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, healthBonus)
        cond:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, manaBonus)
    end

    player:addCondition(cond)
end

-- Aplicar buff de vida/mana (30% de aumento)
function onUseHealthManaBoost(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar se o jogador está em cooldown
    if isOnCooldown(player, buffs.healthManaBoost.storage) then
        player:sendTextMessage(MESSAGE_LOOK, "You cannot use another Health/Mana Boost for 6 days.")
        return true
    end

    -- Aplicar o buff diretamente como uma condição com tempo de expiração
    applyAttributeCondition(player, 0.30, 0.30, buffs.healthManaBoost.subId, buffs.healthManaBoost.duration)  -- 30% de aumento
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a 30% increase in your Health and Mana for 5 days.")

    -- Armazenar o cooldown para 6 dias
    player:setStorageValue(buffs.healthManaBoost.storage, os.time() + buffs.healthManaBoost.cooldown)

    -- Remover o item após o uso
    removeItemFromPosition(player, item, fromPosition)
    return true
end

-- Aplicar buff de regeneração
function onUseRegenBoost(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar se o jogador está em cooldown
    if isOnCooldown(player, buffs.regenBoost.storage) then
        player:sendTextMessage(MESSAGE_LOOK, "You cannot use another Regen Boost for 6 days.")
        return true
    end

    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_TICKS, buffs.regenBoost.duration * 1000)
    condition:setParameter(CONDITION_PARAM_SUBID, buffs.regenBoost.subId)  -- Sub-ID para regeneração
    condition:setParameter(CONDITION_PARAM_HEALTHGAIN, buffs.regenBoost.healthGain)
    condition:setParameter(CONDITION_PARAM_MANAGAIN, buffs.regenBoost.manaGain)
    player:addCondition(condition)
    
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received the Regen Boost for 5 days.")
    
    -- Armazenar o cooldown para 6 dias
    player:setStorageValue(buffs.regenBoost.storage, os.time() + buffs.regenBoost.cooldown)

    -- Remover o item após o uso
    removeItemFromPosition(player, item, fromPosition)
    return true
end

-- Aplicar buff de habilidades
function onUseSkillBoost(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar se o jogador está em cooldown
    if isOnCooldown(player, buffs.skillBoost.storage) then
        player:sendTextMessage(MESSAGE_LOOK, "You cannot use another Skill Boost for 6 days.")
        return true
    end

    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_TICKS, buffs.skillBoost.duration * 1000)
    condition:setParameter(CONDITION_PARAM_SUBID, buffs.skillBoost.subId)  -- Sub-ID para habilidades
    
    -- Aplicar o buff de habilidades baseado na vocação
    local vocation = player:getVocation():getId()
    if vocation == 1 or vocation == 5 then
        condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 10)  -- +10 magic level
    elseif vocation == 2 or vocation == 6 then
        condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 10)
    elseif vocation == 3 or vocation == 7 then
        condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)
    elseif vocation == 4 or vocation == 8 then
        condition:setParameter(CONDITION_PARAM_SKILL_SWORD, 10)
        condition:setParameter(CONDITION_PARAM_SKILL_AXE, 10)
        condition:setParameter(CONDITION_PARAM_SKILL_CLUB, 10)
    end

    player:addCondition(condition)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received the Skill Boost for 5 days.")
    
    -- Armazenar o cooldown para 6 dias
    player:setStorageValue(buffs.skillBoost.storage, os.time() + buffs.skillBoost.cooldown)

    -- Remover o item após o uso
    removeItemFromPosition(player, item, fromPosition)
    return true
end

-- Aplicar buff de chance crítica e dano crítico
function onUseCriticalHitBoost(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar se o jogador está em cooldown
    if isOnCooldown(player, buffs.criticalHitBoost.storage) then
        player:sendTextMessage(MESSAGE_LOOK, "You cannot use another Critical Hit Boost for 6 days.")
        return true
    end

    local condition = Condition(CONDITION_ATTRIBUTES)
    condition:setParameter(CONDITION_PARAM_TICKS, buffs.criticalHitBoost.duration * 1000)
    condition:setParameter(CONDITION_PARAM_SUBID, buffs.criticalHitBoost.subId)  -- Sub-ID para Critical Hit Boost
    condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, buffs.criticalHitBoost.critChanceIncrease)
    condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, buffs.criticalHitBoost.critDamageIncrease)
    player:addCondition(condition)
    
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a Critical Hit Boost for 5 days. It increases both your critical hit chance and damage.")

    -- Armazenar o cooldown para 6 dias
    player:setStorageValue(buffs.criticalHitBoost.storage, os.time() + buffs.criticalHitBoost.cooldown)

    -- Remover o item após o uso
    removeItemFromPosition(player, item, fromPosition)
    return true
end

-- Registro dos actions baseados nos item IDs
function registerItemActions()
    local actionHealthManaBoost = Action()
    actionHealthManaBoost.onUse = onUseHealthManaBoost
    actionHealthManaBoost:id(itemIDs.healthManaBoostItem)
    actionHealthManaBoost:register()

    local actionRegenBoost = Action()
    actionRegenBoost.onUse = onUseRegenBoost
    actionRegenBoost:id(itemIDs.regenBoostItem)
    actionRegenBoost:register()

    local actionSkillBoost = Action()
    actionSkillBoost.onUse = onUseSkillBoost
    actionSkillBoost:id(itemIDs.skillBoostItem)
    actionSkillBoost:register()

    -- Registro da runa de aumento de chance de crítico e dano crítico
    local actionCriticalHitBoost = Action()
    actionCriticalHitBoost.onUse = onUseCriticalHitBoost
    actionCriticalHitBoost:id(itemIDs.criticalHitBoostItem)
    actionCriticalHitBoost:register()
end

registerItemActions()
