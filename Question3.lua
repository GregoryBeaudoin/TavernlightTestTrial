
local function removePlayerFromParty(playerId, memberName)
    --this method removes a particular player from the party
    local player = Player(playerId)
    local party = player:getParty()

    --Gets members of party before being used in for loop
    local members = party:getMembers()
    for k,v in pairs(members) do
        --Gets name of member before removing them
        if v:getName() == memberName then
            party:removeMember(v)
            break --Exit the loop after removing the member
        end
    end
end
