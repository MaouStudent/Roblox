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

-- Function to get trees
local function getTrees()
    local trees = {}
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

    -- order by Logs
    table.sort(trees, function(a, b)
        return a.logs > b.logs
    end)

    return trees
end

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

-- Main loop
while true do
    -- Create coroutines for hitting trees and mega ores
    local hitTreesCoroutine = coroutine.create(hitTrees)
    local hitMegasCoroutine = coroutine.create(hitMegas)

    -- Resume (start) the coroutines
    coroutine.resume(hitTreesCoroutine)
    coroutine.resume(hitMegasCoroutine)

    -- Wait for both coroutines to finish
    while coroutine.status(hitTreesCoroutine) ~= 'dead' or coroutine.status(hitMegasCoroutine) ~= 'dead' do
        task.wait()
    end

    task.wait(1)
    Communication:WaitForChild("SellLogs"):FireServer()
end
