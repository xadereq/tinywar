local config = {
message = "Go and kill next boss",
teleportId = 1387,
bosses = { -- Monster Name, Teleport To Position, Teleport Position
["Apocalypse"] = { { x = 934, y = 926, z = 9 }, { x = 908, y = 923, z = 9 }},



}
}


function onDeath(cid, corpse, killer)
local position = getCreaturePosition(cid)
for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then

doCreateTeleport(config.teleportId, pos[1], pos[2])
doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
end
end
return TRUE
end