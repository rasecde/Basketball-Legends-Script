local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Create Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleMobileGUI"
ScreenGui.Parent = game.CoreGui

-- Button for Shooting
local ShootButton = Instance.new("TextButton")
ShootButton.Parent = ScreenGui
ShootButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
ShootButton.Size = UDim2.new(0, 100, 0, 50)  -- Adjust size as needed
ShootButton.Position = UDim2.new(0.8, 0, 0.8, 0)  -- Adjust position as needed
ShootButton.Text = "Shoot"
ShootButton.TextSize = 24
ShootButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Button for Guarding
local GuardButton = Instance.new("TextButton")
GuardButton.Parent = ScreenGui
GuardButton.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
GuardButton.Size = UDim2.new(0, 100, 0, 50)  -- Adjust size as needed
GuardButton.Position = UDim2.new(0.6, 0, 0.8, 0)  -- Adjust position as needed
GuardButton.Text = "Guard"
GuardButton.TextSize = 24
GuardButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Function to simulate shooting
local function shoot()
    if Player.Character:FindFirstChild("Basketball") then
        local Bar = Player.PlayerGui.Visual.Shooting.Bar
        while Bar.Size.Y.Scale > getgenv().config.Size do
            Bar:TweenSize(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, getgenv().config.Time, true)
            task.wait()
            Bar.Size = UDim2.new(1, 0, 1, 0)
        end
    end
end

-- Function to enable guarding
local function guard()
    -- Implement the guard functionality here if needed
    print("Guard activated")
end

-- Connect buttons to functions
ShootButton.MouseButton1Click:Connect(shoot)
GuardButton.MouseButton1Click:Connect(guard)

-- Optional: Send a notification to confirm loading
local function sendNotification(message)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Script Loaded";
        Text = message;
        Duration = 10;
        Icon = "";
    })
end

sendNotification("Auto Green Enabled & Auto Guard")
