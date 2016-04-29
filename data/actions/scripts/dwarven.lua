function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6973 then
		if getPlayerStorageValue(cid,2525) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Dwarven shield")
			doPlayerAddItem(cid,2525,1)
			setPlayerStorageValue(cid,2525,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end