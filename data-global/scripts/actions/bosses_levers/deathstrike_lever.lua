local config = {
	boss = {
		name = "Deathstrike",
		position = Position(32761, 33039, 15),
	},

	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(32752, 33035, 14), teleport = Position(32767, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32753, 33035, 14), teleport = Position(32767, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32754, 33035, 14), teleport = Position(32767, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32755, 33035, 14), teleport = Position(32767, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32756, 33035, 14), teleport = Position(32767, 33041, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32746, 33030, 15),
		to = Position(32773, 33053, 15),
	},
	exit = Position(32760, 33036, 14),
}

local mitmahSummons = {
	Position(34084, 31671, 9),

}

local lever = BossLever(config)
lever:uid(27630)
lever:register()
