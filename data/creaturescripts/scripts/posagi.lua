--- Create by Collo~ gg: 7284838 (c)----

local all = 1550 -- uid posagu ktory pokazuje najlepszego gracza na Materii
local materia = 
{
	[1552] = {1, "sorcerer"},
	[1553] = {2, "druid"},
	[1554] = {3, "paladin"},
	[1551] = {4, "knight"},
}
function onLook(cid, item, position, lookDistance)
	if item.uid == all then
	c = db.getResult("SELECT `level`,`name`,`frags` FROM `players` WHERE `group_id` <= 3 ORDER BY `frags` DESC LIMIT 1;")
	Level = c:getDataInt('level')
	Frags = c:getDataInt('frags')
	Name = c:getDataString('name')
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, " Actually player " .. Name .. " (".. Level .." lvl) with " .. Frags .. " is the best fragger on the server!")
	return false
	end
	tab = materia[item.uid]
	if(tab == nil) then
		return true
	end
	c = db.getResult("SELECT `level`,`name` FROM `players` WHERE `vocation` = '"..tab[1].."' AND `group_id` <= 3 ORDER BY `level` DESC LIMIT 1;")
	Level = c:getDataInt('level')
	Name = c:getDataString('name')
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "" .. Name .. " (".. Level .." lvl) is currently the best "..tab[2].." on the server.")
end