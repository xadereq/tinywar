function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6978 then
		if getPlayerStorageValue(cid,2293) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a MW Rune.")
			doPlayerAddItem(cid,2293,1)
			setPlayerStorageValue(cid,2293,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end