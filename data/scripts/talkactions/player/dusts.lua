local checkDusts = TalkAction("!dusts")
local cooldownTime = 5 -- tempo de espera em segundos
local storageKey = 31243 -- chave de storage única para esta talkaction

function checkDusts.onSay(player, words, param)
    local currentTime = os.time()
    local lastUsage = player:getStorageValue(storageKey)

    if lastUsage > currentTime then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait " .. (lastUsage - currentTime) .. " seconds before using this command again.")
        return true
    end

    -- Obtenha a quantidade atual de dusts
    local dusts = player:getForgeDusts()

    -- Obtenha o limite máximo de dusts da tabela de players
    local query = db.storeQuery("SELECT forge_dust_level FROM players WHERE id = " .. player:getGuid())
    local dustLimit = 0
    if query then
        dustLimit = result.getNumber(query, "forge_dust_level")
        result.free(query)
    end

    -- Envia a mensagem ao jogador
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have " .. dusts .. "/" .. dustLimit .. " dusts.")

    -- Atualiza o tempo de espera (cooldown)
    player:setStorageValue(storageKey, currentTime + cooldownTime)
    
    return true
end

checkDusts:groupType("normal")
checkDusts:register()
