local config = {
        max = 1,
        group_id = 1  -- it will only kick player whit that id (1=Players, 2=tutor, 3=seniortutors, 4=Gm's, 5=Cm's and 6=God's
}

local accepted_ip_list = {"188.127.19.182"} -- the Ip's entered here are allowed to use Mc/Magebomb..

local function antiMC(p)
        if #getPlayersByIp(getPlayerIp(p.pid)) >= p.max then
                doAddAccountBanishment(getPlayerAccountId(p.pid), target, os.time() + 120, 5, 2,"Using MC", 0)
                doRemoveCreature(p.pid)
        end
        return TRUE
end

function onLogin(cid)
        if getPlayerGroupId(cid) <= config.group_id then
                if isInArray(accepted_ip_list, doConvertIntegerToIp(getPlayerIp(cid))) == FALSE then
                        addEvent(antiMC, 1000, {pid = cid, max = config.max+1})
                end
        end
        return TRUE
end 