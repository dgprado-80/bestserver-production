local CastleWarOn = GlobalEvent("CastleWarOn")
function CastleWarOn.onTime(interval)
	Game.broadcastMessage(string.format("[Castle War] The castle has been opened and will close in 60 minutes.", MESSAGE_GAME_HIGHLIGHT))
	Castle:load()
	return true
end
CastleWarOn:time("21:55:00")
CastleWarOn:register()
