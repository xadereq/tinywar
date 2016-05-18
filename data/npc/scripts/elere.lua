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
    
    if msgcontains(msg, 'change') and doPlayerRemoveItem(cid, 12466, 100) == TRUE then
        npcHandler:say('There you go, your powerful, unique and rare massive soul scroll!', cid)
        doPlayerAddItem(cid, 6119, 1)
         else 
        npcHandler:say('Come back when you will have them!', cid)
     end
   return TRUE
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())