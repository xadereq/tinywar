function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6974 then
		if getPlayerStorageValue(cid,2191) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Piercing Bolt.")
			doPlayerAddItem(cid,2191,1)
			setPlayerStorageValue(cid,2191,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end