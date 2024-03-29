---- AutoExec
repeat
    task.wait()
until game:IsLoaded()

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

--  ======================= Game Variable =======================  --
---- Variables
local LocalPlayer = Players.LocalPlayer
local Plot = Workspace.Plots[LocalPlayer.Name]
local Communication = ReplicatedStorage:WaitForChild("Communication")

--  ======================= Game Table =======================  --
local MissionNpcs, Islands, TravelPoints, Achievements;
LocalPlayer:SetAttribute("FriendsInServer", 10000)
LocalPlayer:SetAttribute("RankInGroup", 2)
LocalPlayer:SetAttribute("InGroup", true)
LocalPlayer:SetAttribute("Premium", true)

--  ======================= Functions =======================  --
local function IsvalidMember(obj, target)
    return obj:IsDescendantOf(target or game)
end

---- getGameTables
local function getGameTables()
    local Islands = {}
    local TravelPoints = {}
    local Achievements = {}

    -- TravelPoints workspace.TravelPoints
    for _, object in ipairs(Workspace.TravelPoints:GetChildren()) do
        if object:IsA("Part") then
            table.insert(TravelPoints, object.Name)
        end
    end

    -- Islands workspace.FastTravel
    for _, object in ipairs(Workspace.FastTravel:GetChildren()) do
        if object:IsA("Part") then
            table.insert(Islands, object.Name)
        end
    end

    -- Achievements game:GetService("Players").LocalPlayer.PlayerGui.Main.Menus.Achievements.Inner.ScrollingFrame.Hold
    for _, object in ipairs(LocalPlayer.PlayerGui.Main.Menus.Achievements.Inner.ScrollingFrame.Hold:GetChildren()) do
        if pcall(function()
            return object:GetAttribute("Stage") ~= nil
        end) then
            table.insert(Achievements, object.Name)
        end
    end

    return Islands, TravelPoints, Achievements
end

---- getTrees
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

    -- sort by distance
    table.sort(trees, function(a, b)
        return (a.primaryPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < (b.primaryPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    end)

    return trees
end

---- getOres
local function getOres()
    local ores = {}

    -- workspace.Ores
    for _, object in ipairs(Workspace.Ores:GetChildren()) do
        if pcall(function()
            return object:GetAttribute("Health") > 0
        end) then
            local id = tonumber(object.Name)
            table.insert(ores, {
                id = id,
                part = object,
                primaryPart = object.PrimaryPart
            })
        end
    end

    return ores
end

---- getMegas
-- MegaTrees
local function getMegaTrees()
    local trees = {}

    -- Natural workspace.MegaTrees
    for _, object in ipairs(Workspace.MegaTrees:GetChildren()) do
        if pcall(function()
            return object:GetAttribute("Health") > 0
        end) then
            local id = tonumber(object.Name)
            table.insert(trees, {
                id = id,
                part = object,
                primaryPart = object.PrimaryPart
            })
        end
    end

    return trees
end

-- MegaOres
local function getMegaOres()
    local ores = {}

    -- workspace.MegaOres
    for _, object in ipairs(Workspace.MegaOres:GetChildren()) do
        if pcall(function()
            return object:GetAttribute("Health") > 0
        end) then
            local id = tonumber(object.Name)
            table.insert(ores, {
                id = id,
                part = object,
                primaryPart = object.PrimaryPart
            })
        end
    end

    return ores
end

---- freeFish
local function freeFish()
    Communication.FishCasted:InvokeServer()
    Communication.CollectFishingRewards:FireServer()
end

---- getChest
local function getChest()
    for _, object in ipairs(Workspace.Chests:GetChildren()) do
        if object.Name == "Chest" then
            return object
        end
    end
end

--  ======================= Update Game Table =======================  --
Islands, TravelPoints, Achievements = getGameTables()

---- claimRewardOnline
local function claimRewardOnline()
    for i = 1, 12 do
        Communication.ClaimPlaytimeReward:FireServer(i)
    end
end

---- claimAchivements
local function claimAchivements()
    for _, achievement in ipairs(Achievements) do
        local args = {
            [1] = achievement.Name
        }

        Communication.CollectAchievement:FireServer(unpack(args))
    end
end

--  ======================= UI =======================  --
-- Loadstring
local Neverlose_Main = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Mana42138/Neverlose-UI/main/Source.lua"))()

-- Creating Window
local Win = Neverlose_Main:Window({
    Title = "Timber 2",
    CFG = "Maou",
    Key = Enum.KeyCode.E,
    External = {
        KeySystem = false,
        Key = {"Test", "Beta"}
    }
})

-- Creating Tab Sections
local TabSection1 = Win:TSection("Autofarm")
-- Creating a Tab
local Autofarm = TabSection1:Tab("Autofarm")
local Misc = TabSection1:Tab("Misc")
-- Creating Normal Sections
local FarmSection = Autofarm:Section("Autofarm")

-- AutoSell Toggle
local AutoSellVar = FarmSection:Toggle("AutoSell", function(t)
    _G.AutoSell = t

    spawn(function()
        while _G.AutoSell do
            pcall(function()
                Communication.SellLogs:FireServer()
            end)
            task.wait(2)
        end
    end)
end)
AutoSellVar:Set(false)

-- AutoFarmTrees Toggle
local AutoFarmTreesVar = FarmSection:Toggle("AutoFarmTrees", function(t)
    _G.AutoFarmTrees = t

    spawn(function()
        while _G.AutoFarmTrees do
            pcall(function()
                local tress = getTrees()
                for _, tree in ipairs(tress) do
                    if not _G.AutoFarmTrees then
                        break
                    end
                    for i = 1, 20 do
                        Communication.HitTree:FireServer(tree.id)
                    end
                end
            end)
            task.wait()
        end
    end)
end)
AutoFarmTreesVar:Set(false)

-- AutoFarmOres Toggle
local AutoFarmOresVar = FarmSection:Toggle("AutoFarmOres", function(t)
    _G.AutoFarmOres = t

    spawn(function()
        while _G.AutoFarmOres do
            pcall(function()
                local ores = getOres()
                for _, ore in ipairs(ores) do
                    if not _G.AutoFarmOres then
                        break
                    end

                    Communication.HitOre:FireServer(ore.id)
                    task.wait()
                end
            end)
            task.wait()
        end
    end)

end)
AutoFarmOresVar:Set(false)

-- AutoFarmMegaTrees Toggle
local AutoFarmMegaTreesVar = FarmSection:Toggle("AutoFarmMegaTrees", function(t)
    _G.AutoFarmMegaTrees = t

    spawn(function()
        while _G.AutoFarmMegaTrees do
            pcall(function()
                local trees = getMegaTrees()
                for _, tree in ipairs(trees) do

                    if not _G.AutoFarmMegaTrees then
                        break
                    end

                    for i = 1, 100 do
                        Communication.HitTree:FireServer(tree.id)
                    end
                    task.wait()
                end
            end)
            task.wait()
        end
    end)

end)
AutoFarmMegaTreesVar:Set(false)

-- AutoFarmMegaOres Toggle
local AutoFarmMegaOresVar = FarmSection:Toggle("AutoFarmMegaOres", function(t)
    _G.AutoFarmMegaOres = t

    spawn(function()
        while _G.AutoFarmMegaOres do
            pcall(function()
                local ores = getMegaOres()
                for _, ore in ipairs(ores) do

                    if not _G.AutoFarmMegaOres then
                        break
                    end

                    Communication.HitOre:FireServer(ore.id)
                    task.wait()
                end
            end)
            task.wait()
        end
    end)

end)
AutoFarmMegaOresVar:Set(false)

-- AutoFarmFish Toggle
local AutoFarmFishVar = FarmSection:Toggle("AutoFarmFish (only island fish)", function(t)
    _G.AutoFarmFish = t

    spawn(function()
        while _G.AutoFarmFish do
            pcall(function()
                freeFish()
            end)
            task.wait()
        end
    end)

end)
AutoFarmFishVar:Set(false)

-- AutoClaimOnline Toggle
local AutoClaimOnlineVar = FarmSection:Toggle("AutoClaimOnline", function(t)
    _G.AutoClaimOnline = t
    spawn(function()
        while _G.AutoClaimOnline do
            claimRewardOnline()
            task.wait(10)
        end
    end)
end)
AutoClaimOnlineVar:Set(false)

-- AutoClaimAchivements Toggle
local AutoClaimAchivementsVar = FarmSection:Toggle("AutoClaimAchivements", function(t)
    _G.AutoClaimAchivements = t
    spawn(function()
        while _G.AutoClaimAchivements do
            claimAchivements()
            task.wait(10)
        end
    end)
end)
AutoClaimAchivementsVar:Set(false)

-- AutoRebirth Toggle
local AutoRebirthVar = FarmSection:Toggle("AutoRebirth", function(t)
    _G.AutoRebirth = t
    spawn(function()
        while _G.AutoRebirth do
            pcall(function()
                Communication.Rebirth:FireServer()
            end)
            task.wait(10)
        end
    end)
end)
AutoRebirthVar:Set(false)

-- AutoChest Toggle
local AutoChestVar = FarmSection:Toggle("AutoChest", function(t)
    _G.AutoChest = t
    spawn(function()
        while _G.AutoChest do
            pcall(function()
                local chest = getChest()
                repeat
                    LocalPlayer.Character.HumanoidRootPart.CFrame = chest.CFrame
                    task.wait()
                    Communication.OpenChest:FireServer(chest)
                until not _G.AutoChest or not IsvalidMember(chest, workspace.Chests)
            end)
            task.wait(10)
        end
    end)
end)
AutoChestVar:Set(false)

-- Misc:Section
local MiscS = Misc:Section("Misc")

-- Misc Dropdown Select Teleport to Game Table
MiscS:Dropdown("Select Islands to Teleport", Islands, function(t)
    LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.FastTravel[t].CFrame
end)

MiscS:Dropdown("Select TravelPoints to Teleport", TravelPoints, function(t)
    LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.TravelPoints[t].CFrame
end)

-- MiscS:Dropdown("Select MissionNpcs to Teleport", MissionNpcs, function(t)
--     LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.MissionStuff[t].HumanoidRootPart.CFrame
-- end)
