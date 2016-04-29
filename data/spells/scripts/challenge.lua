  --[[
        Spell by Shawak
        Wolf transform
]]--

local time = 60 * 1000        -- 60 * 1000 = 2 min
local addShielding = 90        -- how much shielding should be added
local addFist = 90        -- how much shielding should be added


local wolf = {lookType = 52, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, time)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, addShielding)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)

local speed = createConditionObject(CONDITION_HASTE)
setConditionParam(speed, CONDITION_PARAM_TICKS, time)
setConditionFormula(speed, 0.7, -96, 0.7, -96)
setCombatCondition(combat, speed)

local outfit = createConditionObject(CONDITION_OUTFIT)
setConditionParam(outfit, CONDITION_PARAM_TICKS, time)
addOutfitCondition(outfit, wolf.lookTypeEx, wolf.lookType, wolf.lookHead, wolf.lookBody, wolf.lookLegs, wolf.lookFeet)
setCombatCondition(combat, outfit)

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_SUBID, 2)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, time)
setCombatCondition(combat, exhaust)

function onCastSpell(cid, var)
        return doCombat(cid, combat, var)
end 