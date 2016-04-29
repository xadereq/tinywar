function onTargetTile(cid, pos)
    local getPos = pos
    getPos.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
    local mob = {"skeleton", "skeleton", "skeleton", "skeleton", "ghoul", "ghoul", "ghoul", "ghoul", "ghost", "ghost", "ghost", "demon skeleton", "zombie", "crypt shambler", "mummy", "mummy", "mummy", "bonebeast", "skeleton warrior", "skeleton warrior", "skeleton warrior"}
    local corpse = getThingFromPos(getPos)
    if(corpse.uid > 0 and isCorpse(corpse.uid) and isMoveable(corpse.uid) and getCreatureSkullType(cid) ~= SKULL_BLACK) then
        local rand = math.random(1, 100)
        if rand < 80 then
        doRemoveItem(corpse.uid)
        doConvinceCreature(cid, doCreateMonster(mob[math.random(1, #mob)], pos)) 

        doSendMagicEffect(pos, CONST_ME_MORTAREA)
        else
        doRemoveItem(corpse.uid)
        end
        return true
    end

    return false
end

local area, combat = createCombatArea(AREA_CIRCLE2X2), createCombatObject()
setCombatArea(combat, area)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end 