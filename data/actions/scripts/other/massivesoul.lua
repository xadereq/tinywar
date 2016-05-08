function onUse(cid, item, frompos, item2, topos)

if getPlayerLevel(cid) >= 13 and getPlayerLevel(cid) < 40 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"30000 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 30000)
elseif getPlayerLevel(cid) > 40 and getPlayerLevel(cid) < 50 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"10000 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 10000)
elseif getPlayerLevel(cid) > 50 and getPlayerLevel(cid) < 60 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"5000 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 5000)
elseif getPlayerLevel(cid) > 60 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"2000 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 2000)
end
end