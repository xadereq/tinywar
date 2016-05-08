local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                                 npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    if msgcontains(msg, 'change') and doPlayerRemoveItem(cid, 11367, 100) == TRUE then
        npcHandler:say('Take your {soul scrolls} and be awared, there are thieves around us.', cid)
        doPlayerAddItem(cid, 12466, 25)
         else 
        npcHandler:say('You don\'t have them... don\'t tell me a lies!', cid)
     end
   return TRUE
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())