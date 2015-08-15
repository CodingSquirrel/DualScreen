local tabs = import('/lua/ui/game/tabs.lua')
local score = import('/lua/ui/dialogs/score.lua')
local controls = import('/lua/ui/game/borders.lua').controls
    
local oldDoGameResult = DoGameResult
function DoGameResult(armyIndex, result)
    oldDoGameResult(armyIndex, result)
    local modes = tabs.GetModes()
    
    local victory = result == 'victory'
    for id, mode in modes do
        if mode.label == "<LOC _Score>" then
            mode.callback = function()
                UIUtil.QuickDialog(controls.mapGroup,
                    "<LOC EXITDLG_0003>Are you sure you'd like to exit?",
                    "<LOC _Yes>", function()
                        score.CreateDialog(victory)
                    end,
                    "<LOC _No>", nil,
                    nil, nil,
                    true,
                    {escapeButton = 2, enterButton = 1, worldCover = true})
            end
            break
        end
    end
    tabs.UpdateModeDisplay()
end