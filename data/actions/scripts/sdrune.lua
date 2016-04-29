function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6976 then
		if getPlayerStorageValue(cid,2268) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a SD.")
			doPlayerAddItem(cid,2268,1)
			setPlayerStorageValue(cid,2268,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end