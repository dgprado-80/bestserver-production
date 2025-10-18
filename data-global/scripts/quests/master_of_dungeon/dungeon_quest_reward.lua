local questStorage = 66600

local rewards = {
    [51304] = {uid = 42764, itemid = 51304},
    [51297] = {uid = 42765, itemid = 51297},
    [51296] = {uid = 42766, itemid = 51296},
    [51295] = {uid = 42767, itemid = 51295}
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
