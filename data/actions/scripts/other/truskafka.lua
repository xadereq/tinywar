function onUse(cid, item, frompos, item2, topos)

	local level = getPlayerLevel(cid)
	local mlevel = getPlayerMagLevel(cid)
	
	local exhausted_storagevalue = 2680
	
	local mana_minimum = 400
	local mana_maximum =400

	local mana_add = math.random(mana_minimum, mana_maximum)
	
		
		if(item.type >= 1) then
			if(os.time() > getPlayerStorageValue(cid, exhausted_storagevalue)) then
				if(isPlayer(cid) == 1) then
doSendMagicEffect(topos,12)
					doPlayerAddMana(cid, mana_add)
                                        doPlayerAddHealth(cid, mana_add)
doPlayerSay(cid,"I feel the better",1)
					setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
					doChangeTypeItem(item.uid, item.type - 1)
				else
					doSendMagicEffect(frompos, CONST_ME_POFF)
					doPlayerSendCancel(cid, "You are exchausted.")
				end
			else
				doSendMagicEffect(frompos, CONST_ME_POFF)
				doPlayerSendCancel(cid, "You are exhausted.")
			end
		else
			if(os.time() < getPlayerStorageValue(cid, exhausted_storagevalue)) then
				doSendMagicEffect(frompos, CONST_ME_POFF)
				doPlayerSendCancel(cid, "You are exhausted.")
			else
				if(isPlayer(cid) == 1) then
doSendMagicEffect(topos,12)
					doPlayerAddMana(cid, mana_add)
                                        doPlayerAddHealth(cid, mana_add*1.5)
doPlayerSay(cid,"I feel better",1)
					setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
					doRemoveItem(item.uid, 1)
				else
					doSendMagicEffect(frompos, CONST_ME_POFF)
					doPlayerSendCancel(cid, "You are exchausted.")
				end
			end
		end
						
	return 1
end