local function CreateNotification(text, size)
    local Notification = Instance.new("ScreenGui")
    local TextLabel_1 = Instance.new("TextLabel")
    local UIStroke_1 = Instance.new("UIStroke")

    -- Properties:
    Notification.Name = "Notification"
    Notification.Parent = game.CoreGui

    TextLabel_1.Parent = Notification
    TextLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
    TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TextLabel_1.BackgroundTransparency = 1
    TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
    TextLabel_1.BorderSizePixel = 0
    TextLabel_1.Position = UDim2.new(0.499971122, 0,0.87081784, 0)
    TextLabel_1.Size = UDim2.new(0, 287,0, 37)
    TextLabel_1.Font = Enum.Font.FredokaOne
    TextLabel_1.Text = text
    TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
    TextLabel_1.TextScaled = true
    TextLabel_1.TextSize = size
    TextLabel_1.TextWrapped = true

    UIStroke_1.Parent = TextLabel_1
    UIStroke_1.Thickness = 1
    
    Notification.Parent = game.CoreGui
    wait(5)
    Notification:Destroy()
end

return CreateNotification
