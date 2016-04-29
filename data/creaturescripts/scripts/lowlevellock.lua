function onLogin(cid)

	if getPlayerLevel(cid) < 13 then
	doPlayerAddExperience(cid, (getExperienceForLevel(13) - getPlayerExperience(cid)))
end
return TRUE
end