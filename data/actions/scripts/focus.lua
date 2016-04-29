function onUse(cid, item, frompos, item2, topos)


	if item.uid == 6971 then
		if getPlayerStorageValue(cid,8871) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Focus cape.")
			doPlayerAddItem(cid,8871,1)
			setPlayerStorageValue(cid,8871,1)
		else
			doPlayerSendTextMessage(cid,25,"This chest is empty.")
		end
	
	end
	return TRUE
end