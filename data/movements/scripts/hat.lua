function onEquip(cid, item, slot)
        if getPlayerVocation(cid) == 1 then
doPlayerSetVocation(cid, 9)
doRemoveItem(item.uid, 1)

elseif getPlayerVocation(cid) == 2 then
doPlayerSetVocation(cid, 10)
doRemoveItem(item.uid, 1)

elseif getPlayerVocation(cid) == 3 then
doPlayerSetVocation(cid, 11)
doRemoveItem(item.uid, 1)

elseif getPlayerVocation(cid) == 4 then
doPlayerSetVocation(cid, 12)
doRemoveItem(item.uid, 1)

end
end