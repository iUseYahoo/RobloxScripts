local dia = game:GetService("Workspace").Diamond
local plr = game.Players.LocalPlayer
local head = plr.Character.Head
local timetowait = 1

getgenv().toggle = false -- make true to enable then execute
-- make false to disable then re execute this script

while getgenv().toggle == true do
    task.wait(timetowait)
    dia.CFrame = CFrame.new(head.Position)
end
