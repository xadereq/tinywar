function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6972 then
		if getPlayerStorageValue(cid,2647) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Plate Legs.")
			doPlayerAddItem(cid,2647,1)
			setPlayerStorageValue(cid,2647,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end