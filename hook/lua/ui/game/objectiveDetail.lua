local controls = import('/lua/ui/game/borders.lua').controls

local oldCreate = Create
function Create()
    oldCreate()
    LayoutHelpers.AtHorizontalCenterIn(GUI.bg, controls.mapGroup)
end