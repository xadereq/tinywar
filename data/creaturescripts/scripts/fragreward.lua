function onKill(cid, target, lastHit)
if cid ~= target and isPlayer(target) then
	if getPlayerIp(cid) == getPlayerIp(target) then
		doPlayerAddExperience(cid, -1000)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'You have been punished for killing a player of the same IP(-1000XP).')
	else
		doPlayerAddItem(cid, 11367, 1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Congratulations! You killed " .. getCreatureName(target) .. ".")
	end
end
	return true
end