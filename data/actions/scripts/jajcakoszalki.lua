function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6552 then
		if getPlayerStorageValue(cid,6544) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found an Egg .")
			doPlayerAddItem(cid,6544,70)
			setPlayerStorageValue(cid,6544,70)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end