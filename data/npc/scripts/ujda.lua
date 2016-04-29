local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    if msgcontains(msg, 'yes') and doPlayerRemoveItem(cid, 6544, 100) == TRUE and doPlayerRemoveMoney(cid, 0) == TRUE then
        npcHandler:say('There you are! Enjoy your {brand-new softs boots}.', cid)
        doPlayerAddItem(cid, 6545, 1)
         else 
        npcHandler:say('come back when You have them!', cid)
     end
   return TRUE
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())