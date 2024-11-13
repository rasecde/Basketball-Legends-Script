local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICornerFrame = Instance.new("UICorner")
local UICornerButton = Instance.new("UICorner")
local UIStrokeFrame = Instance.new("UIStroke")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
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

TextButton.MouseButton1Click:Connect(function()
    closeGUI(runScripts)
    print("Done Loading")
end)
