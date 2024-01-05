local cloneref = cloneref or function(obj) return obj end
local Players = cloneref(game:GetService("Players"))
local lp = cloneref(Players.LocalPlayer)
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

-- Checks if an object is a descendant of a target object
local function IsValidMember(obj, target)
    return obj:IsDescendantOf(target or game)
end

-- Checks if an object is a descendant of the game
local function IsInValidMember(obj)
    return obj:IsDescendantOf(game)
end

-- Touches a part in the game
local function touchPart(from, target)
    if pcall(function() return from == nil or target == nil end) then
        firetouchinterest(lp.Character.PrimaryPart, from, 0)
        firetouchinterest(lp.Character.PrimaryPart, from, 1)
    else
        firetouchinterest(from, target, 0)
        firetouchinterest(from, target, 1)
    end
end

-- Gets the plot object based on the player's attribute
local function GetPlot()
    local plotName = lp:GetAttribute("plot_name")
    return workspace.Plots[plotName]
end

-- Performs a click action in the game
local function Click()
    local args = {
        [1] = "click"
    }

    ReplicatedStorage.Assets.Events.RemoteFunction:InvokeServer(unpack(args))
end

-- Combines two towers by invoking a remote function
local function Combine(tow1, tow2)
    local args = {
        [1] = "combine tower",
        [2] = tow1,
        [3] = tow2
    }

    ReplicatedStorage.Assets.Events.RemoteFunction:InvokeServer(unpack(args))
end

-- Gets a list of towers from the player's plot and sorts them by level
local function GetTowers()
    local MyPlot = GetPlot()
    local towers = {}
    for index, num in pairs(MyPlot.Spaces:GetChildren()) do
        if num:FindFirstChildWhichIsA("Model") then
            local tower = num:FindFirstChildWhichIsA("Model")
            local lvl = tower:GetAttribute("tower")
            table.insert(
                towers,
                {
                    ["Tower"] = tower,
                    ["Level"] = lvl
                }
            )
        end
    end

    -- Sorts the towers by level in ascending order
    table.sort(
        towers,
        function(a, b)
            return a.Level < b.Level
        end
    )

    return towers
end

-- Combines towers with the same level
local function Combies()
    local towers = GetTowers()

    for i = 1, #towers do
        for j = 1, #towers do
            if i ~= j then
                if towers[i].Level == towers[j].Level then
                    Combine(towers[i].Tower, towers[j].Tower)
                    task.wait()
                end
            end
        end
    end
end

-- Performs upgrades by invoking remote functions
local function Upgrades()
    local upgradeList = ReplicatedStorage.Game.Upgrades:GetChildren()
    for i, upgrade in pairs(upgradeList) do
        local args = {
            [1] = "upgrade",
            [2] = upgrade.Name
        }

        ReplicatedStorage.Assets.Events.RemoteFunction:InvokeServer(unpack(args))
    end
end

-- Main loop that continuously performs click actions and yields
local function main()
    while true do
        for i = 1, 10 do
            pcall(Click)
        end
        coroutine.yield()
    end
end

local co = coroutine.create(main)

while true do
    coroutine.resume(co)
    pcall(Upgrades)
    pcall(Combies)
    task.wait()
end