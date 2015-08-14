local oldSetLayout = SetLayout
function SetLayout()
	oldSetLayout()
	
    local controls = import('/lua/ui/game/multifunction.lua').controls
    local savedParent = import('/lua/ui/game/multifunction.lua').savedParent
    local econControl = import('/lua/ui/game/economy.lua').GUI.bg
	-- The arrow doesn't use the parent for positioning, so set it here
    LayoutHelpers.Below(controls.collapseArrow, econControl, 24)
	LayoutHelpers.AtLeftIn(controls.collapseArrow, savedParent, -3)
end