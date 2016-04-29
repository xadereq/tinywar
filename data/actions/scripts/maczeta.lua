function onUse(cid, item, frompos, item2, topos)


	if item.uid == 5274 then
		if getPlayerStorageValue(cid,2420) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a Machete Waszka G (I taking balaclawa when I going to action!!) :D.")
			doPlayerAddItem(cid,2420,1)
			setPlayerStorageValue(cid,2420,1)
		else
			doPlayerSendTextMessage(cid,25,"Maczeta is only one.")
		end
	
	end
	return TRUE
end