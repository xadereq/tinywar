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
    
    if msgcontains(msg, 'change') and doPlayerRemoveItem(cid, 11367, 250) == TRUE then
        npcHandler:say('Congratulations! Now you are true VIP - you are now able to go to VIP island with this VIP medal. But remember, it\'s one-time pass only!', cid)
        doSendMagicEffect(getPlayerPosition(cid),31)
        doPlayerAddItem(cid, 5785, 1)
         else 
        npcHandler:say('Don\'t lie to me! You don\'t have it!', cid)
     end
   return TRUE
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())