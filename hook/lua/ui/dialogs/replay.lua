local controls = import('/lua/ui/game/borders.lua').controls

local oldCreateDialog = CreateDialog
function CreateDialog(over, isLoad, exitBehavior)
    oldCreateDialog(controls.mapGroup, isLoad, exitBehavior)
end