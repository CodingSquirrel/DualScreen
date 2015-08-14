local DualScreen = import('/mods/DualScreen/modules/dual_screen.lua')

local oldCreateUI = CreateUI
function CreateUI(isReplay)
    oldCreateUI(isReplay)
    
	DualScreen.init()
    local Borders = import('/lua/ui/game/borders.lua')
    Borders.SplitMapGroup(true, true)
end