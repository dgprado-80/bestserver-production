local config = {
    boss = {
        name = "Ice Power",
        position = Position(33094, 33173, 8),
    },

    timeToDefeat = 40 * 60,  -- Tempo para derrotar o boss (40 minutos)
    playerPositions = {
        { pos = Position(33057, 33159, 3), teleport = Position(33099, 33177, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(33057, 33160, 3), teleport = Position(33099, 33177, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(33057, 33161, 3), teleport = Position(33099, 33177, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(33057, 33162, 3), teleport = Position(33099, 33177, 8), effect = CONST_ME_TELEPORT },
        { pos = Position(33057, 33163, 3), teleport = Position(33099, 33177, 8), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(33080, 33162, 8),  -- Posição inicial da área especial
        to = Position(33113, 33184, 8),    -- Posição final da área especial
    },
    exit = Position(33078, 33241, 7),  -- Posição de teleporte de saída
}

local lever = BossLever(config)
lever:uid(55508)  -- Defina o UID correto para a alavanca de fogo
lever:register()
