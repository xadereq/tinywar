function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6664 then
		if getPlayerStorageValue(cid,7588) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a SHP.")
			doPlayerAddItem(cid,7588,1)
			setPlayerStorageValue(cid,7588,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end