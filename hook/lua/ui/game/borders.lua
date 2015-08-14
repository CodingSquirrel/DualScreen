local oldSplitMapGroup = SplitMapGroup
function SplitMapGroup(splitState, forceSplit)
	oldSplitMapGroup(splitState, forceSplit)
	
	-- Force refresh the layout
	local UIUtil = import('/lua/ui/uiutil.lua')
	local GameMain = import('/lua/ui/game/gamemain.lua')
	GameMain.SetLayout(UIUtil.currentLayout)
end