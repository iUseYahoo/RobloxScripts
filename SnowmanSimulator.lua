-- Gui to Lua
-- Version: 3.2

-- Instances:

local snowsim = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local sellredcanes = Instance.new("TextButton")
local enablecane = Instance.new("TextButton")
local disablecane = Instance.new("TextButton")
local close = Instance.new("TextButton")
local question = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local canegrabberlabel = Instance.new("TextLabel")
local checkcorrectgame = Instance.new("TextButton")
local iscanegrabbing = false
local plr = game.Players.LocalPlayer
local canepath = game:GetService("Workspace").gameCandyCanes

--Properties:

snowsim.Name = "snowsim"
snowsim.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = snowsim
Frame.BackgroundColor3 = Color3.fromRGB(1, 54, 54)
Frame.BackgroundTransparency = 0.350
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.11678832, 0, 0.288425058, 0)
Frame.Size = UDim2.new(0, 393, 0, 223)
Frame.Draggable = true
Frame.Selectable = true

sellredcanes.Name = "sellredcanes"
sellredcanes.Parent = Frame
sellredcanes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sellredcanes.BackgroundTransparency = 0.550
sellredcanes.Position = UDim2.new(0.0423794426, 0, 0.508530438, 0)
sellredcanes.Size = UDim2.new(0, 179, 0, 38)
sellredcanes.Font = Enum.Font.SourceSans
sellredcanes.Text = "Sell Red Candy Canes"
sellredcanes.TextColor3 = Color3.fromRGB(255, 255, 255)
sellredcanes.TextScaled = true
sellredcanes.TextSize = 14.000
sellredcanes.TextWrapped = true
sellredcanes.MouseButton1Click:Connect(function()
	local sellconfig = {
		action = "sellCandycanes",
		canes = math.huge,
		seller = game:GetService("Workspace").sellSpots.redA.Nutcracker
	}
	
	game:GetService("ReplicatedStorage").Signals.candycaneSell:FireServer(sellconfig)
	
end)

enablecane.Name = "enablecane"
enablecane.Parent = Frame
enablecane.BackgroundColor3 = Color3.fromRGB(17, 255, 0)
enablecane.Position = UDim2.new(0.549790144, 0, 0.266360909, 0)
enablecane.Size = UDim2.new(0, 48, 0, 39)
enablecane.Font = Enum.Font.SourceSans
enablecane.Text = ""
enablecane.TextColor3 = Color3.fromRGB(0, 0, 0)
enablecane.TextSize = 14.000
enablecane.MouseButton1Click:Connect(function()
	iscanegrabbing = true
	
	while iscanegrabbing == true do
		task.wait(0.1)
		for i,v in pairs(canepath:GetChildren()) do
			plr.Character.HumanoidRootPart.CFrame = CFrame.new(v.cane.Position)
            task.wait(0.3)            
            v:Destroy()
		end

		if iscanegrabbing == false then
			break
		end
	end
end)

disablecane.Name = "disablecane"
disablecane.Parent = Frame
disablecane.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
disablecane.Position = UDim2.new(0.733058929, 0, 0.266360909, 0)
disablecane.Size = UDim2.new(0, 48, 0, 39)
disablecane.Font = Enum.Font.SourceSans
disablecane.Text = ""
disablecane.TextColor3 = Color3.fromRGB(0, 0, 0)
disablecane.TextSize = 14.000
disablecane.MouseButton1Click:Connect(function()
	iscanegrabbing = false
end)

close.Name = "close"
close.Parent = Frame
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundTransparency = 0.550
close.Position = UDim2.new(0.915607989, 0, -0.00426307321, 0)
close.Size = UDim2.new(0, 33, 0, 26)
close.Font = Enum.Font.SourceSans
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true
close.MouseButton1Click:Connect(function()
	Frame.Visible = false
end)

question.Name = "question"
question.Parent = Frame
question.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
question.BackgroundTransparency = 0.650
question.Position = UDim2.new(-0.002226457, 0, 0.843500257, 0)
question.Size = UDim2.new(0, 39, 0, 34)
question.Font = Enum.Font.SourceSans
question.Text = "?"
question.TextColor3 = Color3.fromRGB(255, 255, 255)
question.TextScaled = true
question.TextSize = 14.000
question.TextWrapped = true
question.MouseButton1Click:Connect(function()
	local config = {
		Title = "Question",
		Text = "This GUI is shit because I dont put effort into these guis that I post. Aka its not worth my time making it nice.",
		Duration = 5,
		Button1 = "Dismiss",
	}

	game.StarterGui:SetCore("SendNotification", config)
end)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 0.950
TextLabel.Position = UDim2.new(0.225648209, 0, -0.000987052917, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 32)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Made by 0x08FE#6903"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

canegrabberlabel.Name = "canegrabberlabel"
canegrabberlabel.Parent = Frame
canegrabberlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
canegrabberlabel.BackgroundTransparency = 0.550
canegrabberlabel.Position = UDim2.new(0.0423794165, 0, 0.266360939, 0)
canegrabberlabel.Size = UDim2.new(0, 179, 0, 39)
canegrabberlabel.Font = Enum.Font.SourceSans
canegrabberlabel.Text = "Auto Candy Cane Grabber"
canegrabberlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
canegrabberlabel.TextScaled = true
canegrabberlabel.TextSize = 14.000
canegrabberlabel.TextWrapped = true

checkcorrectgame.Name = "checkcorrectgame"
checkcorrectgame.Parent = Frame
checkcorrectgame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
checkcorrectgame.BackgroundTransparency = 0.550
checkcorrectgame.Position = UDim2.new(0.251030833, 0, 0.822431743, 0)
checkcorrectgame.Size = UDim2.new(0, 179, 0, 38)
checkcorrectgame.Font = Enum.Font.SourceSans
checkcorrectgame.Text = "Check for Correct Game"
checkcorrectgame.TextColor3 = Color3.fromRGB(255, 255, 255)
checkcorrectgame.TextScaled = true
checkcorrectgame.TextSize = 14.000
checkcorrectgame.TextWrapped = true
checkcorrectgame.MouseButton1Click:Connect(function()
	if game.PlaceId == 2533391464 then
		local config = {
			Title = "Check game",
			Text = "Youre in the right game. RETARD",
			Duration = 5,
			Button1 = "Dismiss",
		}

		game.StarterGui:SetCore("SendNotification", config)
	end
	
	if game.PlaceId ~= 2533391464 then
		local config = {
			Title = "Check game",
			Text = "Youre not in the right game, Teleporting... RETARD",
			Duration = 5,
			Button1 = "Dismiss",
		}

		game.StarterGui:SetCore("SendNotification", config)
		
		wait(1)
		
		local TeleService = game:GetService("TeleportService")

		local localplr = game:GetService("Players").LocalPlayer

		TeleService:Teleport(2533391464, localplr)
		
	end
end)
