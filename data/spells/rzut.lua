local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1.0, -0, 1.0, -0)

function OmnislashStrike(cid,combat,var,times,opos,Target)
    if not isCreature(cid) then
        doCreatureSetNoMove(Target, false)
        return true
    end
    if not isCreature(Target) then
        doCreatureSetNoMove(cid, false)
        return true
    end
    doCreatureSetNoMove(Target, true)
    doCreatureSetNoMove(cid, true)
    local newPos = getOppositeSidePos(cid,getCreaturePosition(Target))
    if times == 15 then
        if not doComparePositions(getCreaturePosition(cid),opos) then
            doTeleportThing(cid,opos)
            doSendDistanceShoot(newPos, opos, getWeaponDistanceEffect(getPlayerWeapon(cid).uid))
        end
        doCreatureSetNoMove(Target, false)
        doCreatureSetNoMove(cid, false)
        return doCombat(cid, combat, var)
    else
        if isWalkable(cid,newPos) and newPos ~= getCreaturePosition(cid) then
            local fromPos = getCreaturePosition(cid)
            doTeleportThing(cid,newPos)
            doSendDistanceShoot(fromPos, newPos, getWeaponDistanceEffect(getPlayerWeapon(cid).uid))
        end
        doCombat(cid, combat, var)
        return addEvent(OmnislashStrike,333,cid,combat,var,times+1,opos,Target)
    end
end

function onCastSpell(cid, var)
    return addEvent(OmnislashStrike,0,cid,combat,var,0,getCreaturePosition(cid),getCreatureTarget(cid))
end