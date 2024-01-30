local lp = game.Players.LocalPlayer
local HitEvent = HitEvent or game:GetService("ReplicatedStorage"):WaitForChild("Msg"):WaitForChild("HitEvent")

local getDungeon = function()
    for i, v in pairs(workspace["\229\137\175\230\156\172\229\156\176\229\155\190"]:GetChildren()) do
        for _, player in pairs(v.Players:GetChildren()) do
            if player.value == lp.CharacterAppearanceId then
                return v
            end
        end
    end
end

local getMobs = function()
    local dungeon = getDungeon()
    local mobs = {}

    if not dungeon then
        return
    end

    for i, v in pairs(dungeon["\229\156\176\229\155\190"].Enemy:FindFirstChildWhichIsA("Folder"):GetChildren()) do
        table.insert(mobs, {
            mob = v,
            name = v.Name,
            part = v.PrimaryPart
        })
    end

    return mobs
end

local hitMob = function(mob)
    for i = 0, 4 do
        local args = {
            [1] = {
                ["phsic"] = {
                    ["Power"] = 100e100,
                    ["Time"] = 0.01,
                    ["Dir"] = mob.part.Position
                },
                ["damage"] = 100e100,
                ["castPercent"] = 0,
                ["hitID"] = 1,
                ["isSetNetworkOwnerEnemy"] = true,
                ["skillID"] = 15010001 + i
            },
            [2] = mob.name
        }
        HitEvent:FireServer(unpack(args))
    end
end

_G.Farm = true
while _G.Farm do
    pcall(function()
        local mobs = getMobs()
        if mobs then
            for _, mob in pairs(mobs) do
                hitMob(mob)
            end
        end
    end)
    task.wait()
end
