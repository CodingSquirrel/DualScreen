local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')

local oldSetLayout = SetLayout
function SetLayout()
	oldSetLayout()

    local controls = import('/lua/ui/game/tabs.lua').controls
	local savedParent = import('/lua/ui/game/tabs.lua').GetSavedParent()
    
	-- Neither the arrow nor the menu respect the parent's position
    LayoutHelpers.AtTopIn(controls.collapseArrow, savedParent, -3)
    LayoutHelpers.AtHorizontalCenterIn(controls.parent, savedParent)
    LayoutHelpers.AtTopIn(controls.parent, savedParent)
end