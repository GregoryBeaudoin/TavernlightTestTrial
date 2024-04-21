
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) 
{
    // By using unique pointers, memory allocated for Player and Item will be automatically
    // released, once these objects go out of scope. Works better than having to use delete()
    // which does not explicitly deallocate the memory
    std::unique_ptr<Player> player(g_game.getPlayerByName(recipient)); 
    if (!player) 
    {
        // Makes this instance of player unique
        player = std::make_unique<Player>(nullptr); 
        if (!IOLoginData::loadPlayerByName(player.get(), recipient)) 
        {
            return; 
        }
    }

    // Changed raw pointer to unique pointer here to maintain consistency
    std::unique_ptr<Item> item(Item::CreateItem(itemId)); 
    if (!item) 
    {
        return; 
    }

    g_game::internalAddItem(player->getInbox(), item.get(), INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) 
    {
        IOLoginData::savePlayer(player.get()); 
    }
}