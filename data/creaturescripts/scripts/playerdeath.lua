local fragConfig = {
	ip = getConfigInfo('fragLimitIP'),
	guid = getConfigInfo('fragLimitGUID'),
	account = getConfigInfo('fragLimitAccount')
}

STORAGE_LAST_KILLER_GUID = 10100
STORAGE_LAST_KILLER_GUID_TIMES = 10101
STORAGE_LAST_KILLER_IP = 10200
STORAGE_LAST_KILLER_IP_TIMES = 10201
STORAGE_LAST_KILLER_ACCOUNT = 10300
STORAGE_LAST_KILLER_ACCOUNT_TIMES = 10301

function onDeath(cid, corpse, lastHitKiller, mostDamageKiller)
	doCreatureAddHealth(cid, 9999)	
	addEvent(doCreatureAddHealth, 100, cid, 9999)
	removeConditions(cid)
	doTeleportThing(cid, pozycja[math.random(1, #pozycja)], TRUE)
	
	local addFrag = true
	if isPlayer(lastHitKiller) == TRUE then
		-- anti MC, give frag ect.
		if getPlayerIp(lastHitKiller) ~= getPlayerIp(cid) then
			if getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID) ~= getPlayerGUID(cid) then
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID, getPlayerGUID(cid))
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID_TIMES, 1)
			else
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID_TIMES, getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID_TIMES)+1)
			end
			if getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP) ~= getPlayerIp(cid) then
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP, getPlayerIp(cid))
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP_TIMES, 1)
			else
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP_TIMES, getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP_TIMES)+1)
			end
			if getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT) ~= getPlayerAccountId(cid) then
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT, getPlayerAccountId(cid))
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT_TIMES, 1)
			else
				setPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT_TIMES, getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT_TIMES)+1)
			end
		end
		if getPlayerIp(lastHitKiller) == getPlayerIp(cid) then
			doPlayerSendTextMessage(lastHitKiller, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed player with same IP as yours. You will not gain frag. Multi-client?")
			addFrag = false
		elseif getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID_TIMES) >= fragConfig.guid then
			doPlayerSendTextMessage(lastHitKiller, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed same player " .. getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_GUID_TIMES) .. " times. You will not gain frag. Friend give you frags?")
			addFrag = false
		elseif getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP_TIMES) >= fragConfig.ip then
			doPlayerSendTextMessage(lastHitKiller, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed player with same IP " .. getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_IP_TIMES) .. " times. You will not gain frag. Friend give you frags?")
			addFrag = false
		elseif getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT_TIMES) >= fragConfig.account then
			doPlayerSendTextMessage(lastHitKiller, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed player with same account number " .. getPlayerStorageValue(lastHitKiller, STORAGE_LAST_KILLER_ACCOUNT_TIMES) .. " times. You will not gain frag. Friend give you frags?")
			addFrag = false
		end
		if addFrag then
			doPlayerAddSoul(lastHitKiller, 1)
			doPlayerAddItem(lastHitKiller, 5944, 1)
			doPlayerAddItem(lastHitKiller, 2151, 1)
			setPlayerStorageValue(lastHitKiller, 666, getPlayerStorageValue(lastHitKiller, 666)+1)
			doBroadcastMessage(getCreatureName(lastHitKiller) .. " (level " .. getPlayerLevel(lastHitKiller) .. ") murdered " .. getCreatureName(cid) .. " (level " .. getPlayerLevel(cid) .. ")",MESSAGE_STATUS_DEFAULT) 
			doPlayerSendTextMessage(lastHitKiller, MESSAGE_EVENT_ADVANCE, "You have " .. getPlayerStorageValue(lastHitKiller, 666) .. " frags and you gained " .. getPlayerSoul(lastHitKiller) .. " frags from login.")
			if (isPlayer(lastHitKiller) == TRUE) then
				if getPlayerSoul(lastHitKiller) >= 10 and getPlayerSoul(lastHitKiller) < 20 then
					doCreatureSetSkullType(lastHitKiller,SKULL_GREEN)
				elseif getPlayerSoul(lastHitKiller) >= 20 and getPlayerSoul(lastHitKiller) < 30 then
					doCreatureSetSkullType(lastHitKiller,SKULL_WHITE)
				elseif getPlayerSoul(lastHitKiller) >= 30 and getPlayerSoul(lastHitKiller) < 40 then
					doCreatureSetSkullType(lastHitKiller,SKULL_YELLOW)
				elseif getPlayerSoul(lastHitKiller) >= 40 then
					doCreatureSetSkullType(lastHitKiller,SKULL_RED)
				end
			end
		end
		local DB_addFrag = 0
		local DB_assist = 0
		local DB_assist_ip = 0
		if addFrag == true then
			DB_addFrag = 1
		end
		if isPlayer(mostDamageKiller) == TRUE then
			DB_assist = getPlayerGUID(mostDamageKiller)
			DB_assist_ip = getPlayerIp(mostDamageKiller)
		end
		db.executeQuery("INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `player_ip`, `killer`, `killer_level`, `killer_ip`, `killer_2`, `killer_2_level`, `killer_2_ip`, `add_frag`) VALUES (" .. getPlayerGUID(cid) .. ", " .. os.time() .. ", " .. getPlayerLevel(cid) .. ", " .. getPlayerIp(cid) .. ", " .. getPlayerGUID(lastHitKiller) .. ", " .. getPlayerLevel(lastHitKiller) .. ", " .. getPlayerIp(lastHitKiller) .. ", " .. getPlayerGUID(mostDamageKiller) .. ", " .. getPlayerLevel(mostDamageKiller) .. ", " .. getPlayerIp(mostDamageKiller) .. ", " .. tonumber(DB_addFrag) .. ");")
	end
end
