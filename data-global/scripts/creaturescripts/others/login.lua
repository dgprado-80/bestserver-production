local playerLogin = CreatureEvent("PlayerLogin")

function playerLogin.onLogin(player)
    -- Premium Ends Teleport to Temple, change addon (citizen) houseless
    local defaultTown = "Thais" -- default town where player is teleported if his home town is in premium area
    local freeTowns = { "Ab'Dendriel", "Carlin", "Kazordoon", "Thais", "Venore", "Rookgaard", "Dawnport", "Dawnport Tutorial", "Island of Destiny" } -- towns in free account area

    if not player:isPremium() and not table.contains(freeTowns, player:getTown():getName()) then
        local town = player:getTown()
        local sex = player:getSex()
        local home = getHouseByPlayerGUID(getPlayerGUID(player))
        town = table.contains(freeTowns, town:getName()) and town or Town(defaultTown)
        player:teleportTo(town:getTemplePosition())
        player:setTown(town)
        player:sendTextMessage(MESSAGE_FAILURE, "Your premium time has expired.")

        if sex == 1 then
            player:setOutfit({ lookType = 128, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0 })
        elseif sex == 0 then
            player:setOutfit({ lookType = 136, lookFeet = 114, lookLegs = 134, lookHead = 114, lookAddons = 0 })
        end

        if home and not player:isPremium() then
            setHouseOwner(home, 0)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "You've lost your house because you are not premium anymore.")
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, "Your items from house are send to your inbox.")
        end
    end

    -- Open channels
    if table.contains({ TOWNS_LIST.DAWNPORT, TOWNS_LIST.DAWNPORT_TUTORIAL }, player:getTown():getId()) then
        player:openChannel(3) -- World chat
    else
        player:openChannel(3) -- World chat
        player:openChannel(5) -- Advertising main
        if player:getGuild() then
            player:openChannel(0x00) -- guild
        end
    end

    -- Restaurar buffs ao logar
    local function restoreBuffs(player)
        local buffs = {
            {storage = 60000, conditionId = CONDITION_ATTRIBUTES, subId = 1, healthBonusPercent = 0.30, manaBonusPercent = 0.30},
            {storage = 60001, conditionId = CONDITION_ATTRIBUTES, subId = 2, healthGain = 15, manaGain = 15},
            {storage = 60002, conditionId = CONDITION_ATTRIBUTES, subId = 3, magicLevel = 10, skills = {sword = 10, axe = 10, club = 10, distance = 10}},
            {storage = 60003, conditionId = CONDITION_ATTRIBUTES, subId = 4, critChanceIncrease = 1000, critDamageIncrease = 1500}
        }

        for _, buff in ipairs(buffs) do
            local expirationTime = player:getStorageValue(buff.storage)
            if expirationTime > os.time() then
                local condition = Condition(buff.conditionId)
                condition:setParameter(CONDITION_PARAM_TICKS, (expirationTime - os.time()) * 1000)
                condition:setParameter(CONDITION_PARAM_SUBID, buff.subId)

                -- Configurar atributos específicos para cada buff
                if buff.subId == 1 then
                    condition:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, math.floor(player:getMaxHealth() * buff.healthBonusPercent))
                    condition:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, math.floor(player:getMaxMana() * buff.manaBonusPercent))
                elseif buff.subId == 2 then
                    condition:setParameter(CONDITION_PARAM_HEALTHGAIN, buff.healthGain)
                    condition:setParameter(CONDITION_PARAM_MANAGAIN, buff.manaGain)
                elseif buff.subId == 3 then
                    local vocation = player:getVocation():getId()
                    if vocation == 1 or vocation == 5 or vocation == 2 or vocation == 6 then
                        condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, buff.magicLevel)
                    elseif vocation == 3 or vocation == 7 then
                        condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, buff.skills.distance)
                    elseif vocation == 4 or vocation == 8 then
                        condition:setParameter(CONDITION_PARAM_SKILL_SWORD, buff.skills.sword)
                        condition:setParameter(CONDITION_PARAM_SKILL_AXE, buff.skills.axe)
                        condition:setParameter(CONDITION_PARAM_SKILL_CLUB, buff.skills.club)
                    end
                elseif buff.subId == 4 then
                    condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, buff.critChanceIncrease)
                    condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, buff.critDamageIncrease)
                end

                player:addCondition(condition)
            end
        end
    end

    -- Chamar a função para restaurar buffs ao logar
    restoreBuffs(player)

    return true
end

playerLogin:register()
