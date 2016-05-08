function onUse(cid, item, frompos, item2, topos)


	if item.uid == 64003 then
		if getPlayerStorageValue(cid,6544) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found many soul scrolls!")
			doPlayerAddItem(cid,12466,50)
			setPlayerStorageValue(cid,6544,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end