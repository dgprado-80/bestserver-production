local elements = {
    {type = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREATTACK, missile = CONST_ANI_FIRE, name = "fire"},
    {type = COMBAT_ICEDAMAGE, effect = CONST_ME_ICEATTACK, missile = CONST_ANI_ICE, name = "ice"},
    {type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_ENERGYHIT, missile = CONST_ANI_ENERGY, name = "energy"},
    {type = COMBAT_EARTHDAMAGE, effect = CONST_ME_CARNIPHILA, missile = CONST_ANI_EARTH, name = "earth"}
}

local elementIndex = 1
local lastChangeTime = {}

local function getCurrentElement()
    return elements[elementIndex]
end

local elementalCombat = Combat()
elementalCombat:setParameter(COMBAT_PARAM_TYPE, elements[elementIndex].type)
elementalCombat:setParameter(COMBAT_PARAM_EFFECT, elements[elementIndex].effect)
elementalCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, elements[elementIndex].missile)
elementalCombat:setFormula(COMBAT_FORMULA_LEVELMAGIC, 0, 0.40, 0.40, 0.5)

local elementalWand = Weapon(WEAPON_WAND)

function elementalWand.onUseWeapon(player, variant)
    local element = getCurrentElement()
    elementalCombat:setParameter(COMBAT_PARAM_TYPE, element.type)
    elementalCombat:setParameter(COMBAT_PARAM_EFFECT, element.effect)
    elementalCombat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, element.missile)
    return elementalCombat:execute(player, variant)
end

-- Função para alternar os elementos
function changeWandElement(player)
    local playerId = player:getId()
    local currentTime = os.time()

    -- Verifica se o jogador está em cooldown
    if lastChangeTime[playerId] and (currentTime - lastChangeTime[playerId] < 10) then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to wait before changing the element again.")
        return false
    end

    -- Verifica se o jogador possui o cajado
    local weapon = player:getSlotItem(CONST_SLOT_LEFT) or player:getSlotItem(CONST_SLOT_RIGHT)
    if not weapon or weapon:getId() ~= 20078 then -- ID do cajado
        player:sendTextMessage(MESSAGE_FAILURE, "You need to have the elemental wand equipped to change its element.")
        return false
    end

    -- Alterna o elemento
    elementIndex = (elementIndex % #elements) + 1
    local element = getCurrentElement()
    player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your wand's element has been changed to " .. element.name .. ".")

    -- Atualiza o tempo da última troca
    lastChangeTime[playerId] = currentTime
end

elementalWand:id(20078) -- ID do cajado
elementalWand:level(900) -- Nível mínimo para usar o cajado
elementalWand:attack(40)
elementalWand:breakChance(0)
elementalWand:shootType(CONST_ANI_NONE)
elementalWand:maxHitChance(100)
elementalWand:range(5) -- Alcance de 5 sqm's
elementalWand:wieldUnproperly(true)
elementalWand:register()

-- Comando para mudar o elemento do cajado
local changeWandElementCommand = TalkAction("!changewandelement")

function changeWandElementCommand.onSay(player, words, param)
    changeWandElement(player)
    return false
end

-- Definir o groupType e registrar a TalkAction
changeWandElementCommand:groupType("normal")
changeWandElementCommand:separator(" ")
changeWandElementCommand:register()
