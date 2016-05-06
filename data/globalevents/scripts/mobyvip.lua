local monsters = {
    {position = {x = 767, y = 881, z = 7}, dir = EAST},
    {position = {x = 767, y = 883, z = 7}, dir = EAST},
    {position = {x = 767, y = 885, z = 7}, dir = EAST},
    {position = {x = 767, y = 887, z = 7}, dir = EAST},
    {position = {x = 767, y = 889, z = 7}, dir = EAST},
    {position = {x = 767, y = 891, z = 7}, dir = EAST}
}

function onStartup()
    for _, mob in ipairs(monsters) do
        local monster = getTopCreature(mob.position)
        if monster.uid > 0 then
            doCreatureSetLookDirection(monster.uid, mob.dir)
        end
    end
    return true
end