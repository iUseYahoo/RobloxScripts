-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local infmoneybtn = Instance.new("TextButton")
local closebtn = Instance.new("TextButton")
local rebirthbtn = Instance.new("TextButton")
local rebirthenable = Instance.new("TextButton")
local rebirthdisable = Instance.new("TextButton")
local collectordisable = Instance.new("TextButton")
local collectorenable = Instance.new("TextButton")
local AutoCollector = Instance.new("TextButton")
local iscollecting = false
local isrebirthing = false
local plr = game.Players.LocalPlayer

Frame.Draggable = true

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BackgroundTransparency = 0.200
Frame.Position = UDim2.new(0.230839416, 0, 0.310139179, 0)
Frame.Size = UDim2.new(0, 289, 0, 157)

infmoneybtn.Name = "infmoneybtn"
infmoneybtn.Parent = Frame
infmoneybtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
infmoneybtn.Position = UDim2.new(0.0822241157, 0, 0.200416893, 0)
infmoneybtn.Size = UDim2.new(0, 113, 0, 27)
infmoneybtn.Font = Enum.Font.SourceSans
infmoneybtn.Text = "Infinite Money"
infmoneybtn.TextColor3 = Color3.fromRGB(0, 0, 0)
infmoneybtn.TextSize = 14.000
infmoneybtn.MouseButton1Click:Connect(function()
	local config = {
		amountOfMoney = -999999999999999999,
		itemToBbuy = nil
	}

	game:GetService("ReplicatedStorage").buystuff:FireServer(config.amountOfMoney, config.itemToBbuy)
end)

closebtn.Name = "closebtn"
closebtn.Parent = Frame
closebtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closebtn.Position = UDim2.new(0.881532013, 0, 0.0666589439, 0)
closebtn.Size = UDim2.new(0, 24, 0, 21)
closebtn.Font = Enum.Font.SourceSans
closebtn.Text = "X"
closebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
closebtn.TextSize = 14.000
closebtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

rebirthbtn.Name = "rebirthbtn"
rebirthbtn.Parent = Frame
rebirthbtn.Active = false
rebirthbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rebirthbtn.Position = UDim2.new(0.0822241157, 0, 0.416977406, 0)
rebirthbtn.Selectable = false
rebirthbtn.Size = UDim2.new(0, 113, 0, 27)
rebirthbtn.Font = Enum.Font.SourceSans
rebirthbtn.Text = "Auto Rebirth"
rebirthbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
rebirthbtn.TextSize = 14.000

rebirthenable.Name = "rebirthenable"
rebirthenable.Parent = Frame
rebirthenable.BackgroundColor3 = Color3.fromRGB(34, 255, 0)
rebirthenable.Position = UDim2.new(0.54935205, 0, 0.429716289, 0)
rebirthenable.Size = UDim2.new(0, 24, 0, 21)
rebirthenable.Font = Enum.Font.SourceSans
rebirthenable.Text = ""
rebirthenable.TextColor3 = Color3.fromRGB(0, 0, 0)
rebirthenable.TextSize = 14.000
rebirthenable.MouseButton1Click:Connect(function()
	isrebirthing = true

	while isrebirthing == true do
		wait(0.3)
		game:GetService("ReplicatedStorage").rebirthevent:FireServer(plr)

		if isrebirthing == false then
			isrebirthing = false
			break
		end
	end
end)

rebirthdisable.Name = "rebirthdisable"
rebirthdisable.Parent = Frame
rebirthdisable.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
rebirthdisable.Position = UDim2.new(0.687760353, 0, 0.436085701, 0)
rebirthdisable.Size = UDim2.new(0, 24, 0, 21)
rebirthdisable.Font = Enum.Font.SourceSans
rebirthdisable.Text = ""
rebirthdisable.TextColor3 = Color3.fromRGB(0, 0, 0)
rebirthdisable.TextSize = 14.000
rebirthdisable.MouseButton1Click:Connect(function()
	isrebirthing = false
end)

collectordisable.Name = "collectordisable"
collectordisable.Parent = Frame
collectordisable.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
collectordisable.Position = UDim2.new(0.687760353, 0, 0.665385067, 0)
collectordisable.Size = UDim2.new(0, 24, 0, 21)
collectordisable.Font = Enum.Font.SourceSans
collectordisable.Text = ""
collectordisable.TextColor3 = Color3.fromRGB(0, 0, 0)
collectordisable.TextSize = 14.000
collectordisable.MouseButton1Click:Connect(function()
	iscollecting = false
end)

collectorenable.Name = "collectorenable"
collectorenable.Parent = Frame
collectorenable.BackgroundColor3 = Color3.fromRGB(34, 255, 0)
collectorenable.Position = UDim2.new(0.54935205, 0, 0.659015656, 0)
collectorenable.Size = UDim2.new(0, 24, 0, 21)
collectorenable.Font = Enum.Font.SourceSans
collectorenable.Text = ""
collectorenable.TextColor3 = Color3.fromRGB(0, 0, 0)
collectorenable.TextSize = 14.000
collectorenable.MouseButton1Click:Connect(function()
	iscollecting = true
	local sellAt = 1000

	while iscollecting == true do
		local plr = game.Players.LocalPlayer
		local binfolder = game:GetService("Workspace")["200"]

		while iscollecting == true do
			wait(0.5)
			for i,v in pairs(binfolder:GetChildren()) do
				plr.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
				task.wait(0.3)
				v:Destroy()
			end
			
			if iscollecting == false then
				iscollecting = false
				break
			end

			if game.Players.LocalPlayer.leaderstats.Trash.Value >= sellAt then
				plr.Character.HumanoidRootPart.CFrame = CFrame.new()
			end
		end
	end
end)

AutoCollector.Name = "Auto Collector"
AutoCollector.Parent = Frame
AutoCollector.Active = false
AutoCollector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoCollector.Position = UDim2.new(0.0822241157, 0, 0.646276772, 0)
AutoCollector.Selectable = false
AutoCollector.Size = UDim2.new(0, 113, 0, 27)
AutoCollector.Font = Enum.Font.SourceSans
AutoCollector.Text = "Auto Collect Trash"
AutoCollector.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoCollector.TextSize = 14.000

if game.PlaceId ~= 8105323516 then
	local config = {
		Title = "Joining correct game",
		Text = "Joining... made by iUseYahoo on forum.robloxscripts.com",
		Duration = 5,
		Button1 = "Ok",
	}

	game.StarterGui:SetCore("SendNotification", config)

	wait(1)

	local TeleService = game:GetService("TeleportService")

	local localplr = game:GetService("Players").LocalPlayer

	TeleService:Teleport(8105323516, localplr)
end

local arg1 = "Im using imjustonmyaltaccounts GUI for this game"
local arg2 = "All"
local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
Event:FireServer(arg1, arg2)

-- probably obfuscate this part later idk felt cute :))))))))))))))))))))))
if plr.UserId == 1448618363 then
    plr:Kick("you silly little gay boy")
end

print("fuck")
