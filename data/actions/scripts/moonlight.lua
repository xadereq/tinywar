function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6975 then
		if getPlayerStorageValue(cid,2186) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Moonlight Rod.")
			doPlayerAddItem(cid,2186,1)
			setPlayerStorageValue(cid,2186,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end