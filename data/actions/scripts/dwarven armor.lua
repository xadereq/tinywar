function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6986 then
		if getPlayerStorageValue(cid,8872) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Dwarven Armor")
			doPlayerAddItem(cid,2503,1)
			setPlayerStorageValue(cid,8872,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end