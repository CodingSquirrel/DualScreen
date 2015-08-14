local oldCreateDialog = CreateDialog
function CreateDialog(over, exitBehavior)
    oldCreateDialog(over, exitBehavior)
	local controls = import('/lua/ui/game/borders.lua').controls
    --LayoutHelpers.AtCenterIn(dialog, controls.mapGroup)
    
    local function OptionRestartFunc(proceedFunc, cancelFunc)
        UIUtil.QuickDialog(controls.mapGroup , "<LOC options_0001>You have modified an option which requires you to restart Forged Alliance. Selecting OK will exit the game, selecting Cancel will revert the option to its prior setting."
            , "<LOC _OK>", proceedFunc
            ,"<LOC _Cancel>", cancelFunc
            , nil, nil
            , true
            , {escapeButton = 2, enterButton = 1, worldCover = false}
        )
    end
    OptionsLogic.SetSummonRestartDialogCallback(OptionRestartFunc)
    
    local function VerifyFunc(undoFunc)
        local secondsToWait = 15
        local thread

        local dlg = UIUtil.QuickDialog(controls.mapGroup, "<LOC options_0003>Click OK to accept these settings."
            , LOC("<LOC _Ok>") .. " [" .. secondsToWait .. "]", function() KillThread(thread) end
            , "<LOC _Cancel>", function() KillThread(thread) undoFunc() end
            , nil, nil
            , true
            , {escapeButton = 2, enterButton = 1, worldCover = false}
        )
        
        thread = ForkThread(function()
            for sec = 1, secondsToWait do
                WaitSeconds(1)
                dlg._button1.label:SetText(LOC("<LOC _Ok>") .. " [" .. (secondsToWait - sec) .. "]")
            end
            dlg:Destroy()
            undoFunc()
        end)
    end
    OptionsLogic.SetSummonVerifyDialogCallback(VerifyFunc)
end