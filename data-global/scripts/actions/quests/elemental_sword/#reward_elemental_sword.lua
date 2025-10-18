local questStorage = 54600

local rewards = {
    [3239] = {uid = 55601, itemid = 3239},
    [20081] = {uid = 55602, itemid = 20081},
    [20066] = {uid = 55603, itemid = 20066},
    [20072] = {uid = 55604, itemid = 20072},
    [20078] = {uid = 55605, itemid = 20078}
}

local function createQuestRewardAction(reward)
    local questReward = Action()

    function questReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
        if item.uid == reward.uid then
            if player:getStorageValue(questStorage) ~= 1 then
                player:addItem(reward.itemid, 1)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received the item " .. ItemType(reward.itemid):getName() .. ".")
                player:setStorageValue(questStorage, 1)
                
                -- Executa o efeito visual 244
                local effectPosition = player:getPosition()
                effectPosition:sendMagicEffect(244)
                
                return true
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already chosen a reward item.")
                return false
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item is not a valid reward.")
            return false
        end
    end

    questReward:uid(reward.uid)
    questReward:register()
end

-- Registrar todas as ações de recompensas
for _, reward in pairs(rewards) do
    createQuestRewardAction(reward)
end
