function onUse(cid, item, frompos, item2, topos)


	if item.uid == 8452 then
		if getPlayerStorageValue(cid,7915) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Glacier Mask.")
			doPlayerAddItem(cid,7902,1)
			setPlayerStorageValue(cid,7915,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end