local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local UserInputService = game:GetService('UserInputService')
local Mouse = game.Players.LocalPlayer:GetMouse()
--[[
window is a seperate draggable gui.
folder is inside of a window


]]
local HornEnabled = false
local DoorEnabled = false
local JumpEnabled = false
local StaminaEnabled = false
local TeleportEnabled = false
local NoclipEnabled = false
local NoclipToggled = false
local AimlockToggled = false
-- WINDOWS



local MovementCheats = library:CreateWindow("Visual Cheats") -- Creates the window

local MiscCheats = library:CreateWindow("Movement Cheats") -- Creates the window

local VisualCheats = library:CreateWindow("Movement Cheats") -- Creates the window

-- FOLDERS

local MovementFolder = MovementCheats:CreateFolder("Movement Cheats") -- Creates the folder(U will put here your buttons,etc)

local MiscFolder = MiscCheats:CreateFolder("Misc. Cheats") -- Creates the folder(U will put here your buttons,etc)

local VisualFolder = VisualCheats:CreateFolder("Visual Cheats") -- Creates the folder(U will put here your buttons,etc)

-- VISUAL CHEAT SECTION

VisualFolder:Button("Printer X-Ray",function()
    local PrinterFolder = workspace.Entities

    for i,v in pairs(workspace.Entities:GetChildren()) do
        if v.Name == "Simple Printer" then
            local Bill = Instance.new('BillboardGui')
            Bill.Parent = v.hitbox
            Bill.Size = UDim2.new(.25,0,.25,0)
            Bill.AlwaysOnTop = true
            Bill.ClipsDescendants = false

            local Frame = Instance.new('Frame',Bill)
            Frame.Size = UDim2.new(1,0,1,0)
            Frame.BackgroundColor3 = Color3.fromRGB(255,0,0)

            local TextLabel = Instance.new('TextLabel', Frame)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Position = UDim2.new(-10,0,-2.9,0)
            TextLabel.Size = UDim2.new(20,0,3,0)
            TextLabel.Font = Enum.Font.SourceSansSemibold
            TextLabel.Text = v.Parent.Name
            TextLabel.TextColor3 = Color3.fromRGB(179,0,0)
            TextLabel.TextScaled = true
            TextLabel.TextStrokeTransparency = 0
        end
    end
end)

-- MOVEMENT CHEAT SECTION

MovementFolder:Toggle("Infinite Jump",function(bool)
    shared.toggle = bool
    print("Inf Jump "..tostring(shared.toggle))
    JumpEnabled = bool
end)

MovementFolder:Toggle("Infinite Stamina",function(bool)
    shared.toggle = bool
    print("Inf Stamina "..tostring(shared.toggle))
    StaminaEnabled = bool
end)

MovementFolder:Toggle("Noclip",function(bool)
    shared.toggle = bool
    print("Mouse tp "..tostring(shared.toggle))
    NoclipToggled = bool
end)

MovementFolder:Toggle("Mouse TP",function(bool)
    shared.toggle = bool
    print("Mouse tp "..tostring(shared.toggle))
    TeleportEnabled = bool
end)

MovementFolder:Label("KEYBINDS",{
    TextSize = 15; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

MovementFolder:Bind("Noclip Bind:",Enum.KeyCode.E,function() --Default bind
    print('Noclip')
    if NoclipToggled == true then
        NoclipEnabled = not NoclipEnabled

    end
end)

MovementFolder:Bind("Mouse TP Bind:",Enum.KeyCode.C,function() --Default bind
    print('TP')
    if TeleportEnabled == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.p + Vector3.new(0,5,0))

    end
end)

UserInputService.InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.Space then
        if JumpEnabled == true then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
            game.Players.LocalPlayer.Character.Humanoid.Jump = true
        end
    end
end)

UserInputService.InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        if StaminaEnabled == true then
            Sprint = true

        end
    end
end)

UserInputService.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.LeftShift then
        if StaminaEnabled == true then
            Sprint = false
        end
    end
end)

game:GetService('RunService').Stepped:connect(function()
    if NoclipEnabled == true then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)

-- MISC CHEATS

MiscFolder:Toggle("Horn Fucker",function(bool)
    shared.toggle = bool
    print("horn fucker "..tostring(shared.toggle))
    HornEnabled = bool
end)

MiscFolder:Toggle("Door Fucker",function(bool)
    shared.toggle = bool
    print("door fucker "..tostring(shared.toggle))
    DoorEnabled = bool
end)

-- MAIN LOOP

while wait() do
    if HornEnabled == true then
        for i,v in pairs(workspace.PlayerVehicles:GetChildren()) do
            game.ReplicatedStorage["_CS.Events"].Horn:FireServer(v.VehicleSeat)
        end
            wait(0.6)
        for i,v in pairs(workspace.PlayerVehicles:GetChildren()) do
            game.ReplicatedStorage["_CS.Events"].Horn:FireServer(v.VehicleSeat,"End")
        end
        
        wait(0.6)
    end

    if DoorEnabled == true then
        local PlayerPlots = workspace.PlayerPlots
        local Doors = {} -- nil for now
    
        for i,v in pairs(PlayerPlots:GetDescendants()) do
            if v.Name == "DoorFire" then
                
                local Lockedvalue = v.Parent:FindFirstChild('DoorLocked')
                
                if Lockedvalue ~= nil then
                
                    if Lockedvalue.Value == false then
                    table.insert(Doors,v)
                    end
                end
            end
        end
        
        
        for i = 1, #Doors do
            Doors[i]:FireServer()
        end
    end

end
