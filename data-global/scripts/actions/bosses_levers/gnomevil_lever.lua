local config = {
	boss = {
		name = "Gnomevil",
		position = Position(32828, 33041, 15),
	},

	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(32819, 33035, 14), teleport = Position(32835, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32820, 33035, 14), teleport = Position(32835, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32821, 33035, 14), teleport = Position(32835, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32822, 33035, 14), teleport = Position(32835, 33041, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32823, 33035, 14), teleport = Position(32835, 33041, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32813, 33030, 15),
		to = Position(32840, 33053, 15),
	},
	exit = Position(32826, 33035, 14),
}

local mitmahSummons = {
	Position(34084, 31671, 9),

}

local lever = BossLever(config)
lever:uid(27631)
lever:register()
