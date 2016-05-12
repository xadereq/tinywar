--[[
    .::1-Row Slot Machine::.
          for TFS 0.3/4
      by Cybermaster (cbrm)
]]--

function Position(x, y, z, stackpos)
    local position = {x = x, y = y, z = z}
    if stackpos then
        position.stackpos = stackpos
    end
    return position
end

--    1. FRUITS
TEMP, FRUITS = {
    ['APPLE'] = 2674,    ['BANANA'] = 2676,        ['BERRY'] = 2680,
    ['CHERRY'] = 2679,   ['LEMON'] = 8841,        ['MANGO'] = 5097,
    ['MELON'] = 2682,    ['ORANGE'] = 2675,        ['PUMPKIN'] = 2683
}, {}

for name, id in pairs(TEMP) do
    _G[name] = id
    table.insert(FRUITS, id)
end

--    2. CONFIGURATION
SETUP = {
    MONEY = 1000, --REQUIRED MONEY(gp) TO PLAY SLOT MACHINE
    TIME = 200, --MILLISECONDS TO SWITCH FRUITS
    LIMIT = 20, --COUNTER TO STOP CHANGING FRUIT IF PLAYER DOESN'T (decreases each SETUP.TIME)
    LEVER = {9825, 9826},
    WIN = {
    -- [FRUITS] = {PRIZE,#PRIZE}]
        --MIXED COMBINATIONS
            [{CHERRY,PUMPKIN,CHERRY}] = {2160,2},
            [{LEMON,MELON,LEMON}] = {2160,1},
        --TRIPLE COMBINATIONS
            [{BERRY,BERRY,BERRY}] = {2152,80},
            [{MANGO,MANGO,MANGO}] = {2152,60},
            [{PUMPKIN,PUMPKIN,PUMPKIN}] = {2152,80},
            [{MELON,MELON,MELON}] = {2152,50},
            [{BANANA,BANANA,BANANA}] = {2152,40},
            [{LEMON,LEMON,LEMON}] = {2152,25},
            [{CHERRY,CHERRY,CHERRY}] = {2152,20},
            [{ORANGE,ORANGE,ORANGE}] = {2152,30},
            [{APPLE,APPLE,APPLE}] = {2152,10},
        --ANY COMBINATIONS
            [{ANY,PUMPKIN,PUMPKIN}] = {2152,5},
            [{PUMPKIN,PUMPKIN,ANY}] = {2152,5},
            [{PUMPKIN,ANY,PUMPKIN}] = {2152,10},
            [{ANY,CHERRY,CHERRY}] = {2152,4},
            [{CHERRY,CHERRY,ANY}] = {2152,4},
            [{CHERRY,ANY,CHERRY}] = {2152,8},
            [{ANY,LEMON,LEMON}] = {2152,5},
            [{LEMON,LEMON,ANY}] = {2152,5},
            [{LEMON,ANY,LEMON}] = {2152,5},
        },
    MSG = {'Bingo!','Lucky!','Jackpot!','Win!'},
    POS = {    --[LEVER.UNIQUEID] = {direction to row, distance from lever to row, position of lever}
        [6297] = {direction = SOUTH, distance = 2, position = Position(993, 1012, 8)},
        [6298] = {direction = SOUTH, distance = 2, position = Position(997, 1012, 8)},
        [6299] = {direction = SOUTH, distance = 2, position = Position(1001, 1012, 8)},
    },
}

for lever, row in pairs(SETUP.POS) do
    local position = getPositionByDirection(row.position, row.direction, row.distance)
    for tile = 0, 2 do
        if row.direction % 2 == 0 then
            SETUP.POS[lever][tile+1] = Position(position.x+tile, position.y, position.z, 1)
        else
            SETUP.POS[lever][tile+1] = Position(position.x, position.y+tile, position.z, 1)
        end
    end
end

--    3. FUNCTIONS
function switchLever(lev)
    return doTransformItem(lev.uid, lev.itemid == SETUP.LEVER[1] and SETUP.LEVER[2] or SETUP.LEVER[1])
end

function verifyRow(cid, pos)
    local result = false
    for combo, profit in pairs(SETUP.WIN) do
        if (getTileItemById(pos[1], combo[1]).uid > 0) or (combo[1] == ANY) then
            if (getTileItemById(pos[2], combo[2]).uid > 0) or (combo[2] == ANY) then
                if (getTileItemById(pos[3], combo[3]).uid > 0) or (combo[3] == ANY) then
                    result = true
                    doPlayerAddItem(cid, profit[1], profit[2] or 1, true)
                    doSendAnimatedText(getThingPos(cid), SETUP.MSG[math.random(#SETUP.MSG)], 66)
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'Congratulations!! You won ' .. profit[2] .. ' ' .. getItemPluralNameById(profit[1]) ..'!')
                    break
                end
            end
        end
    end

    for tile = 1, 3 do
        doRemoveItem(getTileThingByPos(pos[tile]).uid)
        doSendMagicEffect(pos[tile], result and CONST_ME_GIFT_WRAPS or CONST_ME_EXPLOSIONHIT)
    end

    return not result and doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You have lost in the Slot Machine :( Try again')
end

--    4. SCRIPT
function onUse(cid, item, fromPosition, itemEx, toPosition)

    if getDirectionTo(getThingPos(cid), fromPosition) > 3 then
        return true
    end

    local function getLever()
        return getTileThingByPos(fromPosition)
    end

    local function doFruit(pos, id, limit)
        if not isPlayer(cid) then
            doItemEraseAttribute(item.uid, 'aid')
            for tile = 1, 3 do
                if getTileThingByPos(pos[tile]).uid > 0 then
                    doRemoveItem(getTileThingByPos(pos[tile]).uid)
                end
            end
            return true
        end

        if getTileThingByPos(pos[id]).itemid < 1 then
            doSendMagicEffect(pos[id], CONST_ME_POFF)
            doCreateItem(FRUITS[math.random(#FRUITS)], 1, pos[id])
        else
            doTransformItem(getTileThingByPos(pos[id]).uid, FRUITS[math.random(#FRUITS)])
        end

        if limit < 1 then
            doSendMagicEffect(pos[id], math.random(28, 30))
            doTransformItem(getTileThingByPos(pos[id]).uid, FRUITS[math.random(#FRUITS)])
            doItemSetAttribute(getLever().uid, 'aid', getLever().actionid+1)
            switchLever(getLever())
        elseif getLever().actionid > id then
            doSendMagicEffect(pos[id], math.random(28, 30))
            doTransformItem(getTileThingByPos(pos[id]).uid, FRUITS[math.random(#FRUITS)])
        else
            addEvent(doFruit, SETUP.TIME, pos, id, limit-1)
        end
    end

    if item.actionid == 0 then
        if not doPlayerRemoveMoney(cid, SETUP.MONEY) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You need ' .. SETUP.MONEY ..' gps to play Slot Machine.')
        end
        doItemSetAttribute(item.uid, 'aid', 1)
        doCreatureSetNoMove(cid, true)
        switchLever(item)
        doSendAnimatedText(getThingPos(cid), '-$' .. SETUP.MONEY, 180)
        for tile = 1, 3 do
            doFruit(SETUP.POS[item.uid], tile, tile*SETUP.LIMIT)
        end
    elseif isInArray({1,2,3}, item.actionid) then
        doItemSetAttribute(item.uid, 'aid', item.actionid+1)
        switchLever(item)
    elseif item.actionid == 4 then
        switchLever(item)
        doCreatureSetNoMove(cid, false)
        verifyRow(cid, SETUP.POS[item.uid])
        doItemEraseAttribute(item.uid, 'aid')
    end
    return true
end