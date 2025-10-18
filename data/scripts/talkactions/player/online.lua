local maxPlayersPerMessage = 10
local playersOnline = TalkAction("!online")

local function formatOnlineEntry(player)
	return ("%s [%d|%s]"):format(player:getName(), player:getLevel(), player:vocationAbbrev())
end

function playersOnline.onSay(player, words, param)
	local hasAccess = player:getGroup():getAccess()
	local players = Game.getPlayers()
	local onlineList = {}

	-- Adicionar todos os jogadores ativos em uma única lista
	for _, targetPlayer in ipairs(players) do
		if hasAccess or not targetPlayer:isInGhostMode() then
			table.insert(onlineList, targetPlayer)
		end
	end

	-- Enviar mensagem com contagem de jogadores online
	local onlineCount = #onlineList
	player:sendTextMessage(MESSAGE_ATTENTION, ("%d players online"):format(onlineCount))

	-- Enviar lista de jogadores online
	while #onlineList > 0 do
		local msg = {}
		for _ = 1, maxPlayersPerMessage do
			local targetPlayer = onlineList[1]
			if targetPlayer then
				table.insert(msg, formatOnlineEntry(targetPlayer))
				table.remove(onlineList, 1)
			end
		end
		player:sendTextMessage(MESSAGE_ATTENTION, table.concat(msg, ", "))
	end

	return true
end

playersOnline:groupType("normal")
playersOnline:register()
