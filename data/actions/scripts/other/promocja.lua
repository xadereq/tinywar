  function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(getPlayerPromotionLevel(cid) == 0) then
                doPlayerSendCancel(cid, "You need to be promoted in order to use this item.")
                return true
        end

        doPlayerSetPromotionLevel(cid, 2)
        doCreatureSay(cid, "You are now a " .. getVocationInfo(getPlayerVocation(cid)).name .. "!", TALKTYPE_MONSTER)
        doRemoveItem(item.uid, 1)
        return true
end 