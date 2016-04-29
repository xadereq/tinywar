local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 350)
setConditionParam(condition, CONDITION_PARAM_TICKS, 30 * 1000)

function onCastSpell(cid, var)
    doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
    return doAddCondition(cid, condition) and doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
end  