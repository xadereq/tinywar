function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6987 then
		if getPlayerStorageValue(cid,2457) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Dwarven Helmet.")
			doPlayerAddItem(cid,2502,1)
			setPlayerStorageValue(cid,2457,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end