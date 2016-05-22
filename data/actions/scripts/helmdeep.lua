function onUse(cid, item, frompos, item2, topos)

	if item.uid == 6990 then
		if getPlayerStorageValue(cid,6990) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found your lost helmet! Oh stupid you!")
			doPlayerAddItem(cid,5461,1)
			setPlayerStorageValue(cid,6990,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end