function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6981 then
		if getPlayerStorageValue(cid,2305) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a FB Rune.")
			doPlayerAddItem(cid,2305,1)
			setPlayerStorageValue(cid,2305,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end