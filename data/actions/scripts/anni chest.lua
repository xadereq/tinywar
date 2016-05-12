--[[
	Annihaltor Chest's	
	by Maxi (Shawak)
]]--

	config = {
		storage = 5010,
		items = { --     id,count
			item_1 = {2278,1},  -- paral
			item_2 = {7417,1},  -- runed sword
			item_3 = {8850,1},  -- bow
			item_4 = {2195,1},   -- boh
			item_5 = {7415,1},
			item_6 = {2452,1}
		}
	}

function onUse(cid, item, frompos, item2, topos)

   	if getPlayerStorageValue(cid,config.storage) == -1 then
   		if item.uid == 5001 then
			newItem = config.items.item_1[1]
			count = config.items.item_1[2]
   		elseif item.uid == 5002 then
			newItem = config.items.item_2[1]
			count = config.items.item_2[2]
   		elseif item.uid == 5003 then
			newItem = config.items.item_3[1]
			count = config.items.item_3[2]
   		elseif item.uid == 5004 then
			newItem = config.items.item_4[1]
			count = config.items.item_4[2]
		elseif item.uid == 5005 then
			newItem = config.items.item_5[1]
			count = config.items.item_5[2]
		elseif item.uid == 5006 then
			newItem = config.items.item_6[1]
			count = config.items.item_6[2]
		end

		-- MSG  Config -----------------------------------------------------------------------------------------------------------------
		-- msgEmpty = "It is empty."
		-- msgGetItem = "You have found "..getItemArticleById(newItem).." "..getItemNameById(newItem).."."
		-- msgNoCap = "You have found a "..getItemNameById(newItem).." weighing "..getItemWeightById(newItem,count).." oz it is too heavy."
		-- msgEmpty = "It is empty."
		-- msgGetItem = "ya found"
		-- msgNoCap = "no cap"
		--------------------------------------------------------------------------------------------------------------------------------

		if getPlayerFreeCap(cid) >= getItemWeightById(newItem,count) then
   			setPlayerStorageValue(cid,config.storage,1)
   			if item.uid == 5003 then
   				doPlayerAddItem(cid,7363,1)
   			end
   			doPlayerAddItem(cid,newItem,count)
   			doPlayerSendTextMessage(cid,25,'You have found '..getItemArticleById(newItem)..' '..getItemNameById(newItem)..'.')
		else
			doPlayerSendTextMessage(cid,25,'You have found a '..getItemNameById(newItem)..' weighing '..getItemWeightById(newItem,count)..' oz it is too heavy.')
		end
   	else
   		doPlayerSendTextMessage(cid, 25, 'It is empty.')
   	end
   	return TRUE
end