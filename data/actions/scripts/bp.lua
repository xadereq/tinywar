function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6553 then
		if getPlayerStorageValue(cid,2365) == -1 then
			doPlayerSendTextMessage(cid,25,"Nice looking bp.")
			doPlayerAddItem(cid,2365,1)
			setPlayerStorageValue(cid,2365,1)
		else
			doPlayerSendTextMessage(cid,25,"BP")
		end
	
	end
	return TRUE
end