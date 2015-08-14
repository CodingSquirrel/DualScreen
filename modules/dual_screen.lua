local EnhanceCommon = import('/lua/enhancementcommon.lua')
local addCommand = import('/mods/DualScreen/modules/commands.lua').addCommand

local Prefs = import('/lua/user/prefs.lua')

monitor = 'left'
autoSplitScreen = true

function init(isReplay, parent)
	addCommand('leftMonitor', changeMonitor)
	addCommand('rightMonitor', changeMonitor)
	addCommand('enableAutoSplit', changeAutoSplitScreen)
	addCommand('disableAutoSplit', changeAutoSplitScreen)
	
	local tmp = Prefs.GetFromCurrentProfile('DualScreen_Monitor')
	if tmp ~= nil then
		monitor = tmp
	end
	
	tmp = Prefs.GetFromCurrentProfile('DualScreen_AutoSplit')
	if tmp ~= nil then
		autoSplitScreen = tmp
	end
end

function changeMonitor(args)
	if string.lower(args[1]) == string.lower('leftMonitor') then
		monitor = 'left'
		print 'DualScreen changed to left monitor'
	elseif string.lower(args[1]) == string.lower('rightMonitor') then
		monitor = 'right'
		print 'DualScreen changed to right monitor'
	end
	
	Prefs.SetToCurrentProfile('DualScreen_Monitor', monitor)
	Prefs.SavePreferences()
	
	local borders = import('/lua/ui/game/borders.lua')
	borders.SplitMapGroup(borders.mapSplitState, borders.mapSplitState)
end

function changeAutoSplitScreen(args)
	if string.lower(args[1]) == string.lower('enableAutoSplit') then
		autoSplitScreen = true
		print 'DualScreen changed to automatically split'
	elseif string.lower(args[1]) == string.lower('disableAutoSplit') then
		autoSplitScreen = false
		print 'DualScreen changed to not automatically split'
	end
	
	Prefs.SetToCurrentProfile('DualScreen_AutoSplit', autoSplitScreen)
	Prefs.SavePreferences()
end