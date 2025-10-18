local config = {
    boss = {
        name = "Earth Power",
        position = Position(32989, 33281, 8),
    },

    timeToDefeat = 40 * 60,  -- Tempo para derrotar o boss (40 minutos)
    playerPositions = {
        { pos = Position(32991, 33294, 7), teleport = Position(32990, 33289, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(32991, 33295, 7), teleport = Position(32990, 33289, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(32991, 33296, 7), teleport = Position(32990, 33289, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(32991, 33297, 7), teleport = Position(32990, 33289, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(32991, 33298, 7), teleport = Position(32990, 33289, 8), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(32976, 33271, 8),  -- Posição inicial da área especial
        to = Position(33001, 33293, 8),    -- Posição final da área especial
    },
    exit = Position(33072, 33217, 7),  -- Posição de teleporte de saída
}

local lever = BossLever(config)
lever:uid(55506)  -- Defina o UID correto para a alavanca de fogo
lever:register()
