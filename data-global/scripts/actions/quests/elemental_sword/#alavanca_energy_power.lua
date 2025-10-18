local config = {
    boss = {
        name = "Energy Power",
        position = Position(33083, 33321, 7),
    },

    timeToDefeat = 40 * 60,  -- Tempo para derrotar o boss (40 minutos)
    playerPositions = {
        { pos = Position(33062, 33312, 7), teleport = Position(33082, 33328, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(33062, 33313, 7), teleport = Position(33082, 33328, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(33062, 33314, 7), teleport = Position(33082, 33328, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(33062, 33315, 7), teleport = Position(33082, 33328, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(33062, 33316, 7), teleport = Position(33082, 33328, 7), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(33074, 33309, 7),  -- Posição inicial da área especial
        to = Position(33093, 33331, 7),    -- Posição final da área especial
    },
    exit = Position(33055, 33231, 6),  -- Posição de teleporte de saída Sa de premios
}

local lever = BossLever(config)
lever:uid(55504)  -- Defina o UID correto para a alavanca de fogo
lever:register()
