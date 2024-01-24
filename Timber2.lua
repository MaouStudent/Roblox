local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Plot = Workspace.Plots[LocalPlayer.Name]
local Communication = ReplicatedStorage:WaitForChild("Communication")

-- Function to hit a tree
local function hitTree(id)
    Communication:WaitForChild("HitTree"):FireServer(id)
end

-- Function to hit a mega ore
local function hitMegaOre(id)
    Communication:WaitForChild("HitOre"):FireServer(id)
end

local function freeGamepassAndGroup()
    LocalPlayer:SetAttribute("FriendsInServer", 10000)
    LocalPlayer:SetAttribute("RankInGroup", 2)
    LocalPlayer:SetAttribute("InGroup", true)
    LocalPlayer:SetAttribute("Premium", true)
end

local function collectDebris()
    local args = {
        [1] = workspace:WaitForChild("Plots"):WaitForChild("YT_PhenTho"):WaitForChild("Land"):WaitForChild("-1_0")
            :WaitForChild("BerryBush")
    }

    Communication:WaitForChild("CollectBerries"):FireServer(unpack(args))
end

-- Function to get trees
local function getTrees()
    local trees = {}

    -- In Island
    for _, part in ipairs(Plot.Land:GetChildren()) do
        for _, object in ipairs(part:GetChildren()) do
            if pcall(function()
                return object:GetAttribute("Health") > 0 and object.PrimaryPart.Name == "Wood"
            end) then
                local id = tonumber(object.Name)
                local logs = object:GetAttribute("Logs")
                table.insert(trees, {
                    id = id,
                    logs = logs,
                    part = object,
                    primaryPart = object.PrimaryPart
                })
            end
        end
    end

    -- Natural workspace.NaturalTrees
    for _, object in ipairs(Workspace.NaturalTrees:GetChildren()) do
        if pcall(function()
            return object:GetAttribute("Health") > 0
        end) then
            local id = tonumber(object.Name)
            local logs = object:GetAttribute("Logs")
            table.insert(trees, {
                id = id,
                logs = logs,
                part = object,
                primaryPart = object.PrimaryPart
            })
        end
    end

    -- order by Logs
    table.sort(trees, function(a, b)
        return a.logs > b.logs
    end)

    return trees
end

-- function to get Ores


-- Function to hit mega ores and trees
local function hitMegas()
    local megaOres = Workspace.MegaOres:GetChildren()
    local megaTrees = Workspace.MegaTrees:GetChildren()

    local function hitIfHealthy(id, hitFunction)
        if pcall(function()
            return id:GetAttribute("Health") > 0
        end) then
            hitFunction(tonumber(id.Name))
        end
    end

    for _, id in ipairs(megaOres) do
        hitIfHealthy(id, hitMegaOre)
    end

    for _, id in ipairs(megaTrees) do
        hitIfHealthy(id, hitTree)
    end
end

-- Function to hit trees
local function hitTrees()
    local trees = getTrees()
    for _, tree in ipairs(trees) do
        hitTree(tree.id)
    end
end

local function freeFish()
    Communication:WaitForChild("FishCasted"):InvokeServer()
    Communication:WaitForChild("CollectFishingRewards"):FireServer()
end

-- -- Main loop
-- while true do
--     -- Create coroutines
--     local hitTreesCoroutine = coroutine.create(hitTrees)
--     local hitMegasCoroutine = coroutine.create(hitMegas)
--     local freeFishCoroutine = coroutine.create(freeFish)

--     -- Resume (start) the coroutines
--     coroutine.resume(hitTreesCoroutine)
--     coroutine.resume(hitMegasCoroutine)
--     coroutine.resume(freeFishCoroutine)

--     -- Wait for both coroutines to finish
--     while coroutine.status(hitTreesCoroutine) ~= 'dead' or coroutine.status(hitMegasCoroutine) ~= 'dead' or
--         coroutine.status(freeFishCoroutine) ~= 'dead' do
--         task.wait()
--     end

--     task.wait()
--     Communication:WaitForChild("SellLogs"):FireServer()
-- end
