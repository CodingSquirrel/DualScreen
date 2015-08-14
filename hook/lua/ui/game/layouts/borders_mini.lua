local DualScreen = import('/mods/DualScreen/modules/dual_screen.lua')
local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')

-- Stolen from the vanilla file, changed the left and right of ui frames based on the split state
function SetLayout(gameParent)
    local controls = import('/lua/ui/game/borders.lua').controls
	local mapSplitState = import('/lua/ui/game/borders.lua').mapSplitState
	
	local left = gameParent.Left
	local right = gameParent.Right
	if mapSplitState then
		if DualScreen.monitor == 'left' then
			right = function() return (gameParent.Left() - 3) + ((gameParent.Right() - gameParent.Left()) / 2) end
		elseif DualScreen.monitor == 'right' then
			left = function() return (gameParent.Left() + 3) + ((gameParent.Right() - gameParent.Left()) / 2) end
		end
	end
    
    controls.bottom:Destroy()
    controls.top:Destroy()
    controls.left:Destroy()
    controls.right:Destroy()
    controls.bottomLeftOS:Destroy()
    controls.bottomRightOS:Destroy()
    controls.topLeftOS:Destroy()
    controls.topRightOS:Destroy()
    controls.bottomOS:Destroy()
    controls.topOS:Destroy()
    controls.leftOS:Destroy()
    controls.rightOS:Destroy()
    
    controls.bottom = false
    controls.top = false
    controls.left = false
    controls.right = false
    controls.bottomLeftOS = false
    controls.bottomRightOS = false
    controls.topLeftOS = false
    controls.topRightOS = false
    controls.bottomOS = false
    controls.topOS = false
    controls.leftOS = false
    controls.rightOS = false
    
    controls.controlClusterGroup.Left:Set(left)
    controls.controlClusterGroup.Bottom:Set(gameParent.Bottom)
    controls.controlClusterGroup.Top:Set(function() return controls.controlClusterGroup.Bottom() - 150 end)
    controls.controlClusterGroup.Right:Set(right)
    controls.controlClusterGroup:SetRenderPass(UIUtil.UIRP_PostGlow)    
    controls.controlClusterGroup:DisableHitTest()
    
    controls.statusClusterGroup.Left:Set(left)
    controls.statusClusterGroup.Top:Set(gameParent.Top)
    controls.statusClusterGroup.Right:Set(right)
    controls.statusClusterGroup.Height:Set(function() return controls.statusClusterGroup.Top() + 150 end)
    controls.statusClusterGroup:DisableHitTest()
    controls.statusClusterGroup:DisableHitTest()
    
    controls.mapGroup.Left:Set(left)
    controls.mapGroup.Top:Set(gameParent.Top)
    controls.mapGroup.Right:Set(right)
    controls.mapGroup.Bottom:Set(gameParent.Bottom)
    controls.mapGroup:DisableHitTest()
    
    LayoutHelpers.FillParent(controls.windowGroup, gameParent)
    controls.windowGroup:DisableHitTest()
    
    controls.controlClusterGroup:DisableHitTest()
    controls.statusClusterGroup:DisableHitTest()
    controls.mapGroup:DisableHitTest()
    
    if controls.mapGroupLeft then
        controls.mapGroupLeft.Left:Set(gameParent.Left)
        controls.mapGroupLeft.Top:Set(gameParent.Top)
        controls.mapGroupLeft.Right:Set(function() return (gameParent.Left() - 3) + ((gameParent.Right() - gameParent.Left()) / 2) end)
        controls.mapGroupLeft.Bottom:Set(gameParent.Bottom)
        
        controls.mapGroupRight.Left:Set(function() return (gameParent.Left() + 3) + ((gameParent.Right() - gameParent.Left()) / 2) end)
        controls.mapGroupRight.Top:Set(gameParent.Top)
        controls.mapGroupRight.Right:Set(gameParent.Right)
        controls.mapGroupRight.Bottom:Set(gameParent.Bottom)
        
        --controls.mapGroup.Left:Set(controls.mapGroupLeft.Left)
        --controls.mapGroup.Top:Set(controls.mapGroupLeft.Top)
        --controls.mapGroup.Right:Set(controls.mapGroupRight.Right)
        --controls.mapGroup.Bottom:Set(controls.mapGroupLeft.Bottom)
    else
        --controls.mapGroup.Left:Set(gameParent.Left)
        --controls.mapGroup.Top:Set(gameParent.Top)
        --controls.mapGroup.Right:Set(gameParent.Right)
        --controls.mapGroup.Bottom:Set(gameParent.Bottom)
    end
end