local condition = createConditionObject(CONDITION_INFIGHT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3 * 1000)

function onLogin(cid)
	doAddCondition(cid, condition)
	return true
end