function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6982 then
		if getPlayerStorageValue(cid,2269) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Wildgroath Rune.")
			doPlayerAddItem(cid,2269,1)
			setPlayerStorageValue(cid,2269,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end