local lp = game:FindService("Players").LocalPlayer

local function gplr(String)
	local Found = {}
	local strl = String:lower()
	if strl == "all" then
		for i, v in pairs(game:FindService("Players"):GetPlayers()) do
			table.insert(Found, v)
		end
	elseif strl == "others" then
		for i, v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name ~= lp.Name then
				table.insert(Found, v)
			end
		end 
	elseif strl == "me" then
		for i, v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name == lp.Name then
				table.insert(Found, v)
			end
		end 
	else
		for i, v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #String) == String:lower() then
				table.insert(Found, v)
			end
		end 
	end
	return Found 
end



local h = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Top = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

h.Name = "h"
h.Parent = game.Players.LocalPlayer.PlayerGui
h.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = h
Main.Active = true
Main.Draggable = true
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 2
Main.Position = UDim2.new(0.2, 0, 0.4, 0)
Main.Size = UDim2.new(0, 480, 0, 250)
Main.Image = "rbxassetid://17247294032"
Main.ScaleType = Enum.ScaleType.Stretch
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Main

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(1, 0, 0, 50)
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Top

Title.Name = "Title"
Title.Parent = Top
Title.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.3, 0)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.Arcade
Title.Text = "FE Yeet Gui - Skidded Edition"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 18.000
Title.TextWrapped = true

TextBox.Parent = Main
TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.05, 0, 0.3, 0)
TextBox.Size = UDim2.new(0.9, 0, 0, 50)
TextBox.Font = Enum.Font.GothamBold
TextBox.PlaceholderText = "Enter the target's name"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 18.000
TextBox.TextWrapped = true
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = TextBox

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(0, 127, 85)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.15, 0, 0.65, 0)
TextButton.Size = UDim2.new(0.7, 0, 0, 50)
TextButton.Font = Enum.Font.Fantasy
TextButton.Text = "Launch Target!"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 18.000
TextButton.TextWrapped = true
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = TextButton

TextButton.MouseButton1Click:Connect(function()
	local Target = gplr(TextBox.Text)
	if Target[1] then
		Target = Target[1]
		
		local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
		Thrust.Force = Vector3.new(9999, 9999, 9999)
		Thrust.Name = "YeetForce"
		repeat
			lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
			Thrust.Location = Target.Character.HumanoidRootPart.Position
			game:FindService("RunService").Heartbeat:wait()
		until not Target.Character:FindFirstChild("Head")
	else
		warn("Invalid player")
	end
end)
