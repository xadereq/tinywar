function onUse(cid, item, fromPosition, itemEx, toPosition)
	local prof, sv = getPlayerVocation(cid), getPlayerStorageValue(cid, 100000)
	if(prof > 4)then
		prof = prof - 4
	end

	if(item.itemid == 6542 and prof == 3 and sv < 10)then
		local skill = SKILL_DISTANCE
		doPlayerAddSkillTry(cid, skill, (getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1)) / getConfigInfo('rateSkill'))
	elseif(item.itemid == 6541 and prof == 4 and sv < 10)then
		doPlayerAddSkill(cid, SKILL_CLUB, 1)
		doPlayerAddSkill(cid, SKILL_SWORD, 1)
		doPlayerAddSkill(cid, SKILL_AXE, 1)
		local skills = {SKILL_CLUB, SKILL_SWORD, SKILL_AXE}
		for _,skill in pairs(skills) do
			doPlayerAddSkillTry(cid, skill, (getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1)) / getConfigInfo('rateSkill'))
		end
	else
		return false
	end
	if(item.type > 1)then 
		doChangeTypeItem(item.uid,item.type-1) 
	else 
		doRemoveItem(item.uid,1) 
	end 
	setPlayerStorageValue(cid, 100000, sv+1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your skill has been upgraded!")
	return true
end