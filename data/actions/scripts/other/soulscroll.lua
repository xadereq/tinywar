function onUse(cid, item, frompos, item2, topos)

if getPlayerLevel(cid) >= 13 and getPlayerLevel(cid) < 40 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"300 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 300)
elseif getPlayerLevel(cid) > 40 and getPlayerLevel(cid) < 50 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"100 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 100)
elseif getPlayerLevel(cid) > 50 and getPlayerLevel(cid) < 60 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"50 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 50)
elseif getPlayerLevel(cid) > 60 then
 doRemoveItem(item.uid, 1)
 doSendMagicEffect(topos,8)
  doSendAnimatedText(getCreaturePosition(cid),"20 XP", TEXTCOLOR_TEAL)
  doPlayerAddExp(cid, 20)
end
end