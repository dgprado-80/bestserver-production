local config = {
	boss = {
		name = "Horestis",
		position = Position(32942, 32796, 12),
	},

	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(32749, 33091, 14), teleport = Position(32943, 32789, 12), effect = CONST_ME_TELEPORT },

	},
	specPos = {
		from = Position(32933, 32784, 12),
		to = Position(32951, 32801, 12),
	},
	exit = Position(32935, 32777, 12),
}

local mitmahSummons = {
	Position(32946, 32794, 12),

}

local lever = BossLever(config)
lever:uid(27634)
lever:register()
