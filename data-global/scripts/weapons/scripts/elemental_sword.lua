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
        elementIndex[playerId] = 1
    end
    return elements[elementIndex[playerId]]
end

local elementalCombat = Combat()
elementalCombat:setFormula(COMBAT_FORMULA_SKILL, 2 * 1.5, 4 * 1.5, 3 * 1.5, 6 * 1.5)

local elementalSword = Weapon(WEAPON_SWORD)

function elementalSword.onUseWeapon(player, variant)
    local playerId = player:getId()
    local element = getCurrentElement(playerId)
    elementalCombat:setParameter(COMBAT_PARAM_TYPE, element.type)
    elementalCombat:setParameter(COMBAT_PARAM_EFFECT, element.effect)
    return elementalCombat:execute(player, variant)
end

function changeElementSword(player)
    local playerId = player:getId()
    local currentTime = os.time()

    if not elementIndex[playerId] then
        elementIndex[playerId] = 1
    end
    if not lastChangeTime[playerId] then
        lastChangeTime[playerId] = {}
    end

    if lastChangeTime[playerId][20066] and (currentTime - lastChangeTime[playerId][20066] < 10) then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to wait before changing the element again.")
        return false
    end

    local weapon = player:getSlotItem(CONST_SLOT_LEFT) or player:getSlotItem(CONST_SLOT_RIGHT)
    if not weapon or weapon:getId() ~= 20066 then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to have the elemental sword equipped to change its element.")
        return false
    end

    elementIndex[playerId] = (elementIndex[playerId] % #elements) + 1
    local element = getCurrentElement(playerId)
    player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your sword's element has been changed to " .. element.name .. ".")
    lastChangeTime[playerId][20066] = currentTime
end

elementalSword:id(20066)
elementalSword:attack(50)
elementalSword:breakChance(0)
elementalSword:shootType(CONST_ANI_NONE)
elementalSword:maxHitChance(100)
elementalSword:register()

local changeElementSwordCommand = TalkAction("!changeswordelement")

function changeElementSwordCommand.onSay(player, words, param)
    changeElementSword(player)
    return false
end

changeElementSwordCommand:groupType("normal")
changeElementSwordCommand:separator(" ")
changeElementSwordCommand:register()
