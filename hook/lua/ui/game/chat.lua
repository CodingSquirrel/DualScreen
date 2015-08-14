local runCommand = import('/mods/DualScreen/modules/commands.lua').runCommand
local controls = import('/lua/ui/game/borders.lua').controls

local oldCreateChatEdit = import('/lua/ui/game/chat.lua').CreateChatEdit
local oldOnEnterPressed

function CreateChatEdit() 
	local group = oldCreateChatEdit()

	oldOnEnterPressed= group.edit.OnEnterPressed

	group.edit.OnEnterPressed = function(self, text)
		if(string.len(text) > 1 and string.sub(text, 1, 1) == "/") then
			local args = {}

			for w in string.gfind(string.sub(text, 2), "%S+") do
				table.insert(args, w)
			end

			if(runCommand(args)) then
				return
			end
		end

		return oldOnEnterPressed(self, text)
	end

	return group
end

local oldCreateConfigWindow = CreateConfigWindow
function CreateConfigWindow()
    oldCreateConfigWindow()
    LayoutHelpers.AtHorizontalCenterIn(GUI.config, controls.mapGroup)
end