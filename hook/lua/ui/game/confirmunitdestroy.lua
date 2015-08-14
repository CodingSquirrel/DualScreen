local borderControls = import('/lua/ui/game/borders.lua').controls

local oldConfirmUnitDestruction = ConfirmUnitDestruction
function ConfirmUnitDestruction()
    if import('/lua/ui/campaign/campaignmanager.lua').campaignMode and table.getn(EntityCategoryFilterDown(categories.COMMAND, GetSelectedUnits())) > 0 then
        UIUtil.QuickDialog(borderControls.mapGroup, '<LOC confirm_0001>You cannot self destruct during an operation!', '<LOC _Ok>', nil, 
            nil,  nil, 
            nil, nil,
            true, {worldCover = false, enterButton = 1, escapeButton = 1})
    else
        oldConfirmUnitDestruction()
    end
end