--Script by Sonical
function onAdvance(cid, skill, oldLevel, newLevel)
if getPlayerLevel(cid) >= 55 then
doPlayerAddExperience(cid, (getExperienceForLevel(55) - getPlayerExperience(cid)))
end
return true
end