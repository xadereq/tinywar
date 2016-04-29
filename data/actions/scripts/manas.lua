function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6979 then
		if getPlayerStorageValue(cid,7620) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a MP.")
			doPlayerAddItem(cid,7620,1)
			setPlayerStorageValue(cid,7620,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end