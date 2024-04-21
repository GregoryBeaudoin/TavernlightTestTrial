
local function printSmallGuildNames(memberCount)
    --this method is supposed to print names of all guilds that have less than memberCount max members
    --Formats the string before being stored as a query
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount);

    --Executes query and stores result, which has already been formatted
    local resultId = db.storeQuery(selectGuildQuery)

    --Iterate through the results to print all names
    while resultId:next() do
        local guildName = resultId.getString("name")
        print(guildName)
    end
end
