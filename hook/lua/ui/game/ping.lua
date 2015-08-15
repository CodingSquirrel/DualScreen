local controls = import('/lua/ui/game/borders.lua').controls

function DoPing(pingType)
    if SessionIsReplay() or import('/lua/ui/game/gamemain.lua').supressExitDialog then return end
    local position = GetMouseWorldPos()
    for _, v in position do
        local var = v
        if var != v then
            return
        end
    end
    local army = GetArmiesTable().focusArmy - 1
    if GetFocusArmy() == -1 then
        return 
    end
    local data = {Owner = army, Type = pingType, Location = position, Type = pingType}
    data = table.merged(data, PingTypes[pingType])
    if data.Marker then
        if markers[data.Owner] and table.getsize(markers[data.Owner]) >= 1 then
            UIUtil.QuickDialog(controls.mapGroup, '<LOC markers_0001>You must delete an existing marker before making a new one.','<LOC _OK>', nil, nil, nil, nil, nil, true, {escapeButton = 1, enterButton = 1, worldCover = 1})
        else
            NamePing(function(name)
                data.Name = name
                local armies = GetArmiesTable()
                data.Color = armies.armiesTable[armies.focusArmy].color
                SimCallback({Func = 'SpawnPing', Args = data})
            end)
        end
    else
        SimCallback({Func = 'SpawnPing', Args = data})
    end
end

local oldNamePing = NamePing
function NamePing(callback, curName)
    local newDialog = (dialog == false or dialog == nil)
    
    oldNamePing(callback, curName)
    
    if newDialog then
        LayoutHelpers.AtHorizontalCenterIn(dialog, controls.mapGroup)
    end
end