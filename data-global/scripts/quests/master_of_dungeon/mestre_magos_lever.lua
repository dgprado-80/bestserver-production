local config = {
    boss = {
        name = "Mestre dos Magos",
        position = Position(32389, 33233, 12),  
    },
    timeToDefeat = 30 * 60,
    playerPositions = {
        { pos = Position(32360, 33176, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32360, 33177, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32360, 33178, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32360, 33179, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32360, 33180, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
		
        { pos = Position(32361, 33176, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32361, 33177, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32361, 33178, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32361, 33179, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
        { pos = Position(32361, 33180, 13), teleport = Position(32389, 33233, 12), effect = CONST_ME_TELEPORT },
    },
    specPos = {
        from = Position(32373, 33228, 12),
        to = Position(32399, 33240, 12), 
    },
    monsters = {
       
      
        { name = "Dungeon Demon Hunter", pos = Position(32383, 33234, 12) }, -- Novo monstro 2
        { name = "Dungeon Demon Hunter", pos = Position(32394, 33232, 12) }, -- Novo monstro 3
		{ name = "Dungeon Demon Hunter", pos = Position(32375, 33231, 12) }, -- 
        { name = "Dungeon Demon Hunter", pos = Position(32395, 33230, 12) }, -- 
		},
    exit = Position(32361, 33183, 13),
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
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The boss Mestre dos Magos and his minions have been summoned!")
    end
end

lever:uid(42763)
lever:register()
