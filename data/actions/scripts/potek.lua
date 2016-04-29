function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6980 then
		if getPlayerStorageValue(cid,7618) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Health Potion.")
			doPlayerAddItem(cid,7618,1)
			setPlayerStorageValue(cid,7618,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end