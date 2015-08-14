local controls = import('/lua/ui/game/borders.lua').controls

local oldCreateUI = CreateUI
function CreateUI()
    oldCreateUI()
    if panel then
        LayoutHelpers.AtHorizontalCenterIn(panel, controls.mapGroup)
    end
end