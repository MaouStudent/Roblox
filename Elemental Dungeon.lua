repeat
    wait()
until game:IsLoaded()

wait()
-- Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
wait()
local UseSword = UseSword or
                     game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("WeaponService"):WaitForChild("RF")
        :WaitForChild("UseSword")
local lp = game:GetService("Players").LocalPlayer
wait()
local getMobs = getMobs or function()
    local mobs = {}
    for index, mob in pairs(workspace.Mobs:GetChildren()) do
        table.insert(mobs, {
            mob = mob,
            humanoid = mob.humanoid
        })
    end

    return mobs
end

local attack = attack or function()
    local args = {
        [1] = {
            ["Direction"] = Vector3.new(0, 0, 0),
            ["Origin"] = lp.Character.PrimaryPart.Position,
            ["Position"] = lp.Character.PrimaryPart.Position
        },
        [2] = "HFA27LM88128"
    }

    UseSword:InvokeServer(unpack(args))
end

-- tp to mobs and repeat attack until humanoid.healhth <= 0
_G.Farm = true
while _G.Farm do
    pcall(function()
        local mob = getMobs()[1]
        print(mob.mob.Name)
        repeat
            if mob then
                -- tp to mob
                lp.Character.HumanoidRootPart.CFrame = mob.PrimaryPart.CFrame
                task.wait()
                attack()
            end
        until not _G.Farm or not mob:FindFirstChild("Humannoid") or mob.humanoid.Health <= 0
    end)
    task.wait()
end
