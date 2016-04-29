function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6529 then
		if getPlayerStorageValue(cid,7363) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Piercing Bolt.")
			doPlayerAddItem(cid,7363,1)
			setPlayerStorageValue(cid,7363,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end