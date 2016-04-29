function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6985 then
		if getPlayerStorageValue(cid,2463) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Dwarven Legs.")
			doPlayerAddItem(cid,2504,1)
			setPlayerStorageValue(cid,2463,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end