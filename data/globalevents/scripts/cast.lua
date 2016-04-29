function onThink(interval)
	for _, pid in pairs(getCastsOnline()) do
		doPlayerSave(pid)
	end
	return true
end
