function onUse(cid, item, frompos, item2, topos)


	if item.uid == 64004 then
		if getPlayerStorageValue(cid,6545) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found backpack of holding!")
			doPlayerAddItem(cid,2365,1)
			setPlayerStorageValue(cid,6545,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end