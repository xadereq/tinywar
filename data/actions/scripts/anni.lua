local config = {
        daily = "no", -- allow only one team to enter per day? (like in global Tibia)
        level = 13,
        storage = 5010,
        room = {
                {x = 962, y = 909, z = 5},
                {x = 968, y = 914, z = 5}
        },
        stand = {
                {x =  993, y = 958, z = 7},
                {x = 992, y = 958, z = 7},
                {x = 991, y = 958, z = 7},
                {x = 990, y = 958, z = 7}
        },
        destination = {
                {x = 966, y = 912, z = 5},
                {x = 965, y = 912, z = 5},
                {x = 964, y = 912, z = 5},
                {x = 963, y = 912, z = 5}
        },
        wall = {
                {x = 962, y = 911, z = 5}
        },
        rocks = {
                {x = 968, y = 912, z = 5},
                {x = 967, y = 912, z = 5},
                {x = 966, y = 912, z = 5},
                {x = 965, y = 912, z = 5},
                {x = 964, y = 912, z = 5},
                {x = 963, y = 912, z = 5},
                {x = 963, y = 910, z = 5},
                {x = 965, y = 910, z = 5},
                {x = 964, y = 914, z = 5},
                {x = 966, y = 914, z = 5}
        },
        demons = {
                {x = 963, y = 910, z = 5},
                {x = 965, y = 910, z = 5},
                {x = 964, y = 914, z = 5},
                {x = 966, y = 914, z = 5}
        },
        ghosts = {
                {x = 968, y = 912, z = 5},
                {x = 967, y = 912, z = 5}
        }
}

local function areaCheck(area)
        local monsters, players = {}, {}
        for x = config.room[1].x, config.room[2].x do
                for y = config.room[1].y, config.room[2].y do
                        local t = getThingFromPos({x=x, y=y, z=config.room[1].z, stackpos=253})
                        if t.uid > 0 then
                                if isPlayer(t.uid) then
                                        table.insert(players, t.uid)
                                elseif isMonster(t.uid) then
                                        table.insert(monsters, t.uid)
                                end
                        end
                end
        end
        return monsters, players
end
 
config.daily = getBooleanFromString(config.daily)
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.itemid == 1945) then
                if(config.daily) then
                        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                else
                        local monsters, players = areaCheck(config.room)
                        if #players > 0 then
                                return doPlayerSendCancel(cid, "There are players inside, please be patient.")
                        elseif #monsters > 0 then
                                for _, k in pairs(monsters) do
                                        doRemoveThing(k)
                                end
                        end
 
                        for _, v in ipairs(config.rocks) do
                                doCreateItem(1285, 1, v)
                        end
 
                        -- local closed, open = getTileItemById(config.wall[1], 5108), getTileItemById(config.wall[1], 5109)
                        -- if(closed.uid > 0) then
                        --         doTransformItem(closed.uid, 1025)
                        -- elseif(open.uid > 0) then
                        --         doTransformItem(open.uid, 1025)
                        -- end
 
                        doTransformItem(item.uid, item.itemid + 1)
                end
                return true
        end
 
        if(item.itemid ~= 1946) then
                return true
        end
 
        local players = {}
        for _, position in ipairs(config.stand) do
                local pid = getTopCreature(position).uid
                if(pid == 0 or not isPlayer(pid)) then
                        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                elseif(getCreatureStorage(pid, config.storage) > 0) then
                        return doPlayerSendCancel(cid, "Someone has already completed this quest.")
                elseif(getPlayerLevel(pid) < config.level) then
                        return doPlayerSendCancel(cid, "Someone is below level 13.")
                end
 
                table.insert(players, pid)
        end
 
        local stones = {}
        for _, v in ipairs(config.rocks) do
                local st = getTileItemById(v, 1285)
                table.insert(stones, st)
        end
 
        for _, st in ipairs(stones) do
                doRemoveItem(st.uid, 1)
        end
 
        -- local wall = getTileItemById(config.wall[1], 1025)
        -- if(wall.uid > 0) then
        --         doTransformItem(wall.uid, 5108)
        -- end
 
        for _, pos in ipairs(config.demons) do
                doCreateMonster("Anhilator", pos, false, false)
                doSendMagicEffect(pos, CONST_ME_ENERGYAREA)
        end

        for _, pos in ipairs(config.ghosts) do
                doCreateMonster("Ghost", pos, false, false)
                doSendMagicEffect(pos, CONST_ME_ENERGYAREA)
        end
 
        for i, pid in ipairs(players) do
                doSendMagicEffect(config.stand[i], CONST_ME_POFF)
                doTeleportThing(pid, config.destination[i], false)
                doSendMagicEffect(config.destination[i], CONST_ME_TELEPORT)
        end
 
        doTransformItem(item.uid, item.itemid - 1)
        return true
end