local messages = {
    "You gain leaf of marijuana due to killing players, then you can change every 100 leafs for 25 green eggs by NPC Rasta, who is in north east side of temple.",
    "Remember that you can report all bugs using !bug <sometext> command! We provide rewards for players who are making correct reports."
}

local i = 0
function onThink(interval, lastExecution)
	local message = messages[(i % #messages) + 1]
    doBroadcastMessage("Information: " .. message .. "", MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
    return TRUE
end