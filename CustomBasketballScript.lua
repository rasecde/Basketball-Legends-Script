local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICornerFrame = Instance.new("UICorner")
local UICornerButton = Instance.new("UICorner")
local UIStrokeFrame = Instance.new("UIStroke")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

ScreenGui.Name = "SimpleGUI"
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

local function playOpenAnimation()
    local tweenInfo = TweenInfo.new(
        1.5,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out,
        0,
        false,
        0
    )

    local frameGoals = {
        Size = UDim2.new(0.15, 0, 0.15, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 0
    }

    local textButtonGoals = {
        TextSize = 24,
        BackgroundTransparency = 0
    }

    local frameTween = TweenService:Create(Frame, tweenInfo, frameGoals)
    local textButtonTween = TweenService:Create(TextButton, tweenInfo, textButtonGoals)

    frameTween:Play()
    textButtonTween:Play()
end

playOpenAnimation()

local function closeGUI(callback)
    local tweenInfo = TweenInfo.new(
        0.5,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out,
        0,
        false,
        0
    )
    
    local frameGoals = {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    }

    local textButtonGoals = {
        TextSize = 0,
        BackgroundTransparency = 1
    }
    
    local frameTween = TweenService:Create(Frame, tweenInfo, frameGoals)
    local textButtonTween = TweenService:Create(TextButton, tweenInfo, textButtonGoals)
    
    frameTween:Play()
    textButtonTween:Play()
    
    frameTween.Completed:Connect(function()
        ScreenGui:Destroy()
        if callback then callback() end
    end)
end

local function sendNotification(message)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Script Loaded";
        Text = message;
        Duration = 10;
        Icon = "";
    })
end

-- The original runScripts function that loads the main script and sets up the config
local function runScripts()
    _G.OBFHUBFREE = "2kmembersgang"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obfhub/free/main/basketmball"))()

    getgenv().config = {Time = 0.045, Size = 0.9} 

    sendNotification("Auto Green Enabled & Auto Guard")
end

-- Call runScripts after closing the GUI
TextButton.MouseButton1Click:Connect(function()
    closeGUI(runScripts)
    print("Done Loading")
end)  -- Make sure this closing end) is here

-- Adding a "Shoot" button for mobile users to trigger the shooting action
local ShootButton = Instance.new("TextButton")
ShootButton.Parent = ScreenGui
ShootButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
ShootButton.Size = UDim2.new(0, 100, 0, 50)  -- Adjust size if needed
ShootButton.Position = UDim2.new(0.8, 0, 0.8, 0)  -- Adjust position if needed
ShootButton.Text = "Shoot"
ShootButton.TextSize = 24
ShootButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to simulate shooting when ShootButton is pressed
local function shoot()
    local Player = Players.LocalPlayer
    local Bar = Player.PlayerGui:FindFirstChild("Visual") and Player.PlayerGui.Visual:FindFirstChild("Shooting") and Player.PlayerGui.Visual.Shooting:FindFirstChild("Bar")
    
    if Bar and Player.Character:FindFirstChild("Basketball") then
        Bar:GetPropertyChangedSignal("Size"):Connect(function()
            if Bar.Size.Y.Scale > getgenv().config.Size then
                Bar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, getgenv().config.Time, true)
                task.wait()
                Bar.Size = UDim2.new(1, 0, 1, 0)
            end
        end)
    end
end

-- Connect the ShootButton to the shoot function
ShootButton.MouseButton1Click:Connect(shoot)
