local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local VisualWindow = library:CreateWindow("Visual Cheats") -- Creates the window

local MovementWindow = library:CreateWindow("Movement Cheats") -- Creates the window

local MovementFolder = MovementWindow:CreateFolder("General Movement")

local SkyFolder = VisualWindow:CreateFolder("Sky / Enviroment") -- Creates the folder(U will put here your buttons,etc)

local FoodFolder = VisualWindow:CreateFolder("Food / Entities") -- Creates the folder(U will put here your buttons,etc)

local Afk = false
local noclip = false
local LastPos = CFrame.new(0,0,0)
--VISUAL CHEATS

SkyFolder:Slider("Time Of Day",{
    min = 0; -- min value of the slider
    max = 12; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
   
    local FogColor = 133 / 12
    FogColor = FogColor * value
    FogColor = Color3.fromRGB(FogColor,FogColor,FogColor)

    local OutdoorAmbient = 120 / 12
    OutdoorAmbient = OutdoorAmbient * value

    local ClockTime = value

    game.Lighting.ClockTime = ClockTime
    game.Lighting.FogColor = FogColor
    game.Lighting.OutdoorAmbient = OutdoorAmbient

end)

SkyFolder:Slider("Fog Distance",{
    min = 300; -- min value of the slider
    max = 3000; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)

    game.Lighting.FogEnd = value

end)

SkyFolder:Slider("Brightness",{
    min = 0; -- min value of the slider
    max = 3; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)

    game.Lighting.Brightness = value
    game.Lighting.Ambient = value / 2
    game.Lighting.FogColor = Color3.fromRGB(85*value,85*value,85*value)

end)

SkyFolder:Toggle("Third Person",function(bool)
    shared.toggle = bool
    if bool == true then
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 100
        game:GetService("Players").LocalPlayer.CameraMinZoomDistance = 0
    else
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 100
        game:GetService("Players").LocalPlayer.CameraMinZoomDistance = 0
    end
end)

FoodFolder:Button("Item ESP",function()
    for i,v in pairs(workspace.Items:GetDescendants()) do
        if v:IsA('BasePart') then
            local Bill = Instance.new('BillboardGui')
            Bill.Parent = v
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

--MOVEMENT CHEATS

MovementFolder:Bind("Mouse TP Keybind:",Enum.KeyCode.Z,function() --Default bind
    plr = game.Players.LocalPlayer
    hum = plr.Character.HumanoidRootPart
    mouse = plr:GetMouse()

    if mouse.Target then
        hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
    end

end)

MovementFolder:Bind("Noclip Keybind:",Enum.KeyCode.Q,function() --Default bind
    noclip = not noclip
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end)

MovementFolder:Toggle("AFK Protection",function(bool)
    shared.toggle = bool
    
    if bool == true then

        LastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

        Afk = true
        
    else
        Afk = false

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = LastPos
    end

end)

MovementFolder:Button("Skydive",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x,2000,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z)

end)

--[[LOOP]]

game:GetService('RunService').Stepped:connect(function()
    if Afk == true then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1671.92834, 5.5, 2473.96826, 0.0202962868, -1.64578342e-08, -0.999793112, -3.83029031e-09, 1, -1.65389995e-08, 0.999793112, 4.16518153e-09, 0.0202962868)
    
    end

    if noclip then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end

end)

--[[
b:Label("Pretty Useless NGL",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

b:Button("Button",function()
    print("Elym Winning")
end)

b:Toggle("Toggle",function(bool)
    shared.toggle = bool
    print(shared.toggle)
end)

b:Slider("Slider",{
    min = 10; -- min value of the slider
    max = 50; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    print(value)
end)

b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    print(mob)
end)

b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
    print("Yes")
end)

b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
    print(color)
end)

b:Box("Box","number",function(value) -- "number" or "string"
    print(value)
end)

--]]

--[[
How to refresh a dropdown:
1)Create the dropdown and save it in a variable
local yourvariable = b:Dropdown("Hi",yourtable,function(a)
    print(a)
end)
2)Refresh it using the function
yourvariable:Refresh(yourtable)
How to refresh a label:
1)Create your label and save it in a variable
local yourvariable = b:Label("Pretty Useless NGL",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})
2)Refresh it using the function
yourvariable:Refresh("Hello") It will only change the text ofc
]]
