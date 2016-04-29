function onUse(cid, item, frompos, item2, topos)


	if item.uid == 65001 then
		if getPlayerStorageValue(cid,7446) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Expensive Item :D.")
			doPlayerAddItem(cid,7446,1)
			setPlayerStorageValue(cid,7446,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end