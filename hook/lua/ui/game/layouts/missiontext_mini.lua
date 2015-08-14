
local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')

function SetLayout()
    local controls = import('/lua/ui/game/missiontext.lua').controls
    local borderControls = import('/lua/ui/game/borders.lua').controls
    
    if controls.movieBrackets then
        if import('/lua/ui/game/gamemain.lua').IsNISMode() then
            import(UIUtil.GetLayoutFilename('missiontextnis')).SetLayout()
        else
            LayoutHelpers.AtLeftTopIn(controls.movieBrackets, borderControls.mapGroup, 2, 147)
            LayoutHelpers.AtLeftTopIn(controls.subtitles.text[1], borderControls.mapGroup, 30, 395)
        end
    end
end