local talk = TalkAction("!hireling")

-- Preço para comprar um hireling
local hirelingPrice = 150

function talk.onSay(player, words, param)
    -- Garante que o método getHirelingsCount retorna 0 ou mais
    local hirelingCount = player:getHirelingsCount()
    if not hirelingCount or hirelingCount > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have a hireling. You cannot buy another one.")
        return true
    end

    -- Verifica se o jogador tem Tibia Coins suficientes
    if player:getTibiaCoins() < hirelingPrice then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough Tibia Coins to buy a hireling. Cost: " .. hirelingPrice .. " coins.")
        return true
    end

    -- Verifica se os parâmetros foram fornecidos corretamente
    local split = param:split(",")
    if #split < 2 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please provide the name and sex for the hireling. Example: !hireling John,1 (1 = male, 0 = female)")
        return true
    end

    local name = split[1]:trim()
    local sex = tonumber(split[2])

    if not name or name == "" then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid name provided for the hireling.")
        return true
    end

    if sex ~= 0 and sex ~= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid sex provided for the hireling. Use 1 for male or 0 for female.")
        return true
    end

    -- Deduz Tibia Coins do jogador
    player:removeTibiaCoins(hirelingPrice)

    -- Cria o hireling
    local result = player:addNewHireling(name, sex)
    if result then
        player:setStorageValue(GameStore.Storages.hirelingBought, 1) -- Armazena que o jogador comprou um hireling
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You have purchased a hireling named " .. name .. " for " .. hirelingPrice .. " Tibia Coins.")
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Failed to create hireling. Please try again later.")
    end

    return true
end

talk:separator(" ")
talk:groupType("normal")
talk:register()
