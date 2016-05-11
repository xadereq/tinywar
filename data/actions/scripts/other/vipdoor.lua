-- Credits StreamSide and Empty
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cidPosition = getCreaturePosition(cid)
		if (item.actionid == 5788 and doPlayerRemoveItem(cid, 5785, 1) == TRUE) then
			if cidPosition.y < toPosition.y then
				doTeleportThing(cid, {x=toPosition.x,y=toPosition.y+1,z=toPosition.z}, TRUE)
								doCreatureSay(cid, "See you soon! :)", TALKTYPE_ORANGE_1)
			else
				doTeleportThing(cid, {x=toPosition.x,y=toPosition.y-1,z=toPosition.z}, TRUE)
								doCreatureSay(cid, "Thanks for comming back again!", TALKTYPE_ORANGE_1)
			end
			return TRUE
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry, but you need to have VIP medal to go through this door! Buy VIP medal in our shop or earn it by killing people! More info on site.")
			return TRUE
	end
	return FALSE
end
