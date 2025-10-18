local config = {
	boss = {
		name = "Mitmah Vanguard",
		position = Position(34086, 31672, 9),
	},

	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(34074, 31691, 9), teleport = Position(34086, 31677, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(34075, 31691, 9), teleport = Position(34086, 31677, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(34076, 31691, 9), teleport = Position(34086, 31677, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(34077, 31691, 9), teleport = Position(34086, 31677, 9), effect = CONST_ME_TELEPORT },
		{ pos = Position(34078, 31691, 9), teleport = Position(34086, 31677, 9), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34079, 31665, 9),
		to = Position(34093, 31679, 9),
	},
	exit = Position(34087, 31681, 9),
}

local mitmahSummons = {
	Position(34084, 31671, 9),
	Position(34084, 31671, 9),
	Position(34084, 31671, 9),
	Position(34089, 31671, 9),
	Position(34089, 31671, 9),
	Position(34089, 31671, 9),
}

local lever = BossLever(config)
lever:uid(47631)
lever:register()
