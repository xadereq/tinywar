------STORAGE-------
------100 do 104-------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local item1 = 5953
local item2 = 2159
local item3 = 5919
local item4 = 2677
local item5 = 5808
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'mission')) then
selfSay('I can give you reward for mission {first, second, third, fourth, fifth}', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'First')) then
selfSay('Aaah.. Hey, you! Can you help me? Look, my friend Rasta needs some leaves of marijuana to trade with people, he stays next to holy temple. If you are interested, say {marijuana}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'marijuana') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) > 1) then
selfSay('Ok, so give me 25 marijuanas', cid)
else
if (getPlayerStorageValue(cid,100) > 0) then
selfSay('Sorry, but you arleady did this mission!', cid)
else
if(doPlayerRemoveItem(cid, item1, 25) == TRUE) then
setPlayerStorageValue(cid,100,1)
doPlayerAddExperience(cid,3000)
selfSay('Thanks for marijuanas. (3000exp up)', cid)
else
selfSay('I need 25 marijuanas.', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'second')) then
selfSay('Hey, you want second mission? Ok, now listen. You know desert areas? It is so scary place for me.. but i promised to my sister, that i will gain {25 scarab coins} for her! She is jeweler. Do you want {help} me? ', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'help') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) < 1) then
selfSay('Ok, great. Go hunt at some scarabs and gain for me 25 scarab coins, then come here.', cid)
else
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('Sorry, but you arleady did this mission!', cid)
else
if(doPlayerRemoveItem(cid, item2, 25) == TRUE) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExperience(cid,5000)
selfSay('Thanks for 25 scarab coins. (5000 exp up)', cid)
else
selfSay('I need 25 scarab coins.', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'third')) then
selfSay('Hello! You are very helpful, so i hope that you will help me again. You know my friend named {Addons}? He is selling addons at +1 of Temple. His stocks of items are at the finish, speccialy Warrior addon items. Can you gain for him {dragon claw}?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'dragon claw') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) < 1) then
selfSay('Ok, i will wait here for dragon claw!', cid)
else
if (getPlayerStorageValue(cid,102) > 0) then
selfSay('Sorry, but you arleady did this mission!', cid)
else
if(doPlayerRemoveItem(cid, item3, 1) == TRUE) then
setPlayerStorageValue(cid,102,1)
doPlayerAddExperience(cid,8000)
selfSay('Thanks for dragon claw. (8000 exp up)', cid)
else
selfSay('I need dragon claw.', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'fourth')) then
selfSay('Hey, again you. This time i want to ask you for collect 100 blueberries. See, my sister really loves {blueberries}, and she is really sad last time. I hope that will make her little happy', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'blueberries') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,102) < 1) then
selfSay('Have you arleady 100 blueberries?.', cid)
else
if (getPlayerStorageValue(cid,103) > 0) then
selfSay('Sorry, but you arleady did this mission!', cid)
else
if(doPlayerRemoveItem(cid, item4, 100) == TRUE) then
setPlayerStorageValue(cid,103,1)
doPlayerAddExperience(cid,10000)
selfSay('Thanks for blueberries. (10000exp up)', cid)
else
selfSay('I need 100 blueberries.', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'fifth')) then
selfSay('Heeey.. last mission is really hard. You know beast that is named Orshabaal? Urghh.. it is so scary. My friend {Ogrodnik} is little weird creature, he is working at the new mixture, which gives so much strenght! He need {orshabaal brain}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'orshabaal brain') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,103) < 1) then
selfSay('Ok, i hope that you will have luck and you will be near place where Orshabaal respawn at his raid! Be lucky!', cid)
else
if (getPlayerStorageValue(cid,104) > 0) then
selfSay('Sorry, but you arleady did this mission!', cid)
else
if(doPlayerRemoveItem(cid, item5, 1) == TRUE) then
setPlayerStorageValue(cid,104,1)
doPlayerAddExperience(cid,30000)
selfSay('Thanks for orshabaal brain. (30000exp up)', cid)
else
selfSay('I need orshabaal brain.', cid)
end
end
end
return true
end
----------------------------------------------------------


----------------------------------------------------------
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())