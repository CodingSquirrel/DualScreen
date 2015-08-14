local controls = import('/lua/ui/game/borders.lua').controls

-- savedParent is a local variable, so need this to expose it
function GetSavedParent()
	return savedParent
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

-- function ToggleGameInfo()
    -- LOG("XINNOinfo")
	-- local ItemList = import('/lua/maui/itemlist.lua').ItemList
	-- --
	-- local dialog = Group(controls.mapGroup)
        -- LayoutHelpers.AtCenterIn(dialog, controls.mapGroup)
        -- dialog.Depth:Set(999) -- :GetTopmostDepth() + 1
    -- local background = Bitmap(dialog, UIUtil.SkinnableFile('/scx_menu/lan-game-lobby/optionlobby-withoutBG.dds'))
        -- dialog.Width:Set(background.Width)
        -- dialog.Height:Set(background.Height)
        -- LayoutHelpers.FillParent(background, dialog)
    -- local dialog2 = Group(dialog)
        -- dialog2.Width:Set(background.Width)--536)537--268
        -- dialog2.Height:Set(background.Height)--400)401
        -- LayoutHelpers.AtCenterIn(dialog2, dialog)
	-- -----------
    -- -- Title --
    -- local text0 = UIUtil.CreateText(dialog2, 'Game Info :', 17, 'Arial')
        -- text0:SetColor('B9BFB9') -- 808080
        -- text0:SetDropShadow(true)
        -- LayoutHelpers.AtHorizontalCenterIn(text0, dialog2, 0)
        -- LayoutHelpers.AtTopIn(text0, dialog2, 10)
	-- --------------------
    -- -- OK button --
	-- local OkButton = UIUtil.CreateButtonWithDropshadow(dialog2, '/BUTTON/medium/', "Ok", -1)
        -- LayoutHelpers.AtHorizontalCenterIn(OkButton, dialog2, 0)
        -- LayoutHelpers.AtBottomIn(OkButton, dialog2, 10)
        -- OkButton.OnClick = function(self)
			-- dialog:Destroy()
			-- --infoBtn:Enable()
        -- end
	-- ------------------
    -- -- Preset List --
	-- PresetList = ItemList(dialog2)
		-- PresetList:SetFont(UIUtil.bodyFont, 11)
		-- PresetList:SetColors(UIUtil.fontColor, "00000000", "FF000000",  UIUtil.highlightColor, "ffbcfffe")
		-- --PresetList:ShowMouseoverItem(true)
		-- PresetList.Width:Set(537-20-19)--232)--210)
		-- PresetList.Height:Set(310)
		-- --LayoutHelpers.DepthOverParent(PresetList, dialog2, 10)
		-- LayoutHelpers.AtLeftIn(PresetList, dialog2, 10)
        -- LayoutHelpers.AtTopIn(PresetList, dialog2, 38)
		-- UIUtil.CreateLobbyVertScrollbar(PresetList)
	-- ------------
    -- -- Script --
	
	-- -- Configurations = { #Thermo 2vs2
		-- -- standard = {
			-- -- customprops = {pas regarder}
			-- -- teams = {
				-- -- [1] = {
					-- -- name : FFA
					-- -- armies = {
						-- -- 1 : ARMY_1
						-- -- 2 : ARMY_2
						-- -- 3 : ARMY_3
						-- -- 4 : ARMY_4
						-- -- 5 : ARMY_5
						-- -- 6 : ARMY_6
						-- -- 7 : ARMY_7
						-- -- 8 : ARMY_8
					-- -- }
				-- -- }
			-- -- }
		-- -- }
	-- -- }
	
	-- -- Options = {
		-- -- RestrictedCategories = {}
		-- -- Ratings = {
			-- -- Xinnony : 299
		-- -- }
		-- -- ... tout les réglage d'option de scenario
	-- -- }
	
	-- --  size = { #Thermo, taille de la carte
		-- -- 1 : 512
		-- -- 2 : 512
	-- -- }
	-- ---------------
	-- -- name : Battle of Thermopylae OFFICIAL
	-- -- Options.ScenarioFile : /maps/Battle of Thermopulae OFFICIAL/Battle fo Thermopylae OFFICIAL_scenario.lua
	-- -- map_version : 3
	-- -- type : skirmish
	-- --
	-- -- Mods : {pas ici, dans une autres commande TABLE}
	-- --
	-- -- RestrictedCategories : {}
	-- --
	-- -- ... other options ...
	-- ---------------
	-- PresetList:AddItem('Scenario Info :')
	-- if SessionGetScenarioInfo() then
		-- for k, v in SessionGetScenarioInfo() do
			-- if k == 'name' then
				-- PresetList:AddItem('- Name : '..tostring(v))
			-- --elseif k == 'Options.ScenarioFile' then
				-- --PresetList:AddItem('- Scenario : '..'(not implement)')
			-- elseif k == 'map_version' then
				-- PresetList:AddItem('- Map version : '..tostring(v))
			-- elseif k == 'type' then
				-- PresetList:AddItem('- Type : '..tostring(v))
			-- end
		-- end
		-- if SessionGetScenarioInfo().Options['Rule'] then
			-- local tmptext = SessionGetScenarioInfo().Options['Rule']
			-- wrapped = import('/lua/maui/text.lua').WrapText(tmptext, 232, function(curText) return PresetList:GetStringAdvance(curText) end)
			-- for i, line in wrapped do
				-- if i == 1 then
					-- PresetList:AddItem('- '..line)
				-- else
					-- PresetList:AddItem(line)
				-- end
			-- end
		-- end
		-- PresetList:AddItem('')
	-- end
	-- if __active_mods then
		-- PresetList:AddItem('Mods :')
		-- for i, m in __active_mods do
			-- --PresetList:AddItem('- MODi : '..tostring(i)) -- Nombre de MODs
			-- --PresetList:AddItem('- MODm : '..tostring(m)) -- Table
			-- local tmp = ''
			-- for v, r in m do
				-- if v == 'name' then
					-- tmp = tostring(r)
				-- elseif v == 'ui_only' then
					-- if r == true then
						-- tmp = tmp..' [Mod UI]'
						-- --if v == 'description' then PresetList:AddItem('- '..tostring(v)..' : '..tostring(r)) end
						-- --if v == 'uid' then PresetList:AddItem('- '..tostring(v)..' : '..tostring(r)) end
						-- --if v == 'version' then PresetList:AddItem('- '..tostring(v)..' : '..tostring(r)) end
					-- else
						-- --if v == 'description' then PresetList:AddItem('- '..tostring(v)..' : '..tostring(r)) end
						-- --if v == 'uid' then PresetList:AddItem('- '..tostring(v)..' : '..tostring(r)) end
						-- --if v == 'version' then PresetList:AddItem('- '..tostring(v)..' : '..tostring(r)) end
					-- end
				-- end
			-- end
			-- PresetList:AddItem('- '..tmp)
		-- end
		-- PresetList:AddItem('')
	-- end
	-- if SessionGetScenarioInfo().Options.RestrictedCategories then
		-- PresetList:AddItem('Unit Restrictions :')
		-- for k, v in SessionGetScenarioInfo().Options.RestrictedCategories do
			-- PresetList:AddItem('- '..tostring(v))
		-- end
		-- PresetList:AddItem('')
	-- end
	-- if SessionGetScenarioInfo().Options then
		-- PresetList:AddItem('Scenario Options :')
		-- for k, v in SessionGetScenarioInfo().Options do
			-- if k == 'ScenarioFile' then
			-- elseif k == 'Rule' then
			-- elseif k == 'Ratings' then
			-- elseif k == 'RestrictedCategories' then
			-- else
				-- PresetList:AddItem('- '..tostring(k)..' : '..tostring(v))
			-- end
		-- end
	-- end
-- end