local controls = import('/lua/ui/game/borders.lua').controls

-- savedParent is a local variable, so need this to expose it
function GetSavedParent()
	return savedParent
end

function GetModes()
    return modes
end

actions['Save'] = function()
        local saveType
        if import('/lua/ui/campaign/campaignmanager.lua').campaignMode then
            saveType = "CampaignSave"
        else
            saveType = "SaveGame"
        end
        import('/lua/ui/dialogs/saveload.lua').CreateSaveDialog(controls.mapGroup, nil, saveType)
    end
actions['Load'] = function()
        if import('/lua/ui/campaign/campaignmanager.lua').campaignMode then
            saveType = "CampaignSave"
        else
            saveType = "SaveGame"
        end
        import('/lua/ui/dialogs/saveload.lua').CreateLoadDialog(controls.mapGroup, nil, saveType)
    end
actions['LoadReplay'] = function()
        import('/lua/ui/dialogs/replay.lua').CreateDialog(controls.mapGroup, true)
    end
actions['EndSPGame'] = function()
        UIUtil.QuickDialog(controls.mapGroup, "<LOC EXITDLG_0001>Are you sure you'd like to quit?", 
            "<LOC _Yes>", EndGame,
            "<LOC _Save>", EndGameSaveWindow,
            "<LOC _No>", nil,
            true,
            {escapeButton = 3, enterButton = 1, worldCover = true})
    end
actions['EndMPGame'] = function()
        UIUtil.QuickDialog(controls.mapGroup, "<LOC EXITDLG_0001>Are you sure you'd like to quit?",
        "<LOC _Yes>", EndGame, 
        "<LOC _No>", nil,
            nil, nil,
            true,
            {escapeButton = 3, enterButton = 1, worldCover = true})
    end
actions['RestartGame'] = function()
        UIUtil.QuickDialog(controls.mapGroup, "<LOC EXITDLG_0002>Are you sure you'd like to restart?", 
            "<LOC _Yes>", function() RestartSession() end, 
            "<LOC _No>", nil,
            nil, nil,
            true,
            {escapeButton = 2, enterButton = 1, worldCover = true})
    end
actions['RestartReplay'] = function()
        local replayFilename = GetFrontEndData('replay_filename')
        UIUtil.QuickDialog(controls.mapGroup, "<LOC EXITDLG_0002>Are you sure you'd like to restart?", 
            "<LOC _Yes>", function() LaunchReplaySession(replayFilename) end, 
            "<LOC _No>", nil)
    end
actions['ExitSPGame'] = function()
        UIUtil.QuickDialog(controls.mapGroup, "<LOC EXITDLG_0003>Are you sure you'd like to exit?", 
            "<LOC _Yes>", function()
                ExitApplication()
            end, 
            "<LOC _Save>", ExitGameSaveWindow,
            "<LOC _No>", nil,
            true,
            {escapeButton = 3, enterButton = 1, worldCover = true})
    end
actions['ExitMPGame'] = function()
        UIUtil.QuickDialog(controls.mapGroup, "<LOC EXITDLG_0003>Are you sure you'd like to exit?", 
            "<LOC _Yes>", function()
                EscapeHandler.SafeQuit()
            end, 
            "<LOC _No>", nil,
            nil, nil,
            true,
            {escapeButton = 2, enterButton = 1, worldCover = true})
    end
actions['Options'] = function()
        import('/lua/ui/dialogs/options.lua').CreateDialog(controls.mapGroup)
    end