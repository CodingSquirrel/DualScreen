local oldCreateScoreUI = CreateScoreUI
function CreateScoreUI(parent)
	-- The existing CreateScoreUI takes parent but doesn't actually use it, and it's actually null
	-- so just retrieve it from borders and use that
	oldCreateScoreUI(parent)
	local controls = import('/lua/ui/game/borders.lua').controls
	savedParent = controls.mapGroup
end