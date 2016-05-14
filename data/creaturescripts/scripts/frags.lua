  function onKill(cid, target, lastHit)
if isPlayer(target) and cid ~= target then
 db.executeQuery("UPDATE `players` SET `frags` = `frags` + 1 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
end
return true
end