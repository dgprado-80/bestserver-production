local partyDeath = CreatureEvent("PartyDeath")

function partyDeath.onDeath(player, killer)
    local party = player:getParty()
    if party then
        party:removeMember(player)
    end
    return true
end

partyDeath:register()

