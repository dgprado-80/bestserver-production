local config = {
	boss = {
		name = "The Rootkraken",
		position = Position(32977, 33090, 15),
	},
	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(32968, 33088, 14), teleport = Position(32977, 33100, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32969, 33088, 14), teleport = Position(32977, 33100, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32970, 33088, 14), teleport = Position(32977, 33100, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32971, 33088, 14), teleport = Position(32977, 33100, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32972, 33088, 14), teleport = Position(32977, 33100, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32966, 33085, 15),
		to = Position(32988, 33104, 15),
	},
	monsters = {
		{ name = "Doctor Marrow", pos = Position(32982, 33092, 15) },
	},
	onUseExtra = function()
		-- Caso queira realizar alguma ação adicional ao ativar a alavanca
		local tile = Tile(Position(32977, 33090, 15)) -- Posição do boss "The Rootkraken"
		if tile then
			local boss = tile:getTopCreature()
			if boss and boss:isMonster() and boss:getName():lower() == "the rootkraken" then
				Game.createMonster("Doctor Marrow", Position(32982, 33092, 15))
			end
		end
	end,
	exit = Position(32977, 33090, 14),
}

local lever = BossLever(config)
lever:uid(27660)
lever:register()
