--- Create by Collo~ gg: 7284838 (c)----

function onStepIn(cid, item, pos) 
local tp = { 
            {x=1417, y=967, z=6},
            {x=1417, y=969, z=6} 
            } 
    if isCreature(cid) == TRUE then 
        doTeleportThing(cid, tp[math.random(#tp)]) 
    end 
return true 
end 