function onStepIn(cid, item, position, fromPosition) 
    if item.uid > 0 and item.uid <= 65535 and isPlayer(cid) == TRUE and getPlayerGroupId(cid) <= 3 then 
        doTeleportThing(cid, fromPosition, FALSE) 
    end 
    return TRUE 
end