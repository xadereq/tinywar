function onAdvance(cid)
if getPlayerLevel(cid) >= 99 then
doPlayerAddExperience(cid, (getExperienceForLevel(99) - getPlayerExperience(cid)))
end
return true
end 