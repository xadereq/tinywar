local cfg = {
spawn = 10, -- time minutes open.. 10 min and closee tp
crates = 120
}

-- /////////////////////////////////// SPAWN FERU
function spawn_feru()
	doCreateMonster("Ferumbras", {x = 810 , y = 981, z = 3, stackpos = 253}, false, false)
	doBroadcastMessage("Ferumbras has just spawned!\nYou have two hours to kill him!", MESSAGE_EVENT_ADVANCE)
	addEvent(crates_feru, cfg.crates * 60 * 1000)
	return true
end

function crates_feru()
	feru1 = getThingFromPos({x = 811, y = 980, z = 4, stackpos = 1})
	feru2 = getThingFromPos({x = 812, y = 980, z = 4, stackpos = 1})
	feru3 = getThingFromPos({x = 813, y = 980, z = 4, stackpos = 1})
	if(feru1.uid ~= 0 and (isPlayer(feru1.uid) or isMonster(feru1.uid))) then
		doRemoveCreature(feru1.uid)
	end
	if(feru2.uid ~= 0 and (isPlayer(feru2.uid) or isMonster(feru2.uid))) then
		doRemoveCreature(feru2.uid)
	end
	if(feru3.uid ~= 0 and (isPlayer(feru3.uid) or isMonster(feru3.uid))) then
		doRemoveCreature(feru3.uid)
	end
	doCreateItem(1547,1,{x = 811, y = 980, z = 4})
	doCreateItem(1547,1,{x = 812, y = 980, z = 4})
	doCreateItem(1547,1,{x = 813, y = 980, z = 4})
	doCreateItem(1547,1,{x = 814, y = 980, z = 4})
	return true
end

-- /////////////////////////////////// END SPAWN FERU

-- /////////////////////////////////// SPAWN ORSH
function spawn_orsh()
	doCreateMonster("Orshabaal", {x = 916 , y = 977, z = 8, stackpos = 253}, false, false)
	doBroadcastMessage("Orshabaal has just spawned!\nYou have two hours to kill him!", MESSAGE_EVENT_ADVANCE)
	addEvent(crates_orsh, cfg.crates * 60 * 1000)
	return true
end

function crates_orsh()
	orsh1 = getThingFromPos({x = 931, y = 996, z = 7, stackpos = 253})
	orsh2 = getThingFromPos({x = 932, y = 996, z = 7, stackpos = 253})
	orsh3 = getThingFromPos({x = 933, y = 996, z = 7, stackpos = 253})
	if(orsh1.uid ~= 0) then
		doRemoveCreature(orsh1.uid)
	end
	if(orsh2.uid ~= 0) then
		doRemoveCreature(orsh2.uid)
	end
	if(orsh3.uid ~= 0) then
		doRemoveCreature(orsh3.uid)
	end
	doCreateItem(1547,1,{x = 931, y = 996, z = 7})
	doCreateItem(1547,1,{x = 932, y = 996, z = 7})
	doCreateItem(1547,1,{x = 933, y = 996, z = 7})
	return true
end
-- /////////////////////////////////// END SPAWN ORSH

-- /////////////////////////////////// SPAWN THUL
function spawn_thul()
	doCreateMonster("Thul", {x = 1023 , y = 1017, z = 9, stackpos = 253}, false, false)
	doBroadcastMessage("Thul has just spawned!\nYou have two hours to kill him!", MESSAGE_EVENT_ADVANCE)
	addEvent(crates_thul, cfg.crates * 60 * 1000)
	return true
end

function crates_thul()
	thul1 = getThingFromPos({x = 1023, y = 1050, z = 9, stackpos = 253})
	thul2 = getThingFromPos({x = 1024, y = 1050, z = 9, stackpos = 253})
	thul3 = getThingFromPos({x = 1025, y = 1050, z = 9, stackpos = 253})
	if(thul1.uid ~= 0) then
		doRemoveCreature(thul1.uid)
	end
	if(thul2.uid ~= 0) then
		doRemoveCreature(thul2.uid)
	end
	if(thul3.uid ~= 0) then
		doRemoveCreature(thul3.uid)
	end
	doCreateItem(1547,1,{x = 1023, y = 1050, z = 9})
	doCreateItem(1547,1,{x = 1024, y = 1050, z = 9})
	doCreateItem(1547,1,{x = 1025, y = 1050, z = 9})
	return true
end
-- /////////////////////////////////// END SPAWN THUL

-- /////////////////////////////////// SPAWN ASH
function spawn_ash()
	doCreateMonster("Ashmunrah", {x = 1144 , y = 985, z = 6, stackpos = 253}, false, false)
	doBroadcastMessage("Ashmunrah has just spawned!\nYou have two hours to kill him!", MESSAGE_EVENT_ADVANCE)
	addEvent(crates_ash, cfg.crates * 60 * 1000)
	return true
end

function crates_ash()
	ash1 = getThingFromPos({x = 1140, y = 986, z = 10, stackpos = 253})
	ash2 = getThingFromPos({x = 1147, y = 986, z = 10, stackpos = 253})
	if(ash1.uid ~= 0) then
		doRemoveCreature(ash1.uid)
	end
	if(ash2.uid ~= 0) then
		doRemoveCreature(ash2.uid)
	end
	doCreateItem(1547,1,{x = 1140, y = 986, z = 10})
	doCreateItem(1547,1,{x = 1141, y = 986, z = 10})
	doCreateItem(1547,1,{x = 1147, y = 986, z = 10})
	doCreateItem(1547,1,{x = 1148, y = 986, z = 10})
	return true
end
-- /////////////////////////////////// END SPAWN ASH

-- /////////////////////////////////// SPAWN ANI
function spawn_ani()
	doCreateMonster("Annihilon", {x = 1089 , y = 915, z = 12, stackpos = 253}, false, false)
	doBroadcastMessage("Annihilon has just spawned!\nYou have two hours to kill him!", MESSAGE_EVENT_ADVANCE)
	addEvent(crates_ani, cfg.crates * 60 * 1000)
	return true
end

function crates_ani()
	ani1 = getThingFromPos({x = 1081, y = 930, z = 12, stackpos = 253})
	ani2 = getThingFromPos({x = 1081, y = 931, z = 12, stackpos = 253})
	ani3 = getThingFromPos({x = 1081, y = 932, z = 12, stackpos = 253})
	if(ani1.uid ~= 0) then
		doRemoveCreature(ani1.uid)
	end
	if(ani2.uid ~= 0) then
		doRemoveCreature(ani2.uid)
	end
	if(ani3.uid ~= 0) then
		doRemoveCreature(ani3.uid)
	end
	doCreateItem(1546,1,{x = 1081, y = 930, z = 12})
	doCreateItem(1546,1,{x = 1081, y = 931, z = 12})
	doCreateItem(1546,1,{x = 1081, y = 932, z = 12})
	return true
end
-- /////////////////////////////////// END SPAWN ANI

function onTime()
if(os.date("%A") == "Monday") then -- monday
	doBroadcastMessage("Mighty Ferumbras will spawn in his tower in 10 minutes!\nPrepare yourself, evil is coming!", MESSAGE_EVENT_ADVANCE)
	doRemoveItem(getThingfromPos({x = 811, y = 980, z = 4, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 812, y = 980, z = 4, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 813, y = 980, z = 4, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 814, y = 980, z = 4, stackpos = 2}).uid,1)
	addEvent(spawn_feru, cfg.spawn * 60 * 1000)

	elseif(os.date("%A") == "Wednesday") then -- wednesday
	doBroadcastMessage("Powerfull Orshabaal will spawn in his cave in 10 minutes!\nPrepare yourself, evil is coming!", MESSAGE_EVENT_ADVANCE)
	doRemoveItem(getThingfromPos({x = 931, y = 996, z = 7, stackpos = 2}).uid,1)
	doRemoveItem(getThingfromPos({x = 932, y = 996, z = 7, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 933, y = 996, z = 7, stackpos = 2}).uid,1)
	addEvent(spawn_orsh, cfg.spawn * 60 * 1000)
	elseif(os.date("%A") == "Friday") then -- friday
	doBroadcastMessage("Thul - lord of the waters - will spawn under water in 10 minutes!\nPrepare yourself, evil is coming!", MESSAGE_EVENT_ADVANCE)
	doRemoveItem(getThingfromPos({x = 1023, y = 1050, z = 9, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 1024, y = 1050, z = 9, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 1025, y = 1050, z = 9, stackpos = 1}).uid,1)
	addEvent(spawn_thul, cfg.spawn * 60 * 1000)
	elseif(os.date("%A") == "Saturday") then -- saturday
	doBroadcastMessage("Sand king Ashmunrah will spawn in his pyramid in 10 minutes!\nPrepare yourself, evil is coming!", MESSAGE_EVENT_ADVANCE)
	doRemoveItem(getThingfromPos({x = 1140, y = 986, z = 10, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 1141, y = 986, z = 10, stackpos = 2}).uid,1)
	doRemoveItem(getThingfromPos({x = 1147, y = 986, z = 10, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 1148, y = 986, z = 10, stackpos = 2}).uid,1)
	addEvent(spawn_ash, cfg.spawn * 60 * 1000)
	elseif(os.date("%A") == "Sunday") then -- sunday
	doBroadcastMessage("Nightmare god Annihilon will spawn in mines in 10 minutes!\nPrepare yourself, evil is coming!", MESSAGE_EVENT_ADVANCE)
	doRemoveItem(getThingfromPos({x = 1081, y = 930, z = 12, stackpos = 2}).uid,1)
	doRemoveItem(getThingfromPos({x = 1081, y = 931, z = 12, stackpos = 1}).uid,1)
	doRemoveItem(getThingfromPos({x = 1081, y = 932, z = 12, stackpos = 2}).uid,1)
	addEvent(spawn_ani, cfg.spawn * 60 * 1000)
	end
	return true
end