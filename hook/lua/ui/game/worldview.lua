local DualScreen = import('/mods/DualScreen/modules/dual_screen.lua')

local oldCreateMainWorldView = CreateMainWorldView
function CreateMainWorldView(parent, mapGroup, mapGroupRight)
	if mapGroupRight and DualScreen.monitor == 'right' then
		oldCreateMainWorldView(parent, mapGroupRight, mapGroup)
	else
		oldCreateMainWorldView(parent, mapGroup, mapGroupRight)
	end
end