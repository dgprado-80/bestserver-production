local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {



    "[facebook-Instagram]: Sigam nossas redes sociais https://www.facebook.com/bestserverOT/--www.instagram.com/bestserverot/.",
	"[!autolootcip on]: Para ativar o autoloot no cliente 13x",
	"[Bugs]: Usem o forum do site para relatar qualquer problema.",
	"[!commands]  E vejam todos os comandos que voce pode usar",
	"[bestserverot.com.br] Mantenham-se informados sobre fixes e novidades pelo nosso site http://bestserverot.com.br e redes sociais.",
	"[https://chat.whatsapp.com/H90eNZG7Md0AMJcPF1dM2u] Contato e grupo de conversa.",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(1000000)
AutoBroadCast:register()
