
local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

local function onLogout(player)
    --getStorageValue should check for -1 and not 1, since its storage value is being set to that
    if player:getStorageValue(1000) == -1 then
        addEvent(releaseStorage, 1000, player)
    end
    return true
end 