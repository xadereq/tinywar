function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6983 then
		if getPlayerStorageValue(cid,7368) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Assassin Star.")
			doPlayerAddItem(cid,7368,1)
			setPlayerStorageValue(cid,7368,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end