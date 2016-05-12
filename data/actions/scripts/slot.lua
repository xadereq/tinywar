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
    ['APPLE'] = 2674,    ['BANANA'] = 2676,
    ['CHERRY'] = 2679,   ['LEMON'] = 8841,        ['BAR'] = 6574,
}, {}

for name, id in pairs(TEMP) do
    _G[name] = id
    table.insert(FRUITS, id)
end

--    2. CONFIGURATION
SETUP = {
    COST = 10, --REQUIRED MONEY(gp) TO PLAY SLOT MACHINE
    TIME = 150, --MILLISECONDS TO SWITCH FRUITS
    LIMIT = 25, --COUNTER TO STOP CHANGING FRUIT IF PLAYER DOESN'T (decreases each SETUP.TIME)
    LEVER = {9825, 9826},
    WIN = {
    -- [FRUITS] = {PRIZE,#PRIZE}]
        --TRIPLE COMBINATIONS
        	[{LEMON,LEMON,LEMON}] = {11367,4},
            [{CHERRY,CHERRY,CHERRY}] = {11367,6},
            [{APPLE,APPLE,APPLE}] = {11367,8},
            [{BANANA,BANANA,BANANA}] = {11367,10},
            [{BAR,BAR,BAR}] = {11367,50},
        --ANY
        	[{LEMON,ANY,LEMON}] = {11367,3},
        	[{CHERRY,ANY,CHERRY}] = {11367,3},
            [{APPLE,ANY,APPLE}] = {11367,3},
            [{BANANA,ANY,BANANA}] = {11367,3},
            [{BAR,ANY,BAR}] = {11367,3},
        },
    MSG = {'Bingo!','Lucky!','Jackpot!','Win!','Well done!', 'Gratz!', 'Victory!'},
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
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'Congratulations! You won ' .. profit[2] .. ' ' .. getItemPluralNameById(profit[1]) ..'!')
                    break
                end
            end
        end
    end

    for tile = 1, 3 do
        doRemoveItem(getTileThingByPos(pos[tile]).uid)
        doSendMagicEffect(pos[tile], result and CONST_ME_GIFT_WRAPS or CONST_ME_EXPLOSIONHIT)
    end

    return not result and doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You have lost in the Slot Machine :( Try again!')
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
        if not doPlayerRemoveItem(cid, 11367, SETUP.COST) then
            return doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You need ' .. SETUP.COST ..' soul to play in Slot Machine.')
        end
        doItemSetAttribute(item.uid, 'aid', 1)
        doCreatureSetNoMove(cid, true)
        switchLever(item)
        doSendAnimatedText(getThingPos(cid), '-' .. SETUP.COST .. ' SOUL', 180)
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