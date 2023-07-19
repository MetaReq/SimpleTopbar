local RunService = game:GetService("RunService")
local module = {}

local AlignSystem = script:WaitForChild("AlignSystem")
local SimpleAlign = require(AlignSystem:WaitForChild("SimpleAlign"))

module.CreateButton = function(Type,Activate,Deactivate,IconId)
	local Button = script:FindFirstChild("BtnType"..Type)
	if Button then
		local ModuleNew = require(Button)
		ModuleNew.Set(
			IconId,
			Activate,
			Deactivate
		)
		
		if #game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopbarContainer"):GetChildren() >= 1 then
			SimpleAlign.SetAlignments(
				game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopbarContainer"),
				1.4,
				"scale"
			)
		else end
	end
end

return setmetatable(module, {
	__index = function()
		if RunService:IsClient() then else return warn('CAN NOT BE USED ON SERVER') end
	end,
})
