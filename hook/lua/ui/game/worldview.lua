local DualScreen = import('/mods/DualScreen/modules/dual_screen.lua')

local oldCreateMainWorldView = CreateMainWorldView
function CreateMainWorldView(parent, mapGroup, mapGroupRight)
	if mapGroupRight and DualScreen.monitor == 'right' then
		LOG("Reverse that shit!")
		oldCreateMainWorldView(parent, mapGroupRight, mapGroup)
	else
		oldCreateMainWorldView(parent, mapGroup, mapGroupRight)
	end
	
	--if mapGroupRight and DualScreen.monitor == 'right' then
--		LOG("=======RIGHT SCREEN SHOULD DO THINGS NOW==========")
		--viewLeft:GetsGlobalCameraCommands(false)
		--viewRight:GetsGlobalCameraCommands(true)
	--end
    --import('/lua/ui/game/multifunction.lua').RefreshMapDialog()
end