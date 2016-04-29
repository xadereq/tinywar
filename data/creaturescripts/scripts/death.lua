local reward = {
	item = 5953, --ITEM ID!
	count = 1 -- How many?
}
function onDeath(cid, corpse, deathList)
	for i = 1, #deathList do
		if isPlayer(deathList[i]) and getPlayerIp(cid) ~= getPlayerIp(deathList[i]) then
			doPlayerAddItem(deathList[i], reward.item, reward.count)
		end
	end
	return true
end