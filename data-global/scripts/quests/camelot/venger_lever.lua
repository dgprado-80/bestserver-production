local config = {
    boss = {
        name = "Venger",
        position = Position(32821, 33463, 10),
    },
    timeToDefeat = 30 * 60,
    playerPositions = {
        { pos = Position(32817, 33478, 9), teleport = Position(32818, 33469, 10), effect = CONST_ME_TELEPORT },
        { pos = Position(32817, 33479, 9), teleport = Position(32818, 33469, 10), effect = CONST_ME_TELEPORT },
        { pos = Position(32817, 33480, 9), teleport = Position(32818, 33469, 10), effect = CONST_ME_TELEPORT },
        { pos = Position(32817, 33481, 9), teleport = Position(32818, 33469, 10), effect = CONST_ME_TELEPORT },
        { pos = Position(32817, 33482, 9), teleport = Position(32818, 33469, 10), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(32807, 33450, 10),
        to = Position(32840, 33475, 10),
    },
    monsters = {
        { name = "Merlin Mage", pos = Position(32815, 33467, 10) },
        { name = "Sentenced Witch", pos = Position(32822, 33470, 10) }, -- Novo monstro 1
        { name = "Unholy Wizard", pos = Position(32826, 33467, 10) }, -- Novo monstro 2
        { name = "Robin Hood", pos = Position(32813, 33467, 10) }, -- Novo monstro 3
    },
    exit = Position(32818, 33486, 9),
}

-- Função principal do BossLever
local lever = BossLever(config)

function lever:onActivate(players)
    -- Invoca o boss "Venger" na posição configurada
    Game.createMonster(config.boss.name, config.boss.position)

    -- Cria os monstros adicionais definidos em config.monsters
    for _, monsterData in pairs(config.monsters) do
        Game.createMonster(monsterData.name, monsterData.pos)
    end

    -- Mensagem informando que o boss e monstros foram criados
    for _, player in ipairs(players) do
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The boss Venger and his minions have been summoned!")
    end
end

lever:uid(53206)
lever:register()
