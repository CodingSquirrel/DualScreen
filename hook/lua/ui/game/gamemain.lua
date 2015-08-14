local DualScreen = import('/mods/DualScreen/modules/dual_screen.lua')

-- Mostly stolen from vanilla code, sets the splitscreen 
function OnFirstUpdate()
    import('/modules/hotbuild.lua').init()
	DualScreen.init()
	
    EnableWorldSounds()
    local avatars = GetArmyAvatars()
    if avatars and avatars[1]:IsInCategory("COMMAND") then
        local armiesInfo = GetArmiesTable()
        local focusArmy = armiesInfo.focusArmy
        local playerName = armiesInfo.armiesTable[focusArmy].nickname
        avatars[1]:SetCustomName(playerName)
    end
    import('/lua/UserMusic.lua').StartPeaceMusic()
    if not import('/lua/ui/campaign/campaignmanager.lua').campaignMode then
        import('/lua/ui/game/score.lua').CreateScoreUI()
    end
    PlaySound( Sound { Bank='AmbientTest', Cue='AMB_Planet_Rumble_zoom'} )
    ForkThread(
               function()
				   if DualScreen.autoSplitScreen == true then
				       local Borders = import('/lua/ui/game/borders.lua')
				       Borders.SplitMapGroup(true, true)
				       import('/lua/ui/game/worldview.lua').Expand() -- required to initialize something else there is a crash
				   end
                   WaitSeconds(1.5)
                   UIZoomTo(avatars, 1)
                   WaitSeconds(1.5)
                   SelectUnits(avatars)
                   if not IsNISMode() then
                       import('/lua/ui/game/worldview.lua').UnlockInput()
                   end
               end
               )

    if Prefs.GetOption('skin_change_on_start') != 'no' then
        local focusarmy = GetFocusArmy()
        local armyInfo = GetArmiesTable()
        if focusarmy >= 1 then
            local factions = import('/lua/factions.lua').Factions
            if factions[armyInfo.armiesTable[focusarmy].faction+1].DefaultSkin then
                UIUtil.SetCurrentSkin(factions[armyInfo.armiesTable[focusarmy].faction+1].DefaultSkin)
            end
        end
    end
end