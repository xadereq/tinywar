function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6977 then
		if getPlayerStorageValue(cid,2274) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Avalanche Rune.")
			doPlayerAddItem(cid,2274,1)
			setPlayerStorageValue(cid,2274,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end