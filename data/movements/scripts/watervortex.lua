local newpos = {x = 981, y = 1039, z = 8}

function onStepIn(cid, item, position, fromPosition)
	if item.actionid == 5666 then
		doTeleportThing(cid, newpos)
        doSendMagicEffect(newpos, CONST_ME_TELEPORT)
	end
	return true
end