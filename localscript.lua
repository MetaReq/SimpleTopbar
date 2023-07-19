local SimpleTopbar = require(game:GetService("ReplicatedStorage"):WaitForChild("SimpleTopbar"))

local function a()
	print("activate")
end

local function da()
	print("deactivate")
end

SimpleTopbar.CreateButton(
	1, -- number type
	a, -- activate function
	da, -- deactivate function
	7451945728 -- icon id
)

SimpleTopbar.CreateButton(
	1,
	a,
	da,
	7451945728
)
