local dustItemId = 37160
local exaltedCoreItemId = 37110
local sliverItemId = 37109
local chestItemId = 39505
local chestAid = 25440
local leverAid = 25441
local leverLeftId = 2772
local leverRightId = 2773

local tierUpgradeCosts = {

    [0] = 25000, -- Adicionado tier 0 com custo 0 (caso o item não tenha tier)
    [1] = 750000,
    [2] = 4000000,
    [3] = 8000000,
    [4] = 5000000,
    [5] = 10000000,
    [6] = 20000000,
    [7] = 65000000,
    [8] = 100000000,
    [9] = 250000000
    -- Continue até o nível desejado
}

-- Função para verificar se o item pode receber tiers
local function canReceiveTier(item)
    local classification = item:getClassification()  -- Método hipotético para obter a classificação do item
    local maxTier = 0

    if classification == 1 then
        maxTier = 1
    elseif classification == 2 then
        maxTier = 2
    elseif classification == 3 then
        maxTier = 3
    elseif classification == 4 then
        maxTier = 10
    end

    return maxTier >= item:getTier()
end

local function onUseLever(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getActionId() ~= leverAid then
        return false
    end

    local chest = Tile(Position(toPosition.x, toPosition.y - 1, toPosition.z)):getItemById(chestItemId)
    if not chest or chest:getActionId() ~= chestAid then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to place the items in the correct chest.")
        return false
    end

    local items = chest:getItems()
    if #items < 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need two identical items to perform the fusion.")
        return false
    end

    local itemToFuse1 = items[1]
    local itemToFuse2 = items[2]

    if itemToFuse1:getId() ~= itemToFuse2:getId() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The items must be identical to be fused.")
        return false
    end

    if itemToFuse1:getTier() ~= itemToFuse2:getTier() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The items must have the same tier to be fused.")
        return false
    end

    local classification1 = itemToFuse1:getClassification()
    local classification2 = itemToFuse2:getClassification()

    -- Verificar se ambos os itens têm uma classificação válida
    if classification1 <= 0 or classification2 <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "One or both items cannot be forged.")
        return false
    end

    -- Verificar se ambos os itens podem receber tiers
    if not canReceiveTier(itemToFuse1) or not canReceiveTier(itemToFuse2) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "One or both items cannot receive tiers.")
        return false
    end

    -- Cálculo do novo tier
    local currentTier1 = itemToFuse1:getTier()
    local currentTier2 = itemToFuse2:getTier()
    local newTier

    -- Ajustar para o caso específico de tier 0
    if currentTier1 == 0 and currentTier2 == 0 then
        newTier = 1
    else
        newTier = currentTier1 + currentTier2 -- Somar os tiers dos dois itens
    end

    local maxTier = 0

    if classification1 == 1 then
        maxTier = 1
    elseif classification1 == 2 then
        maxTier = 2
    elseif classification1 == 3 then
        maxTier = 3
    elseif classification1 == 4 then
        maxTier = 10
    end

    if newTier > maxTier then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The resulting tier exceeds the maximum allowed tier for the item's classification.")
        return false
    end

    -- Verificar se o tier atual existe na tabela de custos
    if not tierUpgradeCosts[currentTier1] then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Invalid tier (%d) for fusion. Please contact an administrator.", currentTier1))
        return false
    end

    local cost = tierUpgradeCosts[currentTier1]

    -- Verificar se o jogador tem dinheiro suficiente
    local playerMoney = player:getMoney()
    if not playerMoney or playerMoney < cost then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough money in your backpack.")
        return false
    end

    -- Remover o dinheiro do jogador
    player:removeMoney(cost)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Removed %d gold from your balance.", cost))

    local totalDusts = player:getForgeDusts()
    local hasEnoughDusts = totalDusts >= 100
    local exaltedCoreCount = player:getItemCount(exaltedCoreItemId)
    local usedExaltedCores = 1  -- Sempre usa um `Exalted Core` para a fusão

    if not hasEnoughDusts then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need at least 100 Dusts to perform the fusion.")
        return false
    end

    -- Calcular a chance de sucesso
    local baseChance = 50
    local additionalChance = math.min((usedExaltedCores - 1) * 20, 20)  -- Cada `Exalted Core` aumenta a chance de 50% para até 70%
    local successChance = baseChance + additionalChance

    player:removeForgeDusts(100)
    if exaltedCoreCount > 0 then
        player:removeItem(exaltedCoreItemId, 1)  -- Remove apenas 1 `Exalted Core` por tentativa
    end

    local success = math.random(100) <= successChance

    if success then
        -- Successful fusion
        itemToFuse1:setTier(newTier)
        itemToFuse2:remove()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Successful fusion! The item's tier has been increased.")

        -- Aplicar sorte apenas se a fusão for bem-sucedida
        local luckRoll = math.random(100)
        if luckRoll <= 5 then  -- 5% de chance de sorte
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lucky! The second item was not consumed in the process.")
            -- Não remove o segundo item
            player:addItem(itemToFuse2:getId(), 1)
        elseif luckRoll <= 10 then  -- 5% de chance de sorte
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lucky! The money was not consumed in the process.")
            player:addMoney(cost)  -- Devolve o dinheiro
        elseif luckRoll <= 15 then  -- 5% de chance de sorte
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lucky! The 100 Dusts were not consumed in the process.")
            player:addForgeDusts(100)  -- Devolve as Dusts
        elseif luckRoll <= 20 then  -- 5% de chance de sorte
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lucky! The Exalted Cores were not consumed in the process.")
            player:addItem(exaltedCoreItemId, 1)  -- Devolve o Exalted Core
        elseif luckRoll <= 25 then  -- 5% de chance de sorte
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Lucky! The fused item gained 2 tiers instead of 1.")
            itemToFuse1:setTier(newTier + 1)  -- Aumenta 2 tiers
        end
    else
        -- Fusion failed
        local reducedChance = exaltedCoreCount > 0 and 50 or 100  -- 50% de chance de que um item quebre ou que um item perca um nível
        if math.random(100) <= reducedChance then
            if currentTier1 > 0 then
                itemToFuse1:setTier(currentTier1 - 1)
                itemToFuse2:remove()
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Fusion failed. One of the items lost a tier.")
            else
                itemToFuse2:remove()
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Fusion failed. One of the items has been destroyed.")
            end
        else
            if currentTier1 > 0 then
                itemToFuse1:setTier(currentTier1 - 1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Fusion failed. One of the items lost a tier.")
            else
                itemToFuse2:remove()
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Fusion failed. One of the items has been destroyed.")
            end
        end
    end

    return true
end

-- Registering the lever action
local leverAction = Action()
leverAction:aid(leverAid)
function leverAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    return onUseLever(player, item, fromPosition, target, toPosition, isHotkey)
end
leverAction:register()