local mountItemId = 44048
local requiredItemCount = 4
local mountId = 217
local mountName = "Spirit of Purity"

local grantMountAction = Action()

function grantMountAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemCount = player:getItemCount(mountItemId)

    if itemCount >= requiredItemCount then
        if not player:hasMount(mountId) then
            player:removeItem(mountItemId, requiredItemCount)
            player:addMount(mountId)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You have received the mount: " .. mountName .. ".")
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this mount: " .. mountName .. ".")
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need at least " .. requiredItemCount .. " of these items to receive the mount.")
    end
    return true
end

grantMountAction:id(mountItemId)
grantMountAction:register()
