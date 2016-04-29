function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6984 then
		if getPlayerStorageValue(cid,2400) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Magic Sword.")
			doPlayerAddItem(cid,2400,1)
			setPlayerStorageValue(cid,2400,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end