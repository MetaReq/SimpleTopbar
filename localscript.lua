local SimpleTopbar = require(game:GetService("ReplicatedStorage"):WaitForChild("SimpleTopbar"))

local function a()
	print("activate")
end

local function da()
	print("deactivate")
end

SimpleTopbar.CreateButton(
	1,
	a,
	da,
	7451945728
)

SimpleTopbar.CreateButton(
	1,
	a,
	da,
	7451945728
)
