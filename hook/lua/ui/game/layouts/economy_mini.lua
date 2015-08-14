local oldSetLayout = SetLayout
function SetLayout()
	oldSetLayout()
    local GUI = import('/lua/ui/game/economy.lua').GUI
	local ecostats = import('/lua/ui/game/economy.lua').ecostats
    local parent = import('/lua/ui/game/economy.lua').savedParent
	-- Neither the arrow nor the eco bar actually use their parent for positioning, so set it here
    LayoutHelpers.AtLeftTopIn(GUI.collapseArrow, parent, -3, 22)
	LayoutHelpers.AtLeftTopIn(ecostats, parent, 342, 8)
end