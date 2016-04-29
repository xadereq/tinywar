local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'stone skin amulet'}, 2197, 2000, 5, 'stone skin amulet')
shopModule:addBuyableItem({'might ring'}, 2164, 2000, 5, 'might ring')
shopModule:addBuyableItem({'time ring'}, 2169, 2000, 1, 'time ring')
shopModule:addBuyableItem({'energy ring'}, 2167, 500, 1, 'energy ring')
shopModule:addBuyableItem({'life ring'}, 2168, 1000, 1, 'life ring')
shopModule:addBuyableItem({'ring of healing'}, 2214, 2000, 1, 'ring of healing')
shopModule:addBuyableItem({'axe ring'}, 2208, 1000, 1, 'axe ring')
shopModule:addBuyableItem({'club ring'}, 2209, 1000, 1, 'club ring')
shopModule:addBuyableItem({'sword ring'}, 2210, 1000, 1, 'sword ring')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())