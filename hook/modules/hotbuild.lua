local KeyMapper = import('/lua/keymap/keymapper.lua')
local UIUtil = import('/lua/ui/uiutil.lua')
local Prefs = import('/lua/user/prefs.lua')

local CommandMode = import('/lua/ui/game/commandmode.lua')
local Construction = import('/lua/ui/game/construction.lua')
local Templates = import('/lua/ui/game/build_templates.lua')

local Group = import('/lua/maui/group.lua').Group
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Effect = import('/lua/maui/effecthelpers.lua')

local upgradeTab = import('/modules/upgradeTab.lua').upgradeTab

-- Nearly direct copy of function from vanilla hotbuild
function initCycleMap()
  -- Originally set to GetFrame(0), but we want this to always follow the split screen
  local controls = import('/lua/ui/game/borders.lua').controls
  cycleMap = Group(controls.mapGroup)
  
  cycleMap.Depth:Set(1000) --always on top
  cycleMap.Width:Set(400)
  cycleMap.Height:Set(150)
  -- Replacing GetFrame(0) here as well
  cycleMap.Top:Set(function() return controls.mapGroup.Bottom()*.75 end)
  cycleMap.Left:Set(function() return (controls.mapGroup.Right()+controls.mapGroup.Left()-cycleMap.Width())/2  end)
  cycleMap:DisableHitTest()
  cycleMap:Hide()
    
  cycle_Panel_tl = Bitmap(cycleMap)
  cycle_Panel_tl:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-tl.dds')
  cycle_Panel_tl.Top:Set(cycleMap.Top)
  cycle_Panel_tl.Left:Set(cycleMap.Left)
  cycle_Panel_tl.Width:Set(40)
  
  cycle_Panel_bl = Bitmap(cycleMap)
  cycle_Panel_bl:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-bl.dds')
  cycle_Panel_bl.Bottom:Set(cycleMap.Bottom)
  cycle_Panel_bl.Left:Set(cycleMap.Left)
  cycle_Panel_bl.Width:Set(40)
    
  cycle_Panel_l = Bitmap(cycleMap)
  cycle_Panel_l:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-l.dds')
  cycle_Panel_l.Top:Set(cycle_Panel_tl.Bottom)
  cycle_Panel_l.Bottom:Set(cycle_Panel_bl.Top)
  cycle_Panel_l.Left:Set(cycleMap.Left)
  cycle_Panel_l.Width:Set(40)

  cycle_Panel_tr = Bitmap(cycleMap)
  cycle_Panel_tr:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-tr.dds')
  cycle_Panel_tr.Top:Set(cycleMap.Top)
  cycle_Panel_tr.Right:Set(cycleMap.Right)
  cycle_Panel_tr.Width:Set(40)
  
  cycle_Panel_br = Bitmap(cycleMap)
  cycle_Panel_br:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-br.dds')
  cycle_Panel_br.Bottom:Set(cycleMap.Bottom)
  cycle_Panel_br.Right:Set(cycleMap.Right)
  cycle_Panel_br.Width:Set(40)
  
  cycle_Panel_r = Bitmap(cycleMap)
  cycle_Panel_r:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-r.dds')
  cycle_Panel_r.Top:Set(cycle_Panel_tr.Bottom)
  cycle_Panel_r.Bottom:Set(cycle_Panel_br.Top)
  cycle_Panel_r.Right:Set(cycleMap.Right)
  cycle_Panel_r.Width:Set(40)
  
  cycle_Panel_t = Bitmap(cycleMap)
  cycle_Panel_t:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-t.dds')
  cycle_Panel_t.Top:Set(cycleMap.Top)
  cycle_Panel_t.Left:Set(cycle_Panel_l.Right)
  cycle_Panel_t.Right:Set(cycle_Panel_r.Left)
  
  cycle_Panel_b = Bitmap(cycleMap)
  cycle_Panel_b:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-b.dds')
  cycle_Panel_b.Bottom:Set(cycleMap.Bottom)
  cycle_Panel_b.Left:Set(cycle_Panel_l.Right)
  cycle_Panel_b.Right:Set(cycle_Panel_r.Left)
  
  cycle_Panel_m = Bitmap(cycleMap)
  cycle_Panel_m:SetTexture('/textures/ui/hotbuild/cycle-panel-bg-m.dds')
  cycle_Panel_m.Top:Set(cycle_Panel_t.Bottom)
  cycle_Panel_m.Bottom:Set(cycle_Panel_b.Top)
  cycle_Panel_m.Left:Set(cycle_Panel_l.Right)
  cycle_Panel_m.Right:Set(cycle_Panel_r.Left)
end