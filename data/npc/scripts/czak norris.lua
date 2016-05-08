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
    
    if msgcontains(msg, 'yes') and doPlayerRemoveItem(cid, 11367, 100) == TRUE then
        npcHandler:say('Take your {eggs}, care!', cid)
        doPlayerAddItem(cid, 6544, 25)
         else 
        npcHandler:say('So come back when you have them!', cid)
     end
   return TRUE
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())