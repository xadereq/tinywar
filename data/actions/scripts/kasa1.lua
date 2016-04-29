function onUse(cid, item, frompos, item2, topos)


	if item.uid == 65002 then
		if getPlayerStorageValue(cid,2160) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Money :D.")
			doPlayerAddItem(cid,2160,5)
			setPlayerStorageValue(cid,2160,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end