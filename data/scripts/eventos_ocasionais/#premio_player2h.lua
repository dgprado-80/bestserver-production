-- Lista de itens a serem sorteados (exemplo com IDs de itens)
local prizeItems = {43864, 43865, 43866, 43867, 43868, 43869, 43870, 43871, 43872, 43873, 43874, 43875, 43876, 43877, 43878, 43879, 43880, 43881, 43882, 43883, 43884, 43885, 43886, 43887, 34083, 34084, 34085, 34086, 34087, 34088, 34089, 34090, 34091, 34092, 34093, 34094, 34095, 34096, 34097, 34098, 34099, 39147, 39148, 39149, 39150, 39151, 39152, 39153, 39154, 39183, 39186, 34150, 34151, 34152, 34153, 34155, 34156, 34157, 34158, 34254, 34154, 34253,27647, 27648, 27649, 27650, 27651, 30393, 31631, 30394, 30395, 30396, 30397, 30398, 30399, 30400,28714, 28715, 28716, 28717, 28718, 28719, 28720, 28721, 28722, 28723, 28724, 28725, 44740, 3278, 7455, 7409, 20084, 44352, 22120, 44055 } -- IDs dos itens
local prizeStorage = 760000 -- Storage para rastrear quantos premios o jogador já recebeu
local maxPrizeCount = 1 -- Máximo de prêmios que um jogador pode receber
local pendingPrizeStorage = 760001 -- Storage temporário para rastrear se um jogador tem um prêmio pendente
local pendingPlayer = nil -- Armazena o jogador pendente
local pendingPrizeItem = nil -- Armazena o item do prêmio pendente

-- Função que dá o prêmio pendente ao jogador apos 5 minutos se ele tiver espaço
local function checkPendingPrize()
    if pendingPlayer then
        local backpack = pendingPlayer:getSlotItem(CONST_SLOT_BACKPACK)
        if backpack then
            if pendingPlayer:getFreeCapacity() >= ItemType(pendingPrizeItem):getWeight() then
                if backpack:addItem(pendingPrizeItem, 1) then
                    -- Atualiza a storage do jogador corretamente
                    local currentPrizes = pendingPlayer:getStorageValue(prizeStorage)
                    if currentPrizes < 0 then
                        currentPrizes = 0
                    end
                    pendingPlayer:setStorageValue(prizeStorage, currentPrizes + 1)
                    Game.broadcastMessage("Jogador " .. pendingPlayer:getName() .. " recebeu o prêmio: " .. ItemType(pendingPrizeItem):getName() .. "!")
                    pendingPlayer:setStorageValue(pendingPrizeStorage, -1) -- Limpa o status do prêmio pendente
                    pendingPlayer = nil
                    pendingPrizeItem = nil
                    return
                end
            else
                pendingPlayer:sendTextMessage(MESSAGE_ADMINISTRATOR, "Voce nao tem capacidade suficiente para carregar o premio. Outro jogador sera selecionado.")
                Game.broadcastMessage("Jogador " .. pendingPlayer:getName() .. " nao tem capacidade suficiente. Outro jogador sera selecionado.")
                pendingPlayer:setStorageValue(pendingPrizeStorage, -1) -- Limpa o status do prêmio pendente
                pendingPlayer = nil
                pendingPrizeItem = nil
            end
        end
    else
        Game.broadcastMessage("O jogador pendente nao esta mais online. Outro jogador sera selecionado.")
    end

    -- Se o jogador estiver offline ou ainda não conseguir receber o prêmio, seleciona outro jogador
    rafflePlayerAndGivePrize()
end

-- Função que seleciona um jogador online e dá um prêmio
function rafflePlayerAndGivePrize()
    -- Se houver um prêmio pendente, pula o sorteio atual
    if pendingPlayer then
        Game.broadcastMessage("Ainda ha um prêmio pendente. O próximo sorteio ocorrerá em 5 minutos se não houver espaço.")
        return
    end

    local players = Game.getPlayers()
    if #players == 0 then
        Game.broadcastMessage("Nenhum jogador online para o sorteio.")
        return
    end

    -- Filtra jogadores que ainda são elegíveis para receber premios e que não têm o nome "God Daniel"
    local eligiblePlayers = {}
    for _, player in ipairs(players) do
        local currentPrizes = player:getStorageValue(prizeStorage)
        if currentPrizes < maxPrizeCount and player:getName() ~= "God Daniel" then
            table.insert(eligiblePlayers, player)
        end
    end

    if #eligiblePlayers == 0 then
        Game.broadcastMessage("Nenhum jogador elegível para o sorteio.")
        return
    end

    -- Seleciona um jogador aleatoriamente da lista de elegíveis
    local randomPlayer = eligiblePlayers[math.random(1, #eligiblePlayers)]
    local prizeItem = prizeItems[math.random(1, #prizeItems)]

    pendingPlayer = randomPlayer
    pendingPrizeItem = prizeItem

    Game.broadcastMessage("Jogador " .. randomPlayer:getName() .. " foi sorteado para receber um prêmio!")
    addEvent(checkPendingPrize, 5 * 60 * 1000) -- Tenta entregar o prêmio após 5 minutos
end

-- Variáveis de controle do intervalo de sorteios (5 minutos inicial, depois 2 horas)
local initialRaffleDelay = 5 * 60 -- 5 minutos em segundos
local subsequentRaffleInterval = 3 * 60 * 60 -- 2 horas em segundos

-- Função que inicia o primeiro sorteio após 5 minutos
local function startRaffle()
    rafflePlayerAndGivePrize()
    -- Inicia o próximo sorteio após o intervalo de 2 horas
    addEvent(startRaffle, subsequentRaffleInterval * 1000)
end

-- Iniciar o sorteio após 5 minutos do servidor iniciar
addEvent(startRaffle, initialRaffleDelay * 1000)
