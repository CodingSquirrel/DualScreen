local oldUpdateDialog = UpdateDialog
function UpdateDialog(beatNumber, strings)
    oldUpdateDialog(beatNumber, strings)
	local controls = import('/lua/ui/game/borders.lua').controls
    LayoutHelpers.AtHorizontalCenterIn(dialog, controls.mapGroup)
end