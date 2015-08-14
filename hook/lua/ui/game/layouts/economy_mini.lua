local oldSetLayout = SetLayout
function SetLayout()
	oldSetLayout()
    local GUI = import('/lua/ui/game/economy.lua').GUI
    local parent = import('/lua/ui/game/economy.lua').savedParent
	-- The arrow doesn't actually use its parent for positioning, so set it here
    LayoutHelpers.AtLeftTopIn(GUI.collapseArrow, parent, -3, 22)
end