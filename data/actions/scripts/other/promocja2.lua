function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerVocation(cid) == 1 then
doPlayerSetVocation(cid, 9)
doCreatureSay(cid, "You are now a Epic Sorcerer!", TALKTYPE_ORANGE_1)
doRemoveItem(item.uid, 1)
elseif getPlayerVocation(cid) == 2 then
doPlayerSetVocation(cid, 10)
doCreatureSay(cid, "You are now a Epic Druid!", TALKTYPE_ORANGE_1)
doRemoveItem(item.uid, 1)
elseif getPlayerVocation(cid) == 3 then
doPlayerSetVocation(cid, 11)
doCreatureSay(cid, "You are now a Epic Paladin!", TALKTYPE_ORANGE_1)
doRemoveItem(item.uid, 1)
elseif getPlayerVocation(cid) == 4 then
doPlayerSetVocation(cid, 12)
doCreatureSay(cid, "You are now a Epic Knight!", TALKTYPE_ORANGE_1)
doRemoveItem(item.uid, 1)
else
doPlayerSendCancel(cid,"You need to be promoted in order to use this item.")
end
return true
end 