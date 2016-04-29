function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6663 then
		if getPlayerStorageValue(cid,7589) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a SMP.")
			doPlayerAddItem(cid,7589,1)
			setPlayerStorageValue(cid,7589,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end