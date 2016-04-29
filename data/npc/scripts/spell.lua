local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

    if(npcHandler.focus ~= cid) then
        return false
    end
    
    if msgcontains(msg,'spells') then
        if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 then
            selfSay('For which level would you like to learn spells 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 37, 38, 41, 45, 55, 60?')
        else
            selfSay('Sorry, I only sell spells to sorcerers.')
        end
    end
return 1    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
 
 
local node1 = keywordHandler:addKeyword({'trup'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn undead legion for 170 gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'undead legion', vocation = 1, price = 170, level = 9})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node2 = keywordHandler:addKeyword({'find person'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to find person for 80 gp?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'Find Person', vocation = 1, price = 80, level = 8})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node3 = keywordHandler:addKeyword({'light magic missile'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn light magic missile for 500 gp?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light magic missile', vocation = 1, price = 500, level = 15})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node4 = keywordHandler:addKeyword({'antidote'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn antidote for 150 gp?'})
node4:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'antidote', vocation = 1, price = 150, level = 10})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node5 = keywordHandler:addKeyword({'death strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn death strike for 800 gp?'})
node5:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'death strike', vocation = 1, price = 800, level = 16})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node6 = keywordHandler:addKeyword({'intense healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn intense healing for 350 gp?'})
node6:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'intense healing', vocation = 1, price = 350, level = 11})
node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node7 = keywordHandler:addKeyword({'energy strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy strike for 600 gp?'})
node7:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'energy strike', vocation = 1, price = 800, level = 12})
node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node8 = keywordHandler:addKeyword({'levitate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn levitate for 800 gp?'})
node8:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'levitate', vocation = 1, price = 800, level = 12})
node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node9 = keywordHandler:addKeyword({'flame strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn flame strike for 800 gp?'})
node9:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'flame strike', vocation = 1, price = 800, level = 14})
node9:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node10 = keywordHandler:addKeyword({'great light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn great light for 500?'})
node10:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great Light', vocation = 1, price = 500, level = 13})
node10:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node11 = keywordHandler:addKeyword({'poison field'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn poison field for 300 gp?'})
node11:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'poison field', vocation = 1, price = 300, level = 14})
node11:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node12 = keywordHandler:addKeyword({'magic shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn magic shield for 450 gp?'})
node12:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'magic shield', vocation = 1, price = 300, level = 14})
node12:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node13 = keywordHandler:addKeyword({'strong haste'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn strong haste for 1300 gp?'})
node13:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'strong haste', vocation = 1, price = 1300, level = 20})
node13:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
 local node14 = keywordHandler:addKeyword({'ultimate light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn ultimate light for 1600 gp?'})
node14:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'Ultimate Light', vocation = 1, price = 1600, level = 26})
node14:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node15 = keywordHandler:addKeyword({'fire field'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn fire field for 500 gp?'})
node15:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'fire field', vocation = 1, price = 500, level = 15})
node15:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node16 = keywordHandler:addKeyword({'fireball'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn fireball for 1600 gp?'})
node16:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'fireball', vocation = 1, price = 1600, level = 27})
node16:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node17 = keywordHandler:addKeyword({'destroy field'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn destroy Field for 700 gp?'})
node17:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'destroy Field', vocation = 1, price = 700, level = 17})
node17:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node18 = keywordHandler:addKeyword({'energy field'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy eield for 700 gp?'})
node18:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'energy Field', vocation = 1, price = 700, level = 17})
node18:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node19 = keywordHandler:addKeyword({'fire wave'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn fire Wave for 850 gp?'})
node19:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'fire Wave', vocation = 1, price = 850, level = 18})
node19:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node20 = keywordHandler:addKeyword({'ultimate healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn ultimate healing for 1000 gp?'})
node20:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'ultimate healing', vocation = 1, price = 1000, level = 20})
node20:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node21 = keywordHandler:addKeyword({'haste'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn haste for 600 gp?'})
node21:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'haste', vocation = 1, price = 600, level = 14})
node21:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node22 = keywordHandler:addKeyword({'desintegrate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn desintegrate for 900 gp?'})
node22:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'desintegrate', vocation = 1, price = 900, level = 21})
node22:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node23 = keywordHandler:addKeyword({'great fireball'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn great fireball for 1200 gp?'})
node23:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great fireball', vocation = 1, price = 1200, level = 23})
node23:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node24 = keywordHandler:addKeyword({'creature illusion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn creature illusion for 1000 gp?'})
node24:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'creature illusion', vocation = 1, price = 1000, level = 23})
node24:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 local node25 = keywordHandler:addKeyword({'great energy beam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn great energy beam for 1800 gp?'})
node25:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'great energy beam', vocation = 1, price = 1800, level = 29})
node25:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node26 = keywordHandler:addKeyword({'heavy magic missile'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn heavy magic missile for 1500 gp?'})
node26:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'heavy magic missile', vocation = 1, price = 1500, level = 25})
node26:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node27 = keywordHandler:addKeyword({'summon creature'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn summon creature for 2000 gp?'})
node27:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'summon creature', vocation = 1, price = 2000, level = 25})
node27:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node28 = keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn light for 100 gp?'})
node28:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'light', vocation = 1, price = 100, level = 8})
node28:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node29 = keywordHandler:addKeyword({'cancel invisibility'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn cancel invisibility for 1600 gp?'})
node29:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'cancel invisibility', vocation = 1, price = 1600, level = 26})
node29:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node30 = keywordHandler:addKeyword({'soulfire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn soulfire for 1800 gp?'})
node30:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'soulfire', vocation = 1, price = 1800, level = 27})
node30:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node31 = keywordHandler:addKeyword({'animate dead'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn animate dead for 1200 gp?'})
node31:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'animate dead', vocation = 1, price = 1200, level = 27})
node31:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node32 = keywordHandler:addKeyword({'firebomb'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn firebomb for 1500 gp?'})
node32:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'firebomb', vocation = 1, price = 1500, level = 27})
node32:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node33 = keywordHandler:addKeyword({'poison wall'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn poison wall for 1600 gp?'})
node33:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'Poison Wall', vocation = 1, price = 1600, level = 29})
node33:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node34 = keywordHandler:addKeyword({'energy beam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy beam for 1000 gp?'})
node34:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'energy beam', vocation = 1, price = 1000, level = 23})
node34:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node35 = keywordHandler:addKeyword({'magic wall'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn magic wall for 2100 gp?'})
node35:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'magic wall', vocation = 1, price = 2100, level = 32})
node35:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node36 = keywordHandler:addKeyword({'fire wall'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn fire wall for 2000 gp?'})
node36:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'fire wall', vocation = 1, price = 2000, level = 33})
node36:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node37 = keywordHandler:addKeyword({'invisibility'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn invisibility for 2000 gp?'})
node37:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'invisibility', vocation = 1, price = 2000, level = 35})
node37:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node38 = keywordHandler:addKeyword({'energy bomb'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy bomb for 2300 gp?'})
node38:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'energy bomb', vocation = 1, price = 2300, level = 37})
node38:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node39 = keywordHandler:addKeyword({'energy wave'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy wave for 2500 gp?'})
node39:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'energy wave', vocation = 1, price = 2500, level = 38})
node39:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node40 = keywordHandler:addKeyword({'enchant staff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn enchant staff for 2000 gp?'})
node40:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'enchant staff', vocation = 1, price = 2000, level = 41})
node40:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node41 = keywordHandler:addKeyword({'energy wall'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy wall for 2500 gp?'})
node41:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'energy wall', vocation = 1, price = 2500, level = 41})
node41:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node42 = keywordHandler:addKeyword({'sudden death'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn sudden death for 3000 gp?'})
node42:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'sudden death', vocation = 1, price = 3000, level = 45})
node42:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node43 = keywordHandler:addKeyword({'explosion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn explosion for 1800 gp?'})
node43:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'explosion', vocation = 1, price = 1800, level = 31})
node43:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node44 = keywordHandler:addKeyword({'magic rope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn magic rope for 200 gp?'})
node44:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'magic rope', vocation = 1, price = 200, level = 9})
node44:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node45 = keywordHandler:addKeyword({'energy wall'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn energy wall for 2500 gp?'})
node45:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'energy wall', vocation = 1, price = 2500, level = 41})
node45:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node46 = keywordHandler:addKeyword({'sudden death'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn sudden death for 3000 gp?'})
node46:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'sudden death', vocation = 1, price = 3000, level = 45})
node46:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node47 = keywordHandler:addKeyword({'terra strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn terra strike for 800 gp?'})
node47:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'terra strike', vocation = 1, price = 800, level = 13})
node47:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node48 = keywordHandler:addKeyword({'ice strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn ice strike for 800 gp?'})
node48:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'ice strike', vocation = 1, price = 800, level = 15})
node48:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node49 = keywordHandler:addKeyword({'stalagmite'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn stalagmite for 1400 gp?'})
node49:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'stalagmite', vocation = 1, price = 1400, level = 24})
node49:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node50 = keywordHandler:addKeyword({'rage of the skies'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn rage of the skies for 6000 gp?'})
node50:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'rage of the skies', vocation = 1, price = 6000, level = 55})
node50:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node51 = keywordHandler:addKeyword({'hells core'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn hells core for 8000 gp?'})
node51:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'hells core', vocation = 1, price = 8000, level = 60})
node51:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node52 = keywordHandler:addKeyword({'thunderstorm'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn thunderstorm for 1100 gp?'})
node52:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'thunderstorm', vocation = 1, price = 1100, level = 28})
node52:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node53 = keywordHandler:addKeyword({'death strike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn death strike for 800 gp?'})
node53:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'death strike', vocation = 1, price = 800, level = 16})
node53:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
 
local node54 = keywordHandler:addKeyword({'intense healing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn intense healing for 800 gp?'})
node54:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'intense healing', vocation = 1, price = 350, level = 11})
node54:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the spell?', reset = true})
 
npcHandler:addModule(FocusModule:new())