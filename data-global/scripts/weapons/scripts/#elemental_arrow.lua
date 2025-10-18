local elements = {
    {type = COMBAT_FIREDAMAGE, effect = CONST_ME_FIREATTACK, name = "fire"},
    {type = COMBAT_ICEDAMAGE, effect = CONST_ME_ICEATTACK, name = "ice"},
    {type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_ENERGYHIT, name = "energy"},
    {type = COMBAT_EARTHDAMAGE, effect = CONST_ME_CARNIPHILA, name = "earth"}
}

local elementIndex = {}
local lastChangeTime = {}

local function getCurrentElement(playerId)
    if not elementIndex[playerId] then
        elementIndex[playerId] = {}
        elementIndex[playerId][3239] = 1 -- Inicializa o índice para flechas elementais
    end
    return elements[elementIndex[playerId][3239]]
end

local elementalCombat = Combat()
elementalCombat:setFormula(COMBAT_FORMULA_SKILL, 0.6, 1.6, 1.4, 2.2)
local elementalArrowID = 3239

function onUseElementalArrow(player, variant)
    local playerId = player:getId()
    local element = getCurrentElement(playerId)
    elementalCombat:setParameter(COMBAT_PARAM_TYPE, element.type)
    elementalCombat:setParameter(COMBAT_PARAM_EFFECT, element.effect)
    return elementalCombat:execute(player, variant)
end

function changeElementArrow(player)
    local playerId = player:getId()
    local currentTime = os.time()

    if not elementIndex[playerId] then
        elementIndex[playerId] = {}
        elementIndex[playerId][3239] = 1 -- Inicializa o índice para flechas elementais
    end
    if not lastChangeTime[playerId] then
        lastChangeTime[playerId] = {}
    end

    if lastChangeTime[playerId][elementalArrowID] and (currentTime - lastChangeTime[playerId][elementalArrowID] < 10) then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to wait before changing the arrow element again.")
        return false
    end

    local quiver = player:getSlotItem(CONST_SLOT_LEFT)
    if not quiver or not quiver:isContainer() then
        quiver = player:getSlotItem(CONST_SLOT_RIGHT)
    end

    if not quiver or not quiver:isContainer() then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to have elemental arrows equipped in a quiver to change their element.")
        return false
    end

    local arrow = nil
    for i = 0, quiver:getSize() - 1 do
        local item = quiver:getItem(i)
        if item and item:getId() == elementalArrowID then
            arrow = item
            break
        end
    end

    if not arrow then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to have elemental arrows equipped in a quiver to change their element.")
        return false
    end

    elementIndex[playerId][elementalArrowID] = (elementIndex[playerId][elementalArrowID] % #elements) + 1
    local element = getCurrentElement(playerId)
    player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your arrows' element has been changed to " .. element.name .. ".")
    lastChangeTime[playerId][elementalArrowID] = currentTime
end

local changeElementArrowCommand = TalkAction("!changearrowelement")

function changeElementArrowCommand.onSay(player, words, param)
    changeElementArrow(player)
    return false
end

changeElementArrowCommand:groupType("normal")
changeElementArrowCommand:separator(" ")
changeElementArrowCommand:register()

local elementalArrow = Weapon(WEAPON_AMMO)

function elementalArrow.onUseWeapon(player, variant)
    return onUseElementalArrow(player, variant)
end

elementalArrow:id(3239)
elementalArrow:attack(28)
elementalArrow:action("removecount")
elementalArrow:ammoType("arrow")
elementalArrow:shootType(CONST_ANI_NONE)
elementalArrow:maxHitChance(100)
elementalArrow:register()
