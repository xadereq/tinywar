function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6970 then
		if getPlayerStorageValue(cid,2323) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Hat of the mad.")
			doPlayerAddItem(cid,2323,1)
			setPlayerStorageValue(cid,2323,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end