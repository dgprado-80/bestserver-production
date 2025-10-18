local oberonOthersMessages = {
	[1] = "Are you ever going to fight or do you prefer talking! Then let me show you the concept of mortality before it! Dare strike up a Minnesang and you will receive your last accolade!",
	[2] = "Even before they smell your breath? Too bad you barely exist at all! SEHWO ASIMO, TOLIDO ESD Excuse me but I still do not get the message! Then why are we fighting alone right now? How appropriate, you look like something worms already got the better of!",
}

GrandMasterOberonAsking = {
	[1] = { msg = "Just talk oberon" },

}

GrandMasterOberonResponses = {
	[1] = { msg = "oberon", msg2 = oberonOthersMessages[2] },

}

GrandMasterOberonConfig = {
	Storage = {
		Asking = 1,
		Life = 2,
		Exhaust = 3,
	},
	Monster = {
		"Falcon Knight",
		"Falcon Paladin",
	},
	AmountLife = 3,
}

local function healOberon(monster)
	local storage = monster:getStorageValue(GrandMasterOberonConfig.Storage.Life)
	monster:setStorageValue(GrandMasterOberonConfig.Storage.Life, storage + 1)
	monster:addHealth(monster:getMaxHealth())
end

function SendOberonAsking(monster)
	monster:registerEvent("OberonImmunity")
	local random = math.random(#GrandMasterOberonAsking)
	monster:say(GrandMasterOberonAsking[random].msg, TALKTYPE_MONSTER_SAY)
	monster:setStorageValue(GrandMasterOberonConfig.Storage.Asking, random)

	healOberon(monster)

	Game.createMonster(GrandMasterOberonConfig.Monster[math.random(#GrandMasterOberonConfig.Monster)], monster:getPosition(), true, true)
end
