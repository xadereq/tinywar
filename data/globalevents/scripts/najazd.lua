function onThink(cid, interval)
    local stone = 1304
    local pos = {x = 837, y = 1027, z = 7}
    local type, message = MESSAGE_STATUS_EVENT, "Orshabaal just ruined a stones which was blocking him at Banshee Room, at the west of city!!"
    return doRemoveItem(getThingFromPos(pos, false).uid) and doBroadcastMessage(message, type) and addEvent(function() doCreateItem(stone, 1, pos) end, 9 * 60 * 1000)
end