local config = {
    boss = {
        name = "Fire Power",
        position = Position(32988, 33209, 7),
    },

    timeToDefeat = 40 * 60,  -- Tempo para derrotar o boss (40 minutos)
    playerPositions = {
        { pos = Position(32998, 33214, 3), teleport = Position(32989, 33204, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32998, 33215, 3), teleport = Position(32989, 33204, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32998, 33216, 3), teleport = Position(32989, 33204, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32998, 33217, 3), teleport = Position(32989, 33204, 7), effect = CONST_ME_TELEPORT },
        { pos = Position(32998, 33218, 3), teleport = Position(32989, 33204, 7), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(32983, 33203, 7),  -- Posição inicial da área especial
        to = Position(32995, 33216, 7),    -- Posição final da área especial
    },
    exit = Position(32993, 33208, 7),  -- Posição de teleporte de saída
}

local lever = BossLever(config)
lever:uid(55505)  -- Defina o UID correto para a alavanca de fogo
lever:register()
