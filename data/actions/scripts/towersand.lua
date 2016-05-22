function onUse(cid, item, frompos, item2, topos)

	if item.uid == 6999 then
		if getPlayerStorageValue(cid,6999) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found snake god's wristguard!")
			doPlayerAddItem(cid,12647,1)
			setPlayerStorageValue(cid,6999,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end