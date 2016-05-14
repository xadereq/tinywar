--Script by Sonical
function onAdvance(cid, skill, oldLevel, newLevel)
if getPlayerLevel(cid) >= 61 then
doPlayerAddExperience(cid, (getExperienceForLevel(60) - getPlayerExperience(cid)))
end
return true
end