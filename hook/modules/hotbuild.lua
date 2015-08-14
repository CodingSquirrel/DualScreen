local controls = import('/lua/ui/game/borders.lua').controls

local oldInitCycleMap = initCycleMap
function initCycleMap()
    oldInitCycleMap()
    LayoutHelpers.AtHorizontalCenterIn(cycleMap, controls.mapGroup)
end