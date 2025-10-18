local forgeLicenceItemId = 44527 -- Item ID da Forge Licence

-- Função para obter o tier máximo com base na classificação
local function getMaxTierByClassification(classification)
    if classification == 1 then
        return 1
    elseif classification == 2 then
        return 2
    elseif classification == 3 then
        return 3
    elseif classification == 4 then
        return 6
    else
        return 0 -- Retorna 0 se a classificação for inválida
    end
end

-- Função para verificar se o item pode receber tier
local function canApplyTier(item)
    local classification = item:getClassification() -- Método hipotético para obter a classificação do item
    return classification > 0 and getMaxTierByClassification(classification) > item:getTier()
end

local function onUseForgeLicence(player, item, targetItem)
    -- Verifica se o item usado é a Forge Licence
    if item:getId() ~= forgeLicenceItemId then
        return false
    end

    -- Verifica se o item alvo é válido
    if not targetItem then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to use the Forge Licence on a valid item.")
        return false
    end

    -- Verifica se o item pode receber um tier
    if not canApplyTier(targetItem) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item cannot receive a tier upgrade.")
        return false
    end

    -- Obtém o tier máximo baseado na classificação do item
    local maxTier = getMaxTierByClassification(targetItem:getClassification())
    local currentTier = targetItem:getTier()

    -- Aplica +1 tier, respeitando o limite máximo
    local newTier = math.min(currentTier + 1, maxTier)
    targetItem:setTier(newTier)

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The item's tier has increased to " .. newTier .. " (max: " .. maxTier .. ").")
    
    -- Remove a Forge Licence após o uso
    item:remove(1)
    
    return true
end

-- Registro do evento de uso da Forge Licence
local forgeLicenceAction = Action()

function forgeLicenceAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    return onUseForgeLicence(player, item, target)
end

forgeLicenceAction:id(forgeLicenceItemId)
forgeLicenceAction:register()
