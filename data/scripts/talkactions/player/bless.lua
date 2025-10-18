local bless = TalkAction("!bless, !Bless,!BLESS")

function bless.onSay(player, words, param)
	Blessings.BuyAllBlesses(player)
	return true
end

bless:groupType("normal")
bless:register()
