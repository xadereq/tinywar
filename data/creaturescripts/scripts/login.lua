local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 100)
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doPlayerAddPremiumDays(cid, 2)
		doPlayerSetPromotionLevel(cid, 1)
	end
	doPlayerFeed(cid, 3600)

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")

	registerCreatureEvent(cid, "Idle")
	-- if(config.useFragHandler) then
	-- 	registerCreatureEvent(cid, "SkullCheck")
	-- end

	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "ded")
	registerCreatureEvent(cid, "lvl")

	registerCreatureEvent(cid, "StartSkills")
	registerCreatureEvent(cid, "Lowlevellock")
	registerCreatureEvent(cid, "spamlog")

	registerCreatureEvent(cid, "TopFrags")
	registerCreatureEvent(cid, "FragReward")

	registerCreatureEvent(cid, "death")

	registerCreatureEvent(cid, "Posagi")
	return true
end