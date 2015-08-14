local oldUpdate = Update
function Update()
    local newDialog = (parent == false)
    
    oldUpdate()
    
    if parent and newDialog then
        local controls = import('/lua/ui/game/borders.lua').controls
        LayoutHelpers.AtHorizontalCenterIn(parent, controls.mapGroup)
    end
end