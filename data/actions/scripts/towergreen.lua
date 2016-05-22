function onUse(cid, item, frompos, item2, topos)

	if item.uid == 6662 then
		if getPlayerStorageValue(cid,6662) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found some items!")
			doPlayerAddItem(cid,8891,1)
			doPlayerAddItem(cid,2160,2)
			setPlayerStorageValue(cid,6662,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end