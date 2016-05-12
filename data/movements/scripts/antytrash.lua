local item_exceptions = {2152, 2160, 5792, 5793, 5794, 5795, 5796, 5797}
function onAddItem(moveItem, tileItem, position, cid)
    if isPlayer(cid) then
    	if not isInArray(item_exceptions, moveItem.itemid) then
        doRemoveItem(moveItem.uid)
    end
    end
end