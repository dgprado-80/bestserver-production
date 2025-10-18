local fps = TalkAction("!fps")

function fps.onSay(player, words, param)
    -- Verifica se o jogador está em PZ Locked
    if player:isPzLocked() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this command while you are PZ Locked.")
        return true -- Não permite o uso do comando enquanto o jogador estiver em PZ Locked
    end

    -- Remove o próprio jogador do jogo
    player:remove()
    return true
end

fps:separator(" ")
fps:groupType("normal") -- Permite que qualquer jogador use o comando
fps:register()
