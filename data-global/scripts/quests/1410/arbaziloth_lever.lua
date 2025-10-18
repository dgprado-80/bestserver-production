local config = {
	boss = {
		name = "Arbaziloth",
		position = Position(34033, 32330, 14),
	},

	timeToDefeat = 30 * 60,
	playerPositions = {
		{ pos = Position(34058, 32396, 14), teleport = Position(34033, 32336, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32397, 14), teleport = Position(34033, 32336, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32398, 14), teleport = Position(34033, 32336, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32399, 14), teleport = Position(34033, 32336, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(34058, 32400, 14), teleport = Position(34033, 32336, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(34016, 32320, 14),
		to = Position(34045, 32343, 14),
	},
	exit = Position(33876, 32399, 10),
}

local mitmahSummons = {
	Position(34032, 32330, 14),

}

local lever = BossLever(config)
lever:uid(27633)
lever:register()
