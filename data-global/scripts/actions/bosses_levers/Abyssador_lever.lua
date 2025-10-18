local config = {
	boss = {
		name = "Abyssador",
		position = Position(32899, 33039, 15),
	},

	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(32889, 33033, 14), teleport = Position(32898, 33039, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32890, 33033, 14), teleport = Position(32898, 33039, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32891, 33033, 14), teleport = Position(32898, 33039, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32892, 33033, 14), teleport = Position(32898, 33039, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32893, 33033, 14), teleport = Position(32898, 33039, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32883, 33029, 15),
		to = Position(32911, 33050, 15),
	},
	exit = Position(32896, 33033, 14),
}

local mitmahSummons = {
	Position(34084, 31671, 9),

}

local lever = BossLever(config)
lever:uid(27632)
lever:register()
