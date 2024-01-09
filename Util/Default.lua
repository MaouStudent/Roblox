local cloneref = cloneref or function(obj) return obj end
local Players = cloneref(game:GetService("Players"))
local lp = cloneref(Players.LocalPlayer)
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Workspace = cloneref(game:GetService("Workspace"))

local function IsValidMember(obj, target)
    return obj:IsDescendantOf(target or game)
end

local function IsInValidMember(obj)
    return obj:IsDescendantOf(game)
end

local function touchPart(from, target)
    if from == nil or target == nil then
        firetouchinterest(lp.Character.PrimaryPart, from, 0)
        firetouchinterest(lp.Character.PrimaryPart, from, 1)
    else
        firetouchinterest(from, target, 0)
        firetouchinterest(from, target, 1)
    end
end

local function getDistance(pos)
    return (pos - lp.Character.PrimaryPart.Position).Magnitude
end