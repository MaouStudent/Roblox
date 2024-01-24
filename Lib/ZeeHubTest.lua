local load = loadstring(game:HttpGet("https://raw.githubusercontent.com/NeaPchX2/FreeUI/main/ZeeHub"))()
local library = load:XoxHi()

local homeTab = library:CreateTab("Home")
local homeSec1 = homeTab:CreateSection({
    Name = "TEST",
    Side = 1
})
local homeSec2 = homeTab:CreateSection({
    Name = "TEST",
    Side = 2
})

homeSec1:AddToggle({
    Name = "Toggle TEST",
    Flag = "ToggleTEST",
    Mode = false,
    Value = false,
    Callback = function(bool)
        print("Toggle : " + bool)
    end
})

homeSec1:AddLabel({
    Name = "Label TEST",
    Flag = "Label1"
})

homeSec1:AddButton({
    Name = "Button TEST",
    Callback = function()
        print("TEST BUTTON")
    end
})

homeSec1:AddSlider({
    Name = "Slider TEST No Floor",
    Flag = "SliderTESTNF",
    floor = false,
    Min = 0,
    Max = 100,
    Value = 1,
    Format = function(value)
        print("Slider " + value)
    end

})

homeSec2:AddDropdown({
    Name = "Dropdown TEST",
    List = {1, 2, 3, 4, 5},
    Flag = "DropdownTEST",
    Value = 1,
    Callback = function(value)
        print("Dropdown " + value)
    end
})

homeSec2:AddMultiDropdown({
    Name = "Dropdown Multi TEST",
    Flag = "DropdownMTEST",
    List = {"TEST1", "TEST2"},
    Callback = function(value)
        print("Dropdown Multi " + value)
    end
})

local automaticTab = library:CreateTab("Automatic")
local statsTab = library:CreateTab("Stats")
local teleportTab = library:CreateTab("Teleport")
local shopTab = library:CreateTab("Shop")
local miscTab = library:CreateTab("Misc")

