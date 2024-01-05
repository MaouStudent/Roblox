loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

-- Anti AFK
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

repeat
    wait()
until game:IsLoaded()
wait()
Player.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- AntiCheat By VG
loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Anti-Cheat"))()

-- Example
getgenv().Haxk = {
    ["Hitbox"] = {
        Size = Vector3.new(6, 3, 6),
        Transparency = 1
    },
    ["ESP"] = {
        Enabled = true,
        FillColor = Color3.fromRGB(0, 0, 255),
        FillTransparency = 1,
        OutlineColor = Color3.fromRGB(255, 0, 0),
        OutlineTransparency = 1
    }
}

local function CheckSettings(obj)
    local target = obj:FindFirstChild("Target")
    if target
        and target.FillTransparency ~= getgenv().Haxk.ESP.FillTransparency
        or target.FillColor ~= getgenv().Haxk.ESP.FillColor
        or target.OutlineColor ~= getgenv().Haxk.ESP.OutlineColor
        or target.OutlineTransparency ~= getgenv().Haxk.ESP.OutlineTransparency then
        return true
    end
    return false
end

local function DrawESP()
    task.spawn(function()
        for i, obj in workspace:GetChildren() do
            if obj.Name == "soldier_model" and not obj:FindFirstChild("friendly_marker") and
                not obj:FindFirstChild("Target") then
                -- Highlight for obj
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = obj
                Highlight.Adornee = obj
                Highlight.Name = "Target"
                Highlight.FillTransparency = getgenv().Haxk.ESP.FillTransparency
                Highlight.FillColor = getgenv().Haxk.ESP.FillColor
                Highlight.OutlineColor = getgenv().Haxk.ESP.OutlineColor
                Highlight.OutlineTransparency = getgenv().Haxk.ESP.OutlineTransparency
            end
            -- if has friend destroy
            if obj.Name == "soldier_model" and (obj:FindFirstChild("friendly_marker") or CheckSettings(obj)) and obj:FindFirstChild("Target") then
                obj.Target:Destroy()
            end
        end
    end)
end

-- RenderStep Loop ESP
task.spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Haxk.ESP.Enabled then
            DrawESP()
        else
            for i, obj in workspace:GetChildren() do
                if obj.Name == "soldier_model" and obj:FindFirstChild("Target") then
                    obj.Target:Destroy()
                end
            end
        end
    end)
end)

-- Hitbox
-- Apply hitboxes to all existing enemy models in the workspace
for _, v in pairs(workspace:GetDescendants()) do
    if v.Name == "soldier_model" and v:IsA("Model") and not v:FindFirstChild("friendly_marker") then
        local pos = v:FindFirstChild("HumanoidRootPart").Position
        for _, bp in pairs(workspace:GetChildren()) do
            if bp:IsA("BasePart") then
                local distance = (bp.Position - pos).Magnitude
                if distance <= 5 then
                    bp.Transparency = getgenv().Haxk.Hitbox.Transparency
                    bp.Size = getgenv().Haxk.Hitbox.Size
                end
            end
        end
    end
end

-- Function to handle when a new descendant is added to the workspace
local function handleDescendantAdded(descendant)
    task.wait(1)

    -- If the new descendant is an enemy model and notifications are enabled, send a notification
    if descendant.Name == "soldier_model" and descendant:IsA("Model") and
        not descendant:FindFirstChild("friendly_marker") then

        -- Apply hitboxes to the new enemy model
        local pos = descendant:FindFirstChild("HumanoidRootPart").Position
        for _, bp in pairs(workspace:GetChildren()) do
            if bp:IsA("BasePart") then
                local distance = (bp.Position - pos).Magnitude
                if distance <= 5 then
                    bp.Transparency = getgenv().Haxk.Hitbox.Transparency
                    bp.Size = getgenv().Haxk.Hitbox.Size
                end
            end
        end
    end
end

-- Connect the handleDescendantAdded function to the DescendantAdded event of the workspace
task.spawn(function()
    game.Workspace.DescendantAdded:Connect(handleDescendantAdded)
end)
