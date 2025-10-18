local forgeTalk = TalkAction("!forge")

function forgeTalk.onSay(player, words, param)
	player:openForge()
	return true
end

forgeTalk:separator(" ")
forgeTalk:groupType("normal")
forgeTalk:register()
