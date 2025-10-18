local entrancePosition = Position(32363, 32241, 7)
local entranceItemId = 13458
local insidePosition = Position(32362, 32241, 7)
local waitPosition = Position(32364, 32241, 7)
local roomFromPosition = Position(32358, 32239, 7)
local roomToPosition = Position(32362, 32243, 7)
local maxTimeInRoom = 15 * 60 * 1000 -- 5 minutos em milissegundos

-- Armazenar o tempo de entrada de cada jogador
local playerEntryTimes = {}

local function isRoomOccupied()
    for x = roomFromPosition.x, roomToPosition.x do
        for y = roomFromPosition.y, roomToPosition.y do
            local tile = Tile(Position(x, y, roomFromPosition.z))
            if tile then
                local creatures = tile:getCreatures()
                if #creatures > 0 then
                    return true
                end
            end
        end
    end
    return false
end

local function onStepIn(creature, item, position, fromPosition)
    if item:getId() ~= entranceItemId then
        return true
    end

    local player = creature:getPlayer()
    if not player then
        return true
    end

    -- Verificar se o jogador está saindo da sala
    if fromPosition:isInRange(roomFromPosition, roomToPosition) then
        -- Remover o tempo de entrada do jogador ao sair
        playerEntryTimes[player:getId()] = nil
        player:teleportTo(waitPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You left the forge room before your time ended.")
        return true
    end

    -- Cancelar o evento anterior se existir
    local playerId = player:getId()
    if playerEntryTimes[playerId] then
        stopEvent(playerEntryTimes[playerId])
    end

    if isRoomOccupied() then
        player:teleportTo(waitPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The room is currently occupied. Please wait.")
    else
        player:teleportTo(insidePosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have 15 minutes to use the forge.")

        -- Salvar o evento para poder cancelar se necessário
        local event = addEvent(function()
            if player:isPlayer() then
                local currentPosition = player:getPosition()
                if currentPosition:isInRange(roomFromPosition, roomToPosition) then
                    player:teleportTo(waitPosition)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your time in the forge room has ended.")
                end
            end
        end, maxTimeInRoom)

        playerEntryTimes[playerId] = event
    end

    return true
end

local movement = MoveEvent()

function movement.onStepIn(creature, item, position, fromPosition)
    return onStepIn(creature, item, position, fromPosition)
end

movement:type("stepin")
movement:aid(13458)
movement:register()
