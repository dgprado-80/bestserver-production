local outfits = {
    ["citizen"] = {136, 128},
    ["hunter"] = {137, 129},
    ["mage"] = {138, 130},
    ["knight"] = {139, 131},
    ["noblewoman"] = {140, 132},
    ["summoner"] = {141, 133},
    ["warrior"] = {142, 134},
    ["barbarian"] = {147, 143},
    ["druid"] = {148, 144},
    ["wizard"] = {149, 145},
    ["oriental"] = {150, 146},
    ["pirate"] = {155, 151},
    ["assassin"] = {156, 152},
    ["beggar"] = {157, 153},
    ["shaman"] = {158, 154},
    ["norsewoman"] = {252, 251},
    ["nightmare"] = {269, 268},
    ["jester"] = {270, 273},
    ["brotherhood"] = {279, 278},
    ["demonhunter"] = {288, 289},
    ["yalaharian"] = {324, 325},
    ["warmaster"] = {336, 335},
    ["wayfarer"] = {366, 367},
    ["afflicted"] = {431, 430},
    ["elementalist"] = {433, 432},
    ["deepling"] = {464, 463},
    ["insectoid"] = {466, 465},
    ["red baron"] = {471, 472},
    ["crystal warlord"] = {513, 512},
    ["soil guardian"] = {514, 516},
}

local addondoll_id = 28897

local addonDoll = TalkAction("!addon")

function addonDoll.onSay(player, words, param)
    if param == "" then
        local outfitList = "Available outfits: "
        for name in pairs(outfits) do
            outfitList = outfitList .. name .. ", "
        end
        -- Remove a última vírgula e espaço
        outfitList = outfitList:sub(1, -3)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, outfitList)
        return false
    end

    local outfitName = param:lower()
    if not outfits[outfitName] then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is no outfit with that name.")
        return false
    end

    if player:getItemCount(addondoll_id) <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the addon doll!")
        return false
    end

    local outfit = outfits[outfitName]
    if player:hasOutfit(outfit[1], 3) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have both addons for this outfit!")
        return false
    end

    player:removeItem(addondoll_id, 1)
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:addOutfitAddon(outfit[1], 1)
    player:addOutfitAddon(outfit[1], 2)
    player:addOutfitAddon(outfit[2], 1)
    player:addOutfitAddon(outfit[2], 2)
    player:sendTextMessage(MESSAGE_LOOK, string.format("You received both addons for the %s outfit.", outfitName))
    return false
end

addonDoll:separator(" ")
addonDoll:groupType("normal")
addonDoll:register()
