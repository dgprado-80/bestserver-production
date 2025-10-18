local setting = {
    requiredLevel = 100,
    daily = true,

    -- Permitir de 1 até 4 jogadores
    minPlayers = 1,
    maxPlayers = 4,

    centerDemonRoomPosition = { x = 33221, y = 31659, z = 13 },
    demonsPositions = {
        { x = 33219, y = 31657, z = 13 },
        { x = 33221, y = 31657, z = 13 },
        { x = 33223, y = 31659, z = 13 },
        { x = 33224, y = 31659, z = 13 },
        { x = 33220, y = 31661, z = 13 },
        { x = 33222, y = 31661, z = 13 },
    },
    playersPositions = {
        { fromPos = { x = 33225, y = 31671, z = 13 }, toPos = { x = 33222, y = 31659, z = 13 } },
        { fromPos = { x = 33224, y = 31671, z = 13 }, toPos = { x = 33221, y = 31659, z = 13 } },
        { fromPos = { x = 33223, y = 31671, z = 13 }, toPos = { x = 33220, y = 31659, z = 13 } },
        { fromPos = { x = 33222, y = 31671, z = 13 }, toPos = { x = 33219, y = 31659, z = 13 } },
    },
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.itemid == 2772 then
        local players = {}

        -- Coleta todos os jogadores presentes nas posições
        for i = 1, #setting.playersPositions do
            local creature = Tile(setting.playersPositions[i].fromPos):getTopCreature()
            if creature and creature:isPlayer() then
                if creature:getLevel() < setting.requiredLevel then
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                        "All players must be level " .. setting.requiredLevel .. " or higher to start the quest.")
                    return true
                end
                table.insert(players, creature)
            end
        end

        -- Verifica a quantidade mínima e máxima de jogadores
        if #players < setting.minPlayers then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "At least " .. setting.minPlayers .. " player(s) are required to start the quest.")
            return true
        end

        if #players > setting.maxPlayers then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A maximum of " .. setting.maxPlayers .. " players can enter the quest.")
            return true
        end

        -- Checa se já tem alguém na sala
        if roomIsOccupied(setting.centerDemonRoomPosition, true, 4, 4) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
            return true
        end

        -- Cria os monstros
        for i = 1, #setting.demonsPositions do
            Game.createMonster("Angry Demon", setting.demonsPositions[i])
        end

        -- Teleporta apenas os jogadores presentes
        for i = 1, #players do
            local creature = players[i]
            local toPos = setting.playersPositions[i].toPos
            creature:teleportTo(toPos)
            toPos:sendMagicEffect(CONST_ME_TELEPORT)
        end

        item:transform(2773)
        item:decay()

    elseif item.itemid == 2773 then
        if setting.daily then
            player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return true
        end

        if roomIsOccupied(setting.centerDemonRoomPosition, true, 4, 4) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
            return true
        end

        Position(setting.centerDemonRoomPosition):sendMagicEffect(CONST_ME_POFF)
        item:transform(2772)
    end
    return true
end

lever:uid(30025)
lever:register()
