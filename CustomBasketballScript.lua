local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICornerFrame = Instance.new("UICorner")
local UICornerButton = Instance.new("UICorner")
local UIStrokeFrame = Instance.new("UIStroke")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

ScreenGui.Name = "MyCustomGUI"  -- Give a unique name to prevent conflicts
ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundTransparency = 1

UICornerFrame.CornerRadius = UDim.new(0, 15)
UICornerFrame.Parent = Frame

UIStrokeFrame.Parent = Frame
UIStrokeFrame.Color = Color3.fromRGB(0, 0, 0)
UIStrokeFrame.Thickness = 8

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = "Load Script"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 24
TextButton.BackgroundTransparency = 1

UICornerButton.CornerRadius = UDim.new(0, 15)
UICornerButton.Parent = TextButton

local function sendNotification(message)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Script Loaded";
        Text = message;
        Duration = 10;
        Icon = "";
    })
end

local function runScripts()
    _G.OBFHUBFREE = "2kmembersgang"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obfhub/free/main/basketmball"))()

    getgenv().config = {Time = 0.045, Size = 0.9} 

    local UIS = game:GetService("UserInputService") 
    local Player = Players.LocalPlayer 
    local Bar = Player.PlayerGui.Visual.Shooting.Bar 

    UIS.InputBegan:Connect(function(input, gpe) 
        if gpe then return end 
        if input.KeyCode == Enum.KeyCode.E then 
            if Player.Character:FindFirstChild("Basketball") then 
                while UIS:IsKeyDown(Enum.KeyCode.E) do 
                    Bar:GetPropertyChangedSignal("Size"):Connect(function() 
                        if Bar.Size.Y.Scale > getgenv().config.Size then 
                            Bar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, getgenv().config.Time, true) 
                            task.wait() 
                            Bar.Size = UDim2.new(1, 0, 1, 0) 
                        end 
                    end) 
                    task.wait() 
                end 
            end 
        end 
    end)

    sendNotification("Auto Green Enabled & Auto Guard")
end

-- Directly destroy GUI without animation and add debugging prints
local function closeGUI()
    print("Attempting to close GUI...") -- Debugging print
    if ScreenGui then
        print("ScreenGui found, destroying it now.") -- Debugging print
        ScreenGui:Destroy()  -- Directly remove the GUI from CoreGui
        print("ScreenGui destroyed.") -- Confirming print
    else
        print("ScreenGui not found!") -- Debugging print if it fails to locate
    end
end

-- Load script, then immediately close GUI
TextButton.MouseButton1Click:Connect(function()
    print("Load Script button clicked.") -- Debugging print
    runScripts()  -- Run the main script
    closeGUI()    -- Directly destroy the GUI after running the script
    print("Done Loading") -- Final confirmation print
end)


