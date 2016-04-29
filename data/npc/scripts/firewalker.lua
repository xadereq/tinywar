local focuses = {}
local function isFocused(cid)
for i, v in pairs(focuses) do
if(v == cid) then
return true
end
end
return false
end

local function addFocus(cid)
if(not isFocused(cid)) then
table.insert(focuses, cid)
end
end
local function removeFocus(cid)
for i, v in pairs(focuses) do
if(v == cid) then
table.remove(focuses, i)
break
end
end
end
local function lookAtFocus()
for i, v in pairs(focuses) do
if(isPlayer(v) == TRUE) then
doNpcSetCreatureFocus(v)
return
end
end
doNpcSetCreatureFocus(0)
end

function onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
if(isFocused(cid)) then
selfSay("Hmph!")
removeFocus(cid)
if(isPlayer(cid) == TRUE) then --Be sure he's online
closeShopWindow(cid)
end
end
end


function onCreatureSay(cid, type, msg)
if((msg == "hi") and not (isFocused(cid))) then
selfSay("Welcome, ".. getCreatureName(cid) .."Yes, my fathers was a great one blacksmith, it was a wise person , but when he decided to teach me he dies and i just learn about the lovely boots. So, did you bring me some boots? which one?", cid, TRUE)
selfSay("Do you want {specialised}?", cid)
addFocus(cid)	
elseif((isFocused(cid)) and (msg == "boot" or msg == "specialised")) then
selfSay('I need 10k and worn firewalker boots , to give you the repared firewalker boots. Say {worn firewalker boots}.', cid)

------------------------------------------------ repare firewalker boots ------------------------------------------------
elseif((isFocused(cid)) and (msg == "firewalker boots" or msg == "firewalker boot" or msg == "worn firewalker boots" or msg == "worn firewalker boot")) then
if isPremium(cid) then
if getPlayerItemCount(cid,9934) >= 1 and getPlayerItemCount(cid,2152) >= 100 or getPlayerItemCount(cid,9934) >= 1 and getPlayerItemCount(cid,2160) >= 1 then
selfSay('Did you bring me 10k and worn firewalker boots?', cid)
talk_state = 1
else	
selfSay('I need 10k and worn firewalker boots , to give you the repared firewalker boots boots. Come back when you have them.', cid)
talk_state = 0
end
else
selfSay('You need premmy account, to repare firewalker boots.')
talk_state = 0
end
------------------------------------------------ confirm yes ------------------------------------------------
elseif((isFocused(cid)) and (msg == "yeah" or msg == "yes")) and talk_state == 1 then
talk_state = 0
if getPlayerItemCount(cid,9934) >= 1 and getPlayerItemCount(cid,2152) >= 100 or getPlayerItemCount(cid,9934) >= 1 and getPlayerItemCount(cid,2160) >= 1 then
if doPlayerTakeItem(cid,9934,1) and doPlayerTakeItem(cid,2152,100) == 0 or doPlayerTakeItem(cid,9934,1) and doPlayerTakeItem(cid,2160,1) == 0 then
selfSay('Here you are.')
doPlayerAddItem(cid,9933,1)
end
else
selfSay('Sorry, you don\'t have these items.')
end	
elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya")) then
selfSay("Goodbye!", cid, TRUE)
removeFocus(cid)
end


function onThink()
for i, focus in pairs(focuses) do
if(isCreature(focus) == FALSE) then
removeFocus(focus)
else
local distance = getDistanceTo(focus) or -1
if((distance > 4) or (distance == -1)) then
selfSay("Hmph!")
closeShopWindow(focus)
removeFocus(focus)
end
end
end
lookAtFocus()
end
end