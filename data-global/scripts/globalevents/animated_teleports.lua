
local effects = {
    
    {position = Position(32365, 32236, 7), text = 'TRAINERS', effect = 56},
    {position = Position(32353, 32223, 7), effect = 56},
	{position = Position(32353, 32224, 7), text = 'ARENA PVP'},
    {position = Position(32373, 32236, 7), text = 'NPC ISLAND', effect = 56},    
    {position = Position(1116, 1092, 7), text = 'ENTRAR', effect = 56},
    {position = Position(1114, 1096, 7), text = 'SAIR', effect = 56}, 
	{position = Position(32357, 32225, 6), text = 'Boss Tps', effect = 56}, 
	{position = Position(32357, 32226, 6), text = 'Hunt Tps', effect = 56}, 
	{position = Position(32364, 32239, 7), text = 'TPs', effect = 56},
	{position = Position(32233, 32172, 6), text = 'Thais', effect = 56},
	{position = Position(32220, 32172, 7), text = 'Thais', effect = 56},
	{position = Position(32363, 32241, 7), text = 'Custon Forge'},
    {position = Position(32376, 32239, 7), text = 'Daily Reward', effect = 56},		
	{position = Position(32366, 32231, 7), text = 'Task Board'},
    {position = Position(32373, 32231, 7), text = 'Task Board'},
    {position = Position(32344, 32221, 6), text = 'Daily Reward', effect = 56},	
	{position = Position(32357, 32209, 7), text = 'food', effect = 56},	
	{position = Position(32223, 32168, 7), text = 'Elemental Quest', effect = 56},	
	{position = Position(33122, 31947, 15), text = 'Sala Tps', effect = 56},	
	{position = Position(32223, 32250, 6), text = 'Sala Tps', effect = 56},
	

	{position = Position(1057, 1023, 7), text = 'Thais', effect = 56},
	

	
	
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()