repeat
    wait()
until game:IsLoaded()
wait()

pcall(function()
    local urlRaw = ""
    loadstring(game:HttpGet(urlRaw))()
end)

wait()
repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')

local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
lp.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
po.ChildAdded:connect(function(a)
    if a.Name == 'ErrorPrompt' then
        repeat
            ts:Teleport(game.PlaceId)
            wait(2)
        until false
    end
end)