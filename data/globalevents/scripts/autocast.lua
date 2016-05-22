local messages = {
    "You gain soul from your enemies, then NPC Headhunter can change for you every 100 souls into 25 soul scrolls. Headhunter is in north side of the temple.",
    "Remember that you can report all bugs using !bug <sometext> command! We provide rewards for players who are making correct reports.",
    "Do you want to be famous? You want to have your own followers? Type /cast \"on\" and let others watch your moves!"
}

local i = 0
function onThink(interval, lastExecution)
	local message = messages[(i % #messages) + 1]
    doBroadcastMessage("Information: " .. message .. "", MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
    return TRUE
end