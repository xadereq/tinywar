local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 31)
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 22000)
setConditionFormula(condition, 10.7, -156, 10.7, -156)
setCombatCondition(combat, condition)
local function fire(parameters)
doCombat(parameters.cid, parameters.combat, parameters.var)
end
function onCastSpell(cid, var)
    local delay = 100
    local seconds = 0
    local parameters = { cid = cid, var = var, combat = combat }
    repeat
        addEvent(fire, seconds, parameters)
        seconds = seconds + delay
    until seconds == 22000
end  