
local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')

function SetLayout()
    local controls = import('/lua/ui/game/missiontext.lua').controls
    local borderControls = import('/lua/ui/game/borders.lua').controls
    
    if controls.movieBrackets then
        if import('/lua/ui/game/gamemain.lua').IsNISMode() then
            import(UIUtil.GetLayoutFilename('missiontextnis')).SetLayout()
        else
            LayoutHelpers.AtLeftTopIn(controls.movieBrackets, borderControls.mapGroup, 200, 70)
            LayoutHelpers.AtLeftTopIn(controls.subtitles.text[1], borderControls.mapGroup, 234, 310)
        end
    end
end