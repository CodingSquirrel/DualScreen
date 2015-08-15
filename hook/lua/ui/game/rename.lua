local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local controls = import('/lua/ui/game/borders.lua').controls

local oldShowRenameDialog = ShowRenameDialog
function ShowRenameDialog(currentName)
    oldShowRenameDialog(currentName)
    LayoutHelpers.AtHorizontalCenterIn(dialog, controls.mapGroup)
end