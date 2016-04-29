function onUse(cid, item, frompos, item2, topos)


	if item.uid == 5279 then
		if getPlayerStorageValue(cid,2640) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found an soft :D.")
			doPlayerAddItem(cid,2640,1)
			setPlayerStorageValue(cid,2640,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end