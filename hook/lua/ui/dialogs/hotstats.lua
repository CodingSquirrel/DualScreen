local controls = import('/lua/ui/game/borders.lua').controls

graph_pos={Left=function() return 110 end, Top=function() return 120 end, Right=function() return controls.mapGroup.Right()-100 end, Bottom=function() return controls.mapGroup.Bottom()-160 end}
bar_pos={Left=function() return 90 end, Top=function() return 140 end, Right=function() return controls.mapGroup.Right()-60 end, Bottom=function() return controls.mapGroup.Bottom()-150 end}

local gamemain = import('/lua/ui/game/gamemain.lua')

function nodata()
	local nodata=UIUtil.CreateText(controls.mapGroup,modcontrols_trad("noData"), 22, UIUtil.titleFont)
	nodata:SetColor("white")
	Title_score:Hide()
	LayoutHelpers.AtCenterIn(nodata, controls.mapGroup)
	nodata.Depth:Set(GetFrame(0):GetTopmostDepth())
end

function page_dual(parent)
	local data_nbr=table.getsize(scoreData.historical) -- data_nbr is the number of group of data saved
	LOG("Number of data found:",data_nbr)
	if data_nbr<=0 then nodata() return nil end
	page_active_graph=create_graph(parent,info_dialog[5].path,110,120,controls.mapGroup.Right()-100,controls.mapGroup.Bottom()/2-15)
	page_active_graph2=create_graph_bar(parent,"main_histo",90,controls.mapGroup.Bottom()/2+40,controls.mapGroup.Right()-100,controls.mapGroup.Bottom()-110)

end

-- the starting function launch by the hook
local oldSet_graph = Set_graph
function Set_graph(victory, showCampaign, operationVictoryTable, dialog, standardScore)
    oldSet_graph(victory, showCampaign, operationVictoryTable, dialog, standardScore)
    LayoutHelpers.AtLeftTopIn(Title_score, controls.mapGroup, 100, 78)
	LayoutHelpers.AtLeftIn(standardBtn, controls.mapGroup, 44)
	LayoutHelpers.AtLeftIn(bar_btn, controls.mapGroup, 185)
	LayoutHelpers.AtLeftIn(graph_btn, controls.mapGroup, 326)
	LayoutHelpers.AtLeftIn(dual_btn, controls.mapGroup, 467)
end