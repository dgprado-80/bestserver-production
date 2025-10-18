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

local elementalHammer = Weapon(WEAPON_CLUB)

function elementalHammer.onUseWeapon(player, variant)
    local playerId = player:getId()
    local element = getCurrentElement(playerId)
    elementalCombat:setParameter(COMBAT_PARAM_TYPE, element.type)
    elementalCombat:setParameter(COMBAT_PARAM_EFFECT, element.effect)
    return elementalCombat:execute(player, variant)
end

function changeElementHammer(player)
    local playerId = player:getId()
    local currentTime = os.time()

    if not elementIndex[playerId] then
        elementIndex[playerId] = 1
    end
    if not lastChangeTime[playerId] then
        lastChangeTime[playerId] = {}
    end

    if lastChangeTime[playerId][20081] and (currentTime - lastChangeTime[playerId][20081] < 10) then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to wait before changing the element again.")
        return false
    end

    local weapon = player:getSlotItem(CONST_SLOT_LEFT) or player:getSlotItem(CONST_SLOT_RIGHT)
    if not weapon or weapon:getId() ~= 20081 then
        player:sendTextMessage(MESSAGE_FAILURE, "You need to have the elemental hammer equipped to change its element.")
        return false
    end

    elementIndex[playerId] = (elementIndex[playerId] % #elements) + 1
    local element = getCurrentElement(playerId)
    player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your hammer's element has been changed to " .. element.name .. ".")
    lastChangeTime[playerId][20081] = currentTime
end

elementalHammer:id(20081)
elementalHammer:attack(50)
elementalHammer:breakChance(0)
elementalHammer:shootType(CONST_ANI_NONE)
elementalHammer:maxHitChance(100)
elementalHammer:register()

local changeElementHammerCommand = TalkAction("!changehammerelement")

function changeElementHammerCommand.onSay(player, words, param)
    changeElementHammer(player)
    return false
end

changeElementHammerCommand:groupType("normal")
changeElementHammerCommand:separator(" ")
changeElementHammerCommand:register()
