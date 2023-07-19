local module = {
	Pos = UDim2.new(0.075, 0,0.004, 0)
}

local BtnTemplate = script:WaitForChild("BtnType1");

local TweenService = game:GetService("TweenService");
local TweenInfo_ = TweenInfo.new(0.4)

module.Set = function(IconId,Activate,Deactivate)
	
	local Activated = false
	local TemplateClone = BtnTemplate:Clone()
	
	local Index = Instance.new("IntValue")
	Index.Name = "index"
	Index.Parent = TemplateClone
	Index.Value = #game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopbarContainer"):GetChildren() + 1
	
	TemplateClone.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopbarContainer")
	TemplateClone:WaitForChild("Background"):WaitForChild("Icon").Image = "rbxassetid://"..IconId
	
	TemplateClone:WaitForChild("Background").MouseEnter:Connect(function()
		TemplateClone:WaitForChild("Background").BackgroundColor3 = Color3.fromRGB(20,20,20)
	end)
	
	TemplateClone:WaitForChild("Background").MouseLeave:Connect(function()
		TemplateClone:WaitForChild("Background").BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	end)
	
	TemplateClone:WaitForChild("Background").MouseButton1Down:Connect(function()
		if Activated == false then
			Activated = true
			TweenService:Create(TemplateClone:WaitForChild("Background"):WaitForChild("StateOverlay"), TweenInfo_, {
				ImageTransparency = 0
			}):Play()
			Activate()
		else
			Activated = false
			TweenService:Create(TemplateClone:WaitForChild("Background"):WaitForChild("StateOverlay"), TweenInfo_, {
				ImageTransparency = 1
			}):Play()
			Deactivate()
		end
	end)	
	
end

return module
