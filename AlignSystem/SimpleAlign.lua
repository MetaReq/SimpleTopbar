local RunService = game:GetService("RunService");
local module = {
	AutoPadding = true;
	Padding = 1.4;
}

local TweenService = game:GetService("TweenService");
local TweenInfo_ = TweenInfo.new(0.4)

module.SetAlignments = function(Ins1, Padding, ApplyTo)
	local NewPadding
	if module.AutoPadding == true then
		NewPadding = module.Padding
	else
		NewPadding = Padding
	end
	
	local AmtOfItems = #Ins1:GetChildren()
	
	if ApplyTo == "scale" then
		
		for index , instance in ipairs( Ins1:GetChildren() ) do
			
			if not instance:FindFirstChild("AffectedSimpleAlign") and instance:FindFirstChild("index").Value >= 2 and instance:FindFirstChild("index").Value < 3 then
				local NewVal = Instance.new("BoolValue")
				NewVal.Name = "AffectedSimpleAlign"
				NewVal.Parent = instance
				
				for x,y in ipairs(Ins1:GetChildren()) do
					if y:FindFirstChild("index").Value == AmtOfItems then
						instance.Position = y.Position
					end
				end
				
				local Pos = UDim2.new(instance.Position.X.Scale*NewPadding , instance.Position.X.Offset , instance.Position.Y.Scale , instance.Position.Y.Offset)
				local Tween = TweenService:Create(
					instance,
					TweenInfo_,
					{
						Position = Pos;
					}
				);

				Tween:Play()
			
			end
			
		end
		
	end
	
end

return setmetatable(module, {
	__index = function()
		if RunService:IsClient() then else return warn('CAN NOT BE USED ON SERVER') end
	end;
})
