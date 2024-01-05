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
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Anti-Cheat"))()

coroutine.wrap(function()
    -- check if firstRun
    if not getgenv().UI then
        -- remove all sound in workspace
        for i, v in pairs(workspace:GetChildren()) do
            if v:IsA("Sound") then
                v:Destroy()
            end
        end
    end
end)()
-- Configs UI
getgenv().UI = getgenv().UI or {
    NextFactory,
    AutoDig,
    AutoRobot,
    AutoFactory,
    AutoWalk,
    AutoDrop,
    AutoFactoryInstant,
    AutoCollectOre,
    AutoCollectMoney,
    AutoRebirth,
    UpgradePickaxeDamage,
    UpgradeRobotPickaxeDamage,
    UpgradeRobotBackpack,
    UpgradeTycoon,
    UnlockGamePasses,
    AutoRubyFusion,
    CountInstant = 200
}, {
    __call = function()
        return UI
    end
}

local UI = getgenv().UI

-- Configs File
local Config = setmetatable(configs or {}, {
    __call = function()
        return Config
    end
})

getgenv().Config = Config

local cloneref = cloneref or function(obj)
    return
end

local Players = cloneref(game:GetService("Players"))
local lp = cloneref(Players.LocalPlayer)

local function IsvalidMember(obj, target)
    return obj:IsDescendantOf(target or game)
end

local function GetMagnitude(targetPart)
    return (lp.Character.HumanoidRootPart.Position - targetPart.Position).Magnitude
end

local function GetMagnitudeRobot(RoboutHum, targetPart)
    return (RoboutHum.Position - targetPart.Position).Magnitude
end

local function GetPlot()
    for i, v in workspace.LandPlots:GetChildren() do
        if v:GetAttribute("Owner") == lp.Name then
            return v
        end
    end
    return nil
end

local function Collect(v)
    if IsvalidMember(v.Bound, v) then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Bound, 0) -- 0 is touch
    end
end

local function CheckButtonBuy(ImageButton)
    -- check if ImageButton ImageColor3 is 88, 255, 128
    return ImageButton.ImageColor3 == Color3.fromRGB(88, 255, 128)
end

-- Loadstring UI
local Neverlose_Main = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Mana42138/Neverlose-UI/main/Source.lua"))()

-- Creating Window
local Win = Neverlose_Main:Window({
    Title = "MaouHub",
    CFG = "MaouHub",
    Key = Enum.KeyCode.Semicolon,
    External = {
        KeySystem = false,
        Key = loadstring(game:HttpGet("https://pastebin.com/raw/qbJ9JtTW"))()
    }
})

local function Notify(title, text)
    Neverlose_Main:Notify({
        Title = title,
        Text = text,
        Time = 2
    })
end

local function RubyFusion()
    -- Wordle
    local v2 = game.ReplicatedStorage.Services
    local u3 = require(v2.QuestHandler)
    local u4 = require(v2.Collect)
    local u10 = game.Players.LocalPlayer
    local L_MainGui_2 = u10:WaitForChild("PlayerGui"):WaitForChild("MainGui")
    local L_RubyFusion_3 = L_MainGui_2:WaitForChild("RubyFusion")
    local u13 = u4(L_RubyFusion_3.Menu.Content.Wordle.Crystals:GetChildren()):whereInstanceOf("ImageButton"):sortBy(
        "LayoutOrder"):get()
    local u14 = L_RubyFusion_3.Menu.Content.Info
    local u15 = u14.Rewards.List
    local u21 = u3.Quests.RubyFusion
    local L_CurrentRound_5 = u10:WaitForChild("Data").Quests:FindFirstChild("RubyFusion"):WaitForChild("Wordle")
        :WaitForChild("CurrentRound")
    local v1 = u3.GetWordleRoundData(u10, u21, L_CurrentRound_5.Value)
    local answer = tostring(v1.Key.Value) -- 54213

    -- Currency.Value >= answer len
    local u22 = u10.Data.Quests.RubyFusion.Currency.Value

    if u22 < #answer then
        return
    end

    -- for loop get index, char
    for i = 1, #answer do
        local char = answer:sub(i, i)
        local args = {
            [1] = u21,
            [2] = i,   -- index Position
            [3] = char -- Crystals
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Services"):WaitForChild("QuestHandler"):WaitForChild(
            "Network"):WaitForChild("WordleEntry"):InvokeServer(unpack(args))
    end

    task.wait(1)
    -- Claim
    local args = {
        [1] = u21
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Services"):WaitForChild("QuestHandler"):WaitForChild("Network")
        :WaitForChild("ClaimWordleReward"):InvokeServer(unpack(args))
end

local function GetRocks()
    local Rocks = {}
    local MyPlot = GetPlot()
    for index, model in MyPlot.Mine.Rocks:GetChildren() do
        local part = model:FindFirstChildWhichIsA("MeshPart")
        if part and IsvalidMember(part, MyPlot) and pcall(function()
                return model:GetAttribute("Health") > 0
            end) then
            table.insert(Rocks, part)
        end
    end

    return Rocks
end

function robotAttack(robot)
    local target_parts = GetRocks()
    local num_targets = #target_parts
    robot:SetAttribute("CanMine", true)
    robot:SetAttribute("Power", 1e+16)
    robot:SetAttribute("Speed", 100)
    robot.Backpack:SetAttribute("ItemLimit", 1e+16)

    local robot_index

    if num_robots < num_targets then
        robot_index = math.random(1, num_targets)
    else
        robot_index = i
    end

    local targetPart = target_parts[robot_index]

    robot.PrimaryPart.CFrame = targetPart.CFrame
    firetouchinterest(robot.DrillHitbox, targetPart, 0)
    firetouchinterest(robot.DrillHitbox, targetPart, 1)
    local args = {
        [1] = robot,
        [2] = targetPart.Parent
    }
    game:GetService("ReplicatedStorage").Remotes.robotMineAction:FireServer(unpack(args))

    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Input, 0)
    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Input, 1)
    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Output, 0)
    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Output, 1)
end

local function FactoryInstant()
    local MyPlot = GetPlot()

    local function GetItems()
        local items = {}
        MyPlot = GetPlot()
        for i, item in pairs(MyPlot.Tycoon.Items:GetChildren()) do
            local model = item:FindFirstChildWhichIsA("Model")
            local finalHitbox = model:FindFirstChild("FinalHitbox")
            local Hitbox = nil

            for i, v in pairs(model:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent.Name ~= "FinalHitbox" then
                    Hitbox = v.Parent
                end
            end

            if pcall(function()
                    return finalHitbox:IsA("Part") and Hitbox:IsA("Part")
                end) then
                table.insert(items, {
                    ["Name"] = item.Name,
                    ["Model"] = model,
                    ["StartHitbox"] = Hitbox,
                    ["FinalHitbox"] = finalHitbox
                })
            end
        end

        return items
    end

    local function GetProcess(ore)
        MyPlot = GetPlot()
        local items = GetItems()
        for i, item in pairs(items) do
            ore.PrimaryPart.CFrame = item['StartHitbox'].CFrame
            firetouchinterest(ore.PrimaryPart, item['StartHitbox'], 0)
            firetouchinterest(ore.PrimaryPart, item['StartHitbox'], 1)
            task.wait()
            ore.PrimaryPart.CFrame = item['FinalHitbox'].CFrame
            firetouchinterest(ore.PrimaryPart, item['FinalHitbox'], 0)
            firetouchinterest(ore.PrimaryPart, item['FinalHitbox'], 1)
        end

        task.wait()
        -- collect
        local collector = MyPlot.Tycoon.Collector.Minecart.Input
        firetouchinterest(ore.PrimaryPart, collector, 0)
        firetouchinterest(ore.PrimaryPart, collector, 1)
    end

    for index, ore in pairs(workspace.ConveyorOre:GetChildren()) do
        coroutine.wrap(function()
            GetProcess(ore)
        end)()
    end
end

-- Creating Tab Sections
local TabSection1 = Win:TSection("Misc")
-- Creating a Tab
local Autofarm = TabSection1:Tab("Autofarm")
-- Creating Normal Sections
local FarmSection = Autofarm:Section("Autofarm")
local UpgradeSection = Autofarm:Section("AutoUpgrade")
local MicsSection = Autofarm:Section("Mics")

-- get plot
local MyPlot = GetPlot()

-- AutoFarmPlayer Toggle
local AutoDigToggle = FarmSection:Toggle("AutoFarmPlayer", function(t)
    UI.AutoDig = t
    spawn(function()
        while UI.AutoDig do
            pcall(function()
                -- set lp WalkSpeed 100
                lp.Character.Humanoid.WalkSpeed = 100
                local targetPart = GetRocks()[1]
                local targetModel = targetPart.Parent
                -- tp to top targetPart with part size y / 2
                lp.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0, targetPart.Size.Y / 2, 0)
                -- targetPart firetouch
                firetouchinterest(lp.Character.Pickaxe.Hitbox, targetPart, 0)
                firetouchinterest(lp.Character.HumanoidRootPart, targetPart, 0)
                game:GetService("ReplicatedStorage").Remotes.mineAction:FireServer(targetModel)
                firetouchinterest(lp.Character.Pickaxe.Hitbox, targetPart, 1)
                firetouchinterest(lp.Character.HumanoidRootPart, targetPart, 1)
                -- FactoryHiddenPart()
            end)
            task.wait()
        end
    end)
end)
AutoDigToggle:Set(UI.AutoDig)

-- AutoRobot Toggle
local AutoRobotToggle = FarmSection:Toggle("AutoRobot", function(t)
    UI.AutoRobot = t
    spawn(function()
        while UI.AutoRobot do
            pcall(function()
                local robots = MyPlot.Tycoon.Robots:GetChildren()
                local num_robots = #robots
                local robot_index = 1
                for i, robot in ipairs(robots) do
                    local target_parts = GetRocks()
                    local num_targets = #target_parts
                    robot:SetAttribute("CanMine", true)
                    robot:SetAttribute("Power", 1e+16)
                    robot:SetAttribute("Speed", 100)
                    robot.Backpack:SetAttribute("ItemLimit", 1e+16)

                    if num_robots < num_targets then
                        robot_index = math.random(1, num_targets)
                    else
                        robot_index = i
                    end

                    local targetPart = target_parts[robot_index]

                    robot.PrimaryPart.CFrame = targetPart.CFrame
                    firetouchinterest(robot.DrillHitbox, targetPart, 0)
                    firetouchinterest(robot.DrillHitbox, targetPart, 1)
                    local args = {
                        [1] = robot,
                        [2] = targetPart.Parent
                    }
                    game:GetService("ReplicatedStorage").Remotes.robotMineAction:FireServer(unpack(args))

                    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Input, 0)
                    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Input, 1)
                    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Output, 0)
                    firetouchinterest(robot.DrillHitbox, MyPlot.Tycoon.Unloader.Output, 1)
                    robot_index = robot_index + 1
                end
            end)
            task.wait()
        end
    end)
end)
AutoRobotToggle:Set(UI.AutoRobot)

-- AutoFactory Toggle
-- local AutoFactoryToggle = FarmSection:Toggle("AutoFactory", function(t)
--     UI.AutoFactory = t
--     spawn(function()
--         while UI.AutoFactory do
--             if UI.NextFactory then
--                 FactoryInstant()
--             end
--             task.wait()
--         end
--     end)
-- end)
-- AutoFactoryToggle:Set(UI.AutoFactory)

-- AutoWalk
local AutoWalkToggle = FarmSection:Toggle("AutoWalk", function(t)
    UI.AutoWalk = t
    lp.Data.AFKData.Enabled.Value = UI.AutoWalk
    spawn(function()
        while UI.AutoWalk do
            pcall(function()
                lp.Data.AFKData.Enabled.Value = UI.AutoWalk
            end)
            task.wait()
        end
    end)
end)
AutoWalkToggle:Set(UI.AutoWalk)

-- AutoDrop Toggle
local AutoDropToggle = FarmSection:Toggle("AutoDrop", function(t)
    UI.AutoDrop = t
    spawn(function()
        while UI.AutoDrop do
            MyPlot.Tycoon.Unloader.Input.touched:FireServer()
            task.wait()
        end
    end)
end)
AutoDropToggle:Set(UI.AutoDrop)

-- slider value
-- local CountInstantSlider = FarmSection:Slider("CountInstant", 1, 1000, UI.CountInstant, function(t)
--     UI.CountInstant = t
-- end)
-- CountInstantSlider:Set(UI.CountInstant)

-- AutoFactoryInstant
local AutoFactoryInstantToggle = FarmSection:Toggle("AutoFactoryInstant", function(t)
    UI.AutoFactoryInstant = t
    spawn(function()
        while UI.AutoFactoryInstant do
            pcall(function()
                FactoryInstant()
            end)
            task.wait(2)
        end
    end)
end)
AutoFactoryInstantToggle:Set(UI.AutoFactoryInstant)

-- AutoCollect
local AutoCollectToggle = FarmSection:Toggle("AutoCollect Ores", function(t)
    UI.AutoCollectOre = t
    spawn(function()
        while UI.AutoCollectOre do
            for i, v in pairs(workspace.LocalOreLoot:GetChildren()) do
                Collect(v)
            end
            task.wait()
        end
    end)
end)
AutoCollectToggle:Set(UI.AutoCollectOre)

-- AutoCollectMoney
local AutoCollectMoneyToggle = FarmSection:Toggle("AutoCollect Money", function(t)
    UI.AutoCollectMoney = t
    spawn(function()
        while UI.AutoCollectMoney do
            MyPlot.Tycoon.MoneyCollector.Input.touched:FireServer()
            task.wait()
        end
    end)
end)
AutoCollectMoneyToggle:Set(UI.AutoCollectMoney)

-- AutoRebirth
local AutoRebirthToggle = FarmSection:Toggle("AutoRebirth", function(t)
    UI.AutoRebirth = t
    spawn(function()
        while UI.AutoRebirth do
            wait()
            if MyPlot.RebirthBoard.RebirthBoard.Display.Content.Upgrades.Purchase.ImageColor3 ==
                Color3.fromRGB(66, 224, 255) then
                game:GetService("ReplicatedStorage").Remotes.rebirth:FireServer()
            end
        end
    end)
end)
AutoRebirthToggle:Set(UI.AutoRebirth)

-- UpgradeSection
-- Upgrade lp Pickaxe Damage
local UpgradePickaxeDamage = UpgradeSection:Toggle("Pickaxe Damage", function(t)
    UI.UpgradePickaxeDamage = t
    spawn(function()
        while UI.UpgradePickaxeDamage do
            wait()
            if CheckButtonBuy(MyPlot.UpgradeBoard.UpgradesBoard.Screen.Pickaxe.Purchase) then
                game:GetService("ReplicatedStorage").Remotes.buyPlayerUpgrade:InvokeServer("Pickaxe")
            end
        end
    end)
end)
UpgradePickaxeDamage:Set(UI.UpgradePickaxeDamage)

-- Upgrade robot Pickaxe Damage
local UpgradeRobotPickaxeDamage = UpgradeSection:Toggle("Robot Pickaxe Damage", function(t)
    UI.UpgradeRobotPickaxeDamage = t
    spawn(function()
        while UI.UpgradeRobotPickaxeDamage do
            wait()
            if CheckButtonBuy(lp.PlayerGui.MainGui.RobotUpgrades.Menu.Content.Contents.Damage.White.About.Data.Checkout
                    .BuyButton) then
                game:GetService("ReplicatedStorage").Remotes.buyRobotUpgrade:InvokeServer("Damage")
            end
        end
    end)
end)
UpgradeRobotPickaxeDamage:Set(UI.UpgradeRobotPickaxeDamage)

-- Upgrade robot Backpack
local UpgradeRobotBackpack = UpgradeSection:Toggle("Robot Backpack", function(t)
    UI.UpgradeRobotBackpack = t
    spawn(function()
        while UI.UpgradeRobotBackpack do
            wait()
            if CheckButtonBuy(lp.PlayerGui.MainGui.RobotUpgrades.Menu.Content.Contents.Backpack.White.About.Data
                    .Checkout.BuyButton) then
                game:GetService("ReplicatedStorage").Remotes.buyRobotUpgrade:InvokeServer("Backpack")
            end
        end
    end)
end)
UpgradeRobotBackpack:Set(UI.UpgradeRobotBackpack)

-- Upgrade Tycoon
local UpgradeTycoon = UpgradeSection:Toggle("Upgrade Tycoon", function(t)
    UI.UpgradeTycoon = t
    spawn(function()
        while UI.UpgradeTycoon do
            wait()
            local modelButton = MyPlot.Tycoon.Upgrades:FindFirstChildWhichIsA("Model")
            if modelButton then
                local buttonPrice = modelButton.Price.Value
                if buttonPrice <= lp.Data.Cash.Value then
                    firetouchinterest(lp.Character.HumanoidRootPart, modelButton.Button, 0)
                end
            end
        end
    end)
end)
UpgradeTycoon:Set(UI.UpgradeTycoon)
-- Mics
-- Toggle "Unlock Gamepasses"
local UnlockGamePasses = MicsSection:Toggle("Unlock All Game Passes", function(t)
    UI.UnlockGamePasses = t
    for i, v in pairs(game:GetService("Players").LocalPlayer.Data.GamePasses:GetChildren()) do
        v.Value = UI.UnlockGamePasses
    end
    for i, v in pairs(game:GetService("Players").LocalPlayer.Data.GamePassesRobux:GetChildren()) do
        v.Value = UI.UnlockGamePasses
    end
end)
UnlockGamePasses:Set(UI.UnlockGamePasses);

-- AutoFarm Toggle
local AutoRubyFusion = MicsSection:Toggle("AutoRubyFusion", function(t)
    UI.AutoRubyFusion = t
    spawn(function()
        while UI.AutoRubyFusion do
            RubyFusion()
            wait()
        end
    end)
end)
AutoRubyFusion:Set(UI.AutoRubyFusion)
