function onUse(cid, item, frompos, item2, topos)


	if item.uid == 65000 then
		if getPlayerStorageValue(cid,6528) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Avenger :D.")
			doPlayerAddItem(cid,6528,1)
			setPlayerStorageValue(cid,6528,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end