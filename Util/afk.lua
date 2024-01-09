local Players = game:GetService("Players")
local Player = Players.LocalPlayer


repeat wait() until game:IsLoaded() wait()
Player.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)