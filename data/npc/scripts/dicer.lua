local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					    	npcHandler:onThink() end
 
local function delayMoneyRemoval(item, pos)
	doRemoveItem(getTileItemById(pos, item).uid)
	return true
end
 
local function placeMoney(amount, table_middle_pos)
	local remain = amount
	local heart = 0

	heart = remain - (remain % 1)
	addEvent(doCreateItem, 550, 11367, heart, table_middle_pos)
end
 
local function rollDice(roll, h_count, table_left_pos, table_middle_pos, npc)
	local dice_ids = {5792, 5793, 5794, 5795, 5796, 5797}
	local random_rollval = math.random(1,6)
	local total_g = h_count
	local prize_percent = 0.9 -- 90%
 
	if ((h_count) <= 100 and (h_count) >= 25) then
		doSendMagicEffect(table_left_pos, CONST_ME_CRAPS)
 
		for _, itemId in pairs(dice_ids) do
				if(getTileItemById(table_left_pos, itemId).uid > 0) then
				doTransformItem(getTileItemById(table_left_pos, itemId).uid, dice_ids[random_rollval])
			end
		end
 
		if (roll == 1 and random_rollval <= 3) then
			placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
			addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
			addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
			addEvent(doCreatureSay, 500, npc, "You won ".. (total_g * prize_percent)-((total_g * prize_percent) % 1) .. " souls!", TALKTYPE_SAY, false, 0)
		elseif (roll == 2 and random_rollval >= 4) then
			placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
			addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
			addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
			addEvent(doCreatureSay, 500, npc, "You won ".. (total_g * prize_percent)-((total_g * prize_percent) % 1) .. " souls!", TALKTYPE_SAY, false, 0)
		else
			addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_BLOCKHIT)
			addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_BLOCKHIT)
			addEvent(doCreatureSay, 500, npc, "Better luck next time.", TALKTYPE_SAY, false, 0)
		end
		doCreatureSay(npc, string.format("%s rolled a %d.", getCreatureName(npc), random_rollval), TALKTYPE_ORANGE_1, false, 0, table_left_pos)
	else
		addEvent(doCreateItem, 100, 11367, h_count, table_middle_pos)
		doCreatureSay(npc, "The minimum wager is 25 souls and the maximum wager is 100 souls.", TALKTYPE_SAY, false, 0)
	end
	return true
end
 
function creatureSayCallback(cid, type, msg)
	-- NPC userdata instance
	local npc = getNpcCid()
 
	-- Participating player userdata instance
	local position = {x = getNpcPos().x+2, y = getNpcPos().y, z = getNpcPos().z}
	position.stackpos = STACKPOS_TOP_CREATURE
	local player_uid = getThingfromPos(position).uid
 
	-- Game table position userdata instances
	local table_left_pos = {x = 994, y = 1008, z = 8}
	local table_middle_pos = {x = 995, y = 1008, z = 8}
 
	-- Search for coins on the left and middle tables and create item userdata instances

	local table_middle_h = getTileItemById(table_middle_pos, 11367)
	local table_left_h = getTileItemById(table_left_pos, 11367)
 
	-- Other variables
	local h_count = 0
	local ROLL, LOW, HIGH = 0, 1, 2
 
	if (player_uid ~= 0) then
		if ((msgcontains(string.lower(msg), 'high') or msgcontains(string.lower(msg), 'h')) and (isPlayer(player_uid) and player_uid == cid)) then
			ROLL = HIGH
		elseif ((msgcontains(string.lower(msg), 'low') or msgcontains(string.lower(msg), 'l')) and (isPlayer(player_uid) and player_uid == cid)) then
			ROLL = LOW
		else
			return false
		end
		if (table_left_h.uid ~= 0) then
			addEvent(delayMoneyRemoval, 250, 11367, table_left_pos)
		end
		if (table_middle_h.uid ~= 0) then
			h_count = table_middle_h.type
			doTeleportThing(table_middle_h.uid, table_left_pos)
			addEvent(delayMoneyRemoval, 300, 11367, table_left_pos)
		end
		addEvent(rollDice, 500, ROLL, h_count, table_left_pos, table_middle_pos, npc)
	else
		return false
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)