local config = {
	bossPos = Position(33654, 32909, 15),
	timeToLeftAfterKill = 60,
}

local bossZone = Zone("boss.magma-bubble")
local spawnZone = Zone("fight.magma-bubble.spawn")

-- Central area where the boss spawns
spawnZone:addArea({ x = 33647, y = 32900, z = 15 }, { x = 33659, y = 32913, z = 15 })

local encounter = Encounter("Magma Bubble", {
	zone = bossZone,
	spawnZone = spawnZone,
	timeToSpawnMonsters = "2s",
})

function encounter:onReset(position)
	encounter:removeMonsters()
	bossZone:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("The Magma Bubble has been defeated. You have %i seconds to leave the room.", config.timeToLeftAfterKill))
	self:addEvent(function(zn)
		zn:refresh()
		zn:removePlayers()
	end, config.timeToLeftAfterKill * 1000, bossZone)
end

encounter:addRemoveMonsters():autoAdvance()
encounter:addBroadcast("You've entered the volcano."):autoAdvance("1s")

-- Spawn do Magma Bubble
encounter:addSpawnMonsters({
	{
		name = "Magma Bubble",
		event = "fight.magma-bubble.MagmaBubbleDeath",
		positions = { config.bossPos },
	},
})

encounter:register()

local magmaBubbleDeath = CreatureEvent("fight.magma-bubble.MagmaBubbleDeath")
function magmaBubbleDeath.onDeath()
	encounter:reset()
end

magmaBubbleDeath:register()

local zoneEvent = ZoneEvent(bossZone)
function zoneEvent.afterEnter(_zone, creature)
	local player = creature:getPlayer()
	if not player then
		return false
	end
end

function zoneEvent.afterLeave(_zone, creature)
	local player = creature:getPlayer()
	if not player then
		return false
	end
end

zoneEvent:register()
