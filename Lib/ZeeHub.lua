
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local LWADGAW = false
function dragify(Frame, object)
    dragToggle = nil
    dragSpeed = .25
    dragInput = nil
    dragStart = nil
    dragPos = nil

    function updateInput(input)
        Delta = input.Position - dragStart
        Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseButton1 or
                    input.UserInputType == Enum.UserInputType.Touch)
            then
                dragToggle = true
                dragStart = input.Position
                startPos = object.Position
                input.Changed:Connect(
                    function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end
                )
            end
        end
    )

    Frame.InputChanged:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch)
            then
                dragInput = input
            end
        end
    )

    game:GetService("UserInputService").InputChanged:Connect(
    function(input)
        if (input == dragInput and dragToggle) then
            updateInput(input)
        end
    end
    )
end

wait(.2)
do
    if game:WaitForChild("CoreGui"):FindFirstChild("Maou Hub") then
		game:WaitForChild("CoreGui"):FindFirstChild("Maou Hub"):Destroy()
	end
end

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
        
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=12781257228"
ImageButton.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton

local ZeeHubV001 = Instance.new("ScreenGui")
ZeeHubV001.Name = "Maou Hub"
ZeeHubV001.Parent = game:WaitForChild("CoreGui")
ZeeHubV001.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

library = {}
function library:XoxHi()
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local MainTop = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TextName = Instance.new("TextLabel")
    local TextHub = Instance.new("TextLabel")
    local Top = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local TabContainer = Instance.new("ScrollingFrame")
    local UIPadding = Instance.new("UIPadding")
    local UIListLayout = Instance.new("UIListLayout")

    Main.Name = "Main"
    Main.Parent = ZeeHubV001
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
    Main.BorderColor3 = Color3.new(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    UICorner.Parent = Main

    Main:TweenSize(UDim2.new(0,550,0,365),"Out","Back",.3,true)

    OpenUI = true
    UserInputService.InputBegan:Connect(function(input)
		pcall(function()
			if input.KeyCode == Enum.KeyCode.RightControl then
				if OpenUI == true then
	                OpenUI = false
	                Main.ClipsDescendants = true
					Main:TweenSize(UDim2.new(0,0,0,0),"Out","Back",.3,true)
				else
					OpenUI = true
	                Main:TweenSize(UDim2.new(0,550,0,365),"Out","Back",.3,true)
				end
			end
		end)
	end)

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Thickness = 3
    UIStroke.Parent = Main
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.LineJoinMode = Enum.LineJoinMode.Round
    UIStroke.Color = Color3.fromRGB(19, 19, 19)
    UIStroke.Transparency = .95

    MainTop.Name = "MainTop"
    MainTop.Parent = Main
    MainTop.BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
    MainTop.BorderColor3 = Color3.new(0, 0, 0)
    MainTop.BorderSizePixel = 0
    MainTop.Position = UDim2.new(0.0188253503, 0, 0.0299999919, 0)
    MainTop.Size = UDim2.new(0, 530, 0, 29)

    dragify(MainTop,Main)

    UICorner_2.Parent = MainTop

    TextName.Name = "TextName"
    TextName.Parent = MainTop
    TextName.BackgroundColor3 = Color3.new(1, 1, 1)
    TextName.BackgroundTransparency = 1
    TextName.BorderColor3 = Color3.new(0, 0, 0)
    TextName.BorderSizePixel = 0
    TextName.Position = UDim2.new(0.039978683, 0, 0.150000736, 0)
    TextName.Size = UDim2.new(0, 90, 0, 20)
    TextName.Font = Enum.Font.FredokaOne
    TextName.Text = "Maou"
    TextName.TextColor3 = Color3.new(1, 1, 1)
    TextName.TextSize = 16
    TextName.TextXAlignment = Enum.TextXAlignment.Left

    TextHub.Name = "TextHub"
    TextHub.Parent = MainTop
    TextHub.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
    TextHub.BackgroundTransparency = 1
    TextHub.BorderColor3 = Color3.new(0, 0, 0)
    TextHub.BorderSizePixel = 0
    TextHub.Position = UDim2.new(0.0923681557, 0, 0.218966261, 0)
    TextHub.Size = UDim2.new(0, 90, 0, 16)
    TextHub.Font = Enum.Font.FredokaOne
    TextHub.Text = "Hub | Free For Me"
    TextHub.TextColor3 = Color3.new(1, 0, 0)
    TextHub.TextSize = 16
    TextHub.TextXAlignment = Enum.TextXAlignment.Left

    Top.Name = "Top"
    Top.Parent = Main
    Top.AnchorPoint = Vector2.new(0.5, 0.5)
    Top.BackgroundColor3 = Color3.new(0.0470588, 0.0470588, 0.0470588)
    Top.BorderColor3 = Color3.new(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0.5, 0, 0.916438341, 0)
    Top.Size = UDim2.new(0, 436, 0, 44)

    UICorner_3.Parent = Top

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Top
    TabContainer.Active = true
    TabContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    TabContainer.BackgroundColor3 = Color3.new(1, 1, 1)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderColor3 = Color3.new(0, 0, 0)
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    TabContainer.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.ScrollBarThickness = 2

    UIPadding.Parent = TabContainer

    UIListLayout.Parent = TabContainer
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0, 5)

    local Bottom = Instance.new("Frame")
    local Player = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local TextButton_2 = Instance.new("TextButton")
    local ImageLabel_2 = Instance.new("ImageLabel")
    local Setting = Instance.new("Frame")
    local UICorner_6 = Instance.new("UICorner")
    local TextButton_3 = Instance.new("TextButton")
    local ImageLabel_3 = Instance.new("ImageLabel")
    Bottom.Name = "Bottom"
    Bottom.Parent = Main
    Bottom.BackgroundColor3 = Color3.new(1, 1, 1)
    Bottom.BackgroundTransparency = 1
    Bottom.BorderColor3 = Color3.new(0, 0, 0)
    Bottom.BorderSizePixel = 0
    Bottom.Position = UDim2.new(0.0181818176, 0, 0.1369863, 0)
    Bottom.Size = UDim2.new(0, 530, 0, 250)

    Player.Name = "Player"
    Player.Parent = Main
    Player.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
    Player.BorderColor3 = Color3.new(0, 0, 0)
    Player.BorderSizePixel = 0
    Player.Position = UDim2.new(0.0179560985, 0, 0.854794502, 0)
    Player.Size = UDim2.new(0, 43, 0, 42)

    UICorner_5.Parent = Player
    UICorner_5.CornerRadius = UDim.new(0, 100)

    TextButton_2.Parent = Player
    TextButton_2.BackgroundColor3 = Color3.new(1, 1, 1)
    TextButton_2.BackgroundTransparency = 41
    TextButton_2.BorderColor3 = Color3.new(0, 0, 0)
    TextButton_2.BorderSizePixel = 0
    TextButton_2.Size = UDim2.new(1, 0, 1, 0)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = ""
    TextButton_2.TextColor3 = Color3.new(0, 0, 0)
    TextButton_2.TextSize = 14

    ImageLabel_2.Parent = Player
    ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
    ImageLabel_2.BackgroundTransparency = 1
    ImageLabel_2.BorderColor3 = Color3.new(0, 0, 0)
    ImageLabel_2.BorderSizePixel = 0
    ImageLabel_2.Position = UDim2.new(0.499999434, 0, 0.523809373, 0)
    ImageLabel_2.Size = UDim2.new(0.850000024, 0, 0.850000024, 0)
    ImageLabel_2.Image = "rbxassetid://15755672846"

    Setting.Name = "Setting"
    Setting.Parent = Main
    Setting.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
    Setting.BorderColor3 = Color3.new(0, 0, 0)
    Setting.BorderSizePixel = 0
    Setting.Position = UDim2.new(0.903410673, 0, 0.85753423, 0)
    Setting.Size = UDim2.new(0, 43, 0, 42)

    UICorner_6.Parent = Setting
    UICorner_6.CornerRadius = UDim.new(0, 100)

    TextButton_3.Parent = Setting
    TextButton_3.BackgroundColor3 = Color3.new(1, 1, 1)
    TextButton_3.BackgroundTransparency = 41
    TextButton_3.BorderColor3 = Color3.new(0, 0, 0)
    TextButton_3.BorderSizePixel = 0
    TextButton_3.Size = UDim2.new(1, 0, 1, 0)
    TextButton_3.Font = Enum.Font.SourceSans
    TextButton_3.Text = ""
    TextButton_3.TextColor3 = Color3.new(0, 0, 0)
    TextButton_3.TextSize = 14

    ImageLabel_3.Parent = Setting
    ImageLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
    ImageLabel_3.BackgroundTransparency = 1
    ImageLabel_3.BorderColor3 = Color3.new(0, 0, 0)
    ImageLabel_3.BorderSizePixel = 0
    ImageLabel_3.Position = UDim2.new(0.499999434, 0, 0.476190329, 0)
    ImageLabel_3.Size = UDim2.new(0.850000024, 0, 0.850000024, 0)
    ImageLabel_3.Image = "rbxassetid://6034509993"

    local IconTap = {
        ["Home"] = "15169955786",
		["Automatic"] = "15906670773",
        ["Stats"] = "15756130144",
        ["Teleport"] = "6035190846",
        ["Shop"] = "6031265976",
        ["Misc"] = "6034509993",
    }

    local tabs = {}
	TapOpen = false
	function tabs:CreateTab(Name)
        local Tap = Instance.new("Frame")
        local UICorner_4 = Instance.new("UICorner")
        local TextButton = Instance.new("TextButton")
        local ImageLabel = Instance.new("ImageLabel")

        Tap.Name = "Tap"
        Tap.Parent = TabContainer
        Tap.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
        Tap.BorderColor3 = Color3.new(0, 0, 0)
        Tap.BorderSizePixel = 0
        Tap.Position = UDim2.new(0.454319775, 0, 0, 0)
        Tap.Size = UDim2.new(0, 43, 0, 42)

        UICorner_4.Parent = Tap
        UICorner_4.CornerRadius = UDim.new(0, 100)

        TextButton.Parent = Tap
        TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
        TextButton.BackgroundTransparency = 41
        TextButton.BorderColor3 = Color3.new(0, 0, 0)
        TextButton.BorderSizePixel = 0
        TextButton.Size = UDim2.new(1, 0, 1, 0)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.Text = ""
        TextButton.TextColor3 = Color3.new(0, 0, 0)
        TextButton.TextSize = 14

        ImageLabel.Parent = Tap
        ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        ImageLabel.Size = UDim2.new(0.850000024, 0, 0.850000024, 0)
        ImageLabel.Image = "rbxassetid://"..IconTap[Name]
        ImageLabel.ImageColor3 = Color3.fromRGB(155, 155, 155)
        ImageLabel.ImageTransparency = .5

        local Page = Instance.new("ScrollingFrame")
        local Left = Instance.new("ScrollingFrame")
        local Right = Instance.new("ScrollingFrame")
        local UIListLayout_5 = Instance.new("UIListLayout")
        local UIPadding_5 = Instance.new("UIPadding")

        Page.Name = "Page"
        Page.Parent = Bottom
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1
        Page.Size = UDim2.new(0, 530, 0, 250)
        Page.ScrollBarThickness = 0
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Position = UDim2.new(0, 550, 0, 0)

        Left.Name = "Left"
        Left.Parent = Page
        Left.Active = true
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BackgroundTransparency = 1
        Left.Size = UDim2.new(0, 250, 0, 250)
        Left.ScrollBarThickness = 0
        Left.CanvasSize = UDim2.new(0, 0, 0, 0)

        Right.Name = "Right"
        Right.Parent = Page
        Right.Active = true
        Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Right.BackgroundTransparency = 1
        Right.Size = UDim2.new(0, 250, 0, 250)
        Right.ScrollBarThickness = 0
        Right.CanvasSize = UDim2.new(0, 0, 0, 0)

        local LeftList = Instance.new("UIListLayout")
        local RightList = Instance.new("UIListLayout")

        LeftList.Parent = Left
        LeftList.SortOrder = Enum.SortOrder.LayoutOrder
        LeftList.Padding = UDim.new(0, 5)

        RightList.Parent = Right
        RightList.SortOrder = Enum.SortOrder.LayoutOrder
        RightList.Padding = UDim.new(0, 5)

        UIListLayout_5.Parent = Page
        UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_5.Padding = UDim.new(0, 5)

        UIPadding_5.Parent = Page
        UIPadding_5.PaddingLeft = UDim.new(0, 10)

		if TapOpen == false then
			TapOpen = true
			Page.Visible = true
			Page:TweenPosition(UDim2.new(0, 0, 0, 0),"Out","Back",.5,true)
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.ImageTransparency = 0
		end

        TextButton.MouseButton1Click:Connect(function()
            for _, x in next, TabContainer:GetChildren() do
                if x.Name == "Tap" then
                    x.ImageLabel.ImageColor3 = Color3.fromRGB(155, 155, 155)
                    x.ImageLabel.ImageTransparency = .5
                    for index, y in next, Bottom:GetChildren() do
                        if y.Name == "Page" then
                            y:TweenPosition(UDim2.new(0, 550, 0, 0),"Out","Back",.5,true)
                        end
                    end
                end
            end
            ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.ImageTransparency = 0
            Page:TweenPosition(UDim2.new(0, 0, 0, 0),"Out","Back",.5,true)
        end)

        local function GetType(value)
            if value == 1 or value == "Left" then
                return Left
            elseif value == 2 or value == "Right" then
                return Right
            else
                return Left
            end
        end

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                Right.CanvasSize = UDim2.new(0,0,0,RightList.AbsoluteContentSize.Y + 5)
                Left.CanvasSize = UDim2.new(0,0,0,LeftList.AbsoluteContentSize.Y + 5)
            end)
        end)
        sections = {}
        function sections:CreateSection(options)
            local Name = options.Name
            local side = options.Side

            if side == nil then
                return Left
            end

            local Section = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Top_2 = Instance.new("Frame")
            local Line = Instance.new("Frame")
            local Sectionname = Instance.new("TextLabel")
            local SectionContainer = Instance.new("Frame")
            local SectionContainer_2 = Instance.new("Frame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UIPadding_2 = Instance.new("UIPadding")

            Section.Name = "Section"
            Section.Parent = GetType(side)
            Section.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Section.ClipsDescendants = true
            Section.Transparency = 0.9
            Section.Size = UDim2.new(1, 0, 0, 120)

            local UICorner_Section = Instance.new("UICorner")
            UICorner_Section.Parent = Section

            Top_2.Name = "Top"
            Top_2.Parent = Section
            Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_2.BackgroundTransparency = 1.000
            Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Top_2.Size = UDim2.new(1, 0, 0, 31)


            local Sectionname = Instance.new("TextLabel")
            Sectionname.Name = "Sectionname"
            Sectionname.Parent = Top_2
            Sectionname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sectionname.BackgroundTransparency = 1.000
            Sectionname.Position = UDim2.new(0.0591227226, 0, 0.0222222228, 0)
            Sectionname.Size = UDim2.new(0, 224, 0, 24)
            Sectionname.Font = Enum.Font.GothamBold
            Sectionname.Text = Name
            Sectionname.TextColor3 = Color3.fromRGB(255, 255, 255)
            Sectionname.TextSize = 10.000
            Sectionname.ZIndex = -1
            Sectionname.TextTransparency = 0
            Sectionname.TextXAlignment = Enum.TextXAlignment.Left

            SectionContainer.Name = "SectionContainer"
            SectionContainer.Parent = Top_2
            SectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContainer.BackgroundTransparency = 1.000
            SectionContainer.BorderSizePixel = 0
            SectionContainer.Position = UDim2.new(0, 0, 0.796416223, 0)
            SectionContainer.Size = UDim2.new(0, 239, 0, 300)

            SectionContainer_2.Name = "SectionContainer_2"
            SectionContainer_2.Parent = Top_2
            SectionContainer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContainer_2.BackgroundTransparency = 1.000
            SectionContainer_2.BorderSizePixel = 0
            SectionContainer_2.Position = UDim2.new(0, 0, 0.796416223, 0)
            SectionContainer_2.Size = UDim2.new(0, 239, 0, 300)

            UIListLayout_2.Parent = SectionContainer
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 10)

            UIPadding_2.Parent = SectionContainer
            UIPadding_2.PaddingLeft = UDim.new(0, 5)

            UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section.Size = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 30)
            end)

            local functionitem = {}

            function functionitem:AddToggle(options)
                local Name = options.Name or ""
                local Flag = options.Flag or ""
                local default = options.Value
                local Mode = options.Mode or false
                local callback = options.Callback or function() end

                if Mode == false then
                    local ToglFunc = {}
                    local Tgo = default or false 
                    local MainToggle = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local Text = Instance.new("TextLabel")
                    local MainToggle_2 = Instance.new("ImageLabel")
                    local UICorner_2 = Instance.new("UICorner")
                    local MainToggle_3 = Instance.new("ImageLabel")
                    local UICorner_3 = Instance.new("UICorner")
                    local TextButton = Instance.new("TextButton")

                    MainToggle.Name = Name
                    MainToggle.Parent = SectionContainer
                    MainToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    MainToggle.BackgroundTransparency = 1
                    MainToggle.BorderSizePixel = 0
                    MainToggle.ClipsDescendants = true
                    MainToggle.Size = UDim2.new(1, 0, 0, 45)
                    MainToggle.ZIndex = 16

                    local UIStroke96 = Instance.new("UIStroke")
                    UIStroke96.Thickness = 0.8
                    UIStroke96.Parent = MainToggle
                    UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                    UIStroke96.Color = Color3.fromRGB(10, 11, 12)
                    UIStroke96.Transparency = 0.3

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = MainToggle

                    Text.Name = "Text"
                    Text.Parent = MainToggle
                    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Text.BackgroundTransparency = 1.000
                    Text.Position = UDim2.new(0, 45, 0, 16)
                    Text.Size = UDim2.new(0, 100, 0, 12)
                    Text.ZIndex = 16
                    Text.Font = Enum.Font.GothamBold
                    Text.Text = Name
                    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Text.TextSize = 14.000
                    Text.TextTransparency = 0.2
                    Text.TextXAlignment = Enum.TextXAlignment.Left

                    MainToggle_3.Name = "MainToggle"
                    MainToggle_3.Parent = MainToggle
                    MainToggle_3.AnchorPoint = Vector2.new(0.5, 0.5)
                    MainToggle_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    MainToggle_3.ClipsDescendants = true
                    MainToggle_3.Position = UDim2.new(0, 20, 0.5, 0)
                    MainToggle_3.Size = UDim2.new(0, 25, 0, 25)
                    MainToggle_3.ZIndex = 16
                    MainToggle_3.Image = "http://www.roblox.com/asset/?id="
                    MainToggle_3.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    MainToggle_3.Visible = true

                    UICorner_3.CornerRadius = UDim.new(0, 5)
                    UICorner_3.Parent = MainToggle_3

                    TextButton.Name = ""
                    TextButton.Parent = MainToggle
                    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.BackgroundTransparency = 1.000
                    TextButton.BorderSizePixel = 0
                    TextButton.Position = UDim2.new(0, 0, 0, 0)
                    TextButton.Size = UDim2.new(0, 265, 0, 35)
                    TextButton.ZIndex = 16
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.Gotham
                    TextButton.Text = ""
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000

                    if default == true then
                        pcall(callback,true)
                        Tgo = true
                        MainToggle_3.BackgroundColor3 = Color3.fromRGB(113, 255, 78)
                        MainToggle_3:TweenSize(UDim2.new(0, 28, 0, 28),"In","Quad",0.2,true)
                        MainToggle_3.Image = "http://www.roblox.com/asset/?id=6023426926"
                        UICorner_3.CornerRadius = UDim.new(0, 100)
                    end

                    TextButton.MouseEnter:Connect(function()
                        if Tgo == false then
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            MainToggle_3.Image = "http://www.roblox.com/asset/?id=00"
                            MainToggle_3:TweenSize(UDim2.new(0, 28, 0, 28),"In","Quad",0.2,true)
                            UICorner_3.CornerRadius = UDim.new(0, 5)
                        else
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(113, 255, 78)
                            MainToggle_3:TweenSize(UDim2.new(0, 28, 0, 28),"In","Quad",0.2,true)
                            MainToggle_3.Image = "http://www.roblox.com/asset/?id=6023426926"
                            UICorner_3.CornerRadius = UDim.new(0, 100)
                        end
                    end)

                    TextButton.MouseLeave:Connect(function()
                        if Tgo == false then
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            MainToggle_3.Image = "http://www.roblox.com/asset/?id=00"
                            MainToggle_3:TweenSize(UDim2.new(0, 25, 0, 25),"In","Quad",0.2,true)
                            UICorner_3.CornerRadius = UDim.new(0, 5)
                        else
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(113, 255, 78)
                            MainToggle_3:TweenSize(UDim2.new(0, 25, 0, 25),"In","Quad",0.2,true)
                            MainToggle_3.Image = "http://www.roblox.com/asset/?id=6023426926"
                            UICorner_3.CornerRadius = UDim.new(0, 100)
                        end
                    end)

                    TextButton.MouseButton1Click:Connect(function()
                        local SoundClick = Instance.new("Sound")
                        SoundClick.Name = "SoundEffect"
                        SoundClick.SoundId = "rbxassetid://130785805"
                        SoundClick.Volume = 1
                        SoundClick.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                        SoundClick:Play()
                        if Tgo == false then
                            Tgo = true
                            pcall(callback,true)
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(113, 255, 78)
                            MainToggle_3.Image = "http://www.roblox.com/asset/?id=6023426926"
                            UICorner_3.CornerRadius = UDim.new(0, 100)
                            MainToggle_3:TweenSize(UDim2.new(0, 29, 0, 29),"In","Quad",0.2,true)
                            wait(0.2)
                            MainToggle_3:TweenSize(UDim2.new(0, 25, 0, 25),"In","Quad",0.2,true)
                        else
                            Tgo = false
                            pcall(callback,false)
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                            MainToggle_3.Image = "http://www.roblox.com/asset/?id=00"
                            MainToggle_3:TweenSize(UDim2.new(0, 29, 0, 29),"In","Quad",0.2,true)
                            UICorner_3.CornerRadius = UDim.new(0, 5)
                            wait(0.2)
                            MainToggle_3:TweenSize(UDim2.new(0, 25, 0, 25),"In","Quad",0.2,true)
                        end
                        wait(0.1)
                        SoundClick:Destroy()
                    end)
                else
                    local ToglFunc = {}
                    local Tgo = default or false
                    local MainToggle = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local Text = Instance.new("TextLabel")
                    local MainToggle_2 = Instance.new("ImageLabel")
                    local UICorner_2 = Instance.new("UICorner")
                    local MainToggle_3 = Instance.new("ImageLabel")
                    local UICorner_3 = Instance.new("UICorner")
                    local TextButton = Instance.new("TextButton")

                    MainToggle.Name = "MainToggle"
                    MainToggle.Parent = SectionContainer
                    MainToggle.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                    MainToggle.BackgroundTransparency = 0.2
                    MainToggle.BorderSizePixel = 0
                    MainToggle.ClipsDescendants = true
                    MainToggle.Size = UDim2.new(1, 0, 0, 35)
                    MainToggle.ZIndex = 16

                    local UIStroke96 = Instance.new("UIStroke")
                    UIStroke96.Thickness = 0.8
                    UIStroke96.Parent = MainToggle
                    UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                    UIStroke96.Color = Color3.fromRGB(10, 11, 12)
                    UIStroke96.Transparency = 0.3

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = MainToggle

                    Text.Name = "Text"
                    Text.Parent = MainToggle
                    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Text.BackgroundTransparency = 1.000
                    Text.Position = UDim2.new(0, 10, 0, 10)
                    Text.Size = UDim2.new(0, 100, 0, 12)
                    Text.ZIndex = 16
                    Text.Font = Enum.Font.GothamBold
                    Text.Text = Name
                    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Text.TextSize = 14.000
                    Text.TextTransparency = 0
                    Text.TextXAlignment = Enum.TextXAlignment.Left

                    MainToggle_2.Name = "MainToggle"
                    MainToggle_2.Parent = MainToggle
                    MainToggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
                    MainToggle_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                    MainToggle_2.ClipsDescendants = true
                    MainToggle_2.Position = UDim2.new(0, 200, 0.5, 0)
                    MainToggle_2.Size = UDim2.new(0, 35, 0, 5)
                    MainToggle_2.ZIndex = 16

                    UICorner_2.CornerRadius = UDim.new(0, 3)
                    UICorner_2.Parent = MainToggle_2

                    MainToggle_3.Name = "MainToggle"
                    MainToggle_3.Parent = MainToggle
                    MainToggle_3.AnchorPoint = Vector2.new(0.5, 0.5)
                    MainToggle_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    MainToggle_3.ClipsDescendants = true
                    MainToggle_3.Position = UDim2.new(0, 185, 0.5, 0)
                    MainToggle_3.Size = UDim2.new(0, 15, 0, 15)
                    MainToggle_3.ZIndex = 16
                    MainToggle_3.Image = "http://www.roblox.com/asset/?id="
                    MainToggle_3.ImageColor3 = Color3.fromRGB(255, 0, 0)
                    MainToggle_3.Visible = true
                    UICorner_3.CornerRadius = UDim.new(0, 10)
                    UICorner_3.Parent = MainToggle_3

                    TextButton.Name = ""
                    TextButton.Parent = MainToggle
                    TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    TextButton.BackgroundTransparency = 1.000
                    TextButton.BorderSizePixel = 0
                    TextButton.Size = UDim2.new(1, 0, 1, 0)
                    TextButton.ZIndex = 16
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.Gotham
                    TextButton.Text = ""
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000

                    TextButton.MouseButton1Click:Connect(function()
                        if Tgo == false then
                            Tgo = true
                            pcall(callback,true)
                            MainToggle_3:TweenPosition(UDim2.new(0, 215, 0.5, 0),"In","Quad",0.1,true)
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                        else
                            Tgo = false
                            pcall(callback,false)
                            MainToggle_3:TweenPosition(UDim2.new(0, 185, 0.5, 0),"In","Quad",0.1,true)
                            MainToggle_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end)
                    
                    if default == true then
                        Tgo = true
                        pcall(callback,true)
                        MainToggle_3:TweenPosition(UDim2.new(0, 215, 0.5, 0),"In","Quad",0.1,true)
                        MainToggle_3.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                    end
                end
            end

            function functionitem:AddLabelX(options)
                local text = options.Name
                local Flag = options.Flag
                local Mode = options.Mode
            
                local textas = {}
                local Label = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                Label.Name = text
                Label.Parent = SectionContainer
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new( 1, 0, 0, 30)

                local Label22 = Instance.new("Frame")
                Label22.Name = "Label22"
                Label22.Parent = Label
                Label22.AnchorPoint = Vector2.new(0, 0.5)
                Label22.BackgroundColor3 = _G.Color
                Label22.Position = UDim2.new(0,0,0.5,0)
                Label22.Size = UDim2.new(0, 35, 0, 1)

                local Label23 = Instance.new("Frame")
                Label23.Name = "Label23"
                Label23.Parent = Label
                Label23.AnchorPoint = Vector2.new(0, 0.5)
                Label23.BackgroundColor3 = _G.Color
                Label23.Position = UDim2.new(0,195,0.5,0)
                Label23.Size = UDim2.new(0, 35, 0, 1)

                Text.Name = "Text"
                Text.Parent = Label
                Text.AnchorPoint = Vector2.new(0.5, 0.5)
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0.5, 0, 0.5, 0)
                Text.Size = UDim2.new(0, 53, 0, 150)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = text
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 12.000
                function textas:Set(newtext)
                    Text.Text = newtext
                end
                return textas
            end

            function functionitem:AddLabel(options)
                local text = options.Name
                local Flag = options.Flag
                local Mode = options.Mode
            
                local textas = {}
                local Label = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                Label.Name = text
                Label.Parent = SectionContainer
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new( 1, 0, 0, 30)

                Text.Name = "Text"
                Text.Parent = Label
                Text.AnchorPoint = Vector2.new(0.5, 0.5)
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0.5, 0, 0.5, 0)
                Text.Size = UDim2.new(0, 53, 0, 150)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = text
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 12.000
                function textas:Set(newtext)
                    Text.Text = newtext
                end
                return textas
            end

            function functionitem:AddButton(options)
                local Name = options.Name or "Button"
                local callback = options.Callback or function() end
                local Mode = options.Mode or false

                if Mode == false then
                    local Button = Instance.new("Frame")
                    local UICorner_6 = Instance.new("UICorner")
                    local TextLabel_3 = Instance.new("TextLabel")
                    local TextButton = Instance.new("TextButton")
    
                    Button.Name = "Button"
                    Button.Parent = SectionContainer
                    Button.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                    Button.BackgroundTransparency = 0.2
                    Button.Size = UDim2.new( 1, 0, 0, 30)
                    Button.ZIndex = 16
    
                    local UIStroke96 = Instance.new("UIStroke")
                    UIStroke96.Thickness = 0.8
                    UIStroke96.Parent = Button
                    UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                    UIStroke96.Color = Color3.fromRGB(10, 11, 12)
                    UIStroke96.Transparency = 0.3

                    UICorner_6.CornerRadius = UDim.new(0, 4)
                    UICorner_6.Parent = Button
    
                    TextLabel_3.Name = "Text"
                    TextLabel_3.Parent = Button
                    TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
                    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel_3.BackgroundTransparency = 1.000
                    TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                    TextLabel_3.Size = UDim2.new(0, 100, 0, 12)
                    TextLabel_3.ZIndex = 16
                    TextLabel_3.Font = Enum.Font.GothamBold
                    TextLabel_3.Text = Name
                    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel_3.TextSize = 12.000
                    TextLabel_3.TextTransparency = 0
    
                    TextButton.Parent = Button
                    TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    TextButton.BackgroundTransparency = 1.000
                    TextButton.BorderSizePixel = 0
                    TextButton.ClipsDescendants = true
                    TextButton.Size = UDim2.new(1, 0, 1, 0)
                    TextButton.ZIndex = 16
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.Gotham
                    TextButton.Text = ""
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000
                    
                    TextButton.MouseEnter:Connect(function()
                        TweenService:Create(
                            Button,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.5}
                        ):Play()
                    end)
    
                    TextButton.MouseLeave:Connect(function()
                        TweenService:Create(
                            Button,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                    end)
    
                    TextButton.MouseButton1Click:Connect(function()
                        TextLabel_3.TextSize = 0
                        TweenService:Create(
                            TextLabel_3,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextSize = 12}
                        ):Play()
                        callback()
                    end)
                else
                    local Button = Instance.new("Frame")
                    local UICorner_6 = Instance.new("UICorner")
                    local TextLabel_3 = Instance.new("TextLabel")
                    local TextButton = Instance.new("TextButton")
    
                    Button.Name = "Button"
                    Button.Parent = SectionContainer
                    Button.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                    Button.BackgroundTransparency = 1
                    Button.Size = UDim2.new( 1, 0, 0, 30)
                    Button.ZIndex = 16
    
                    UICorner_6.CornerRadius = UDim.new(0, 4)
                    UICorner_6.Parent = Button

                    local Button2 = Instance.new("Frame")
                    local UICorner_99 = Instance.new("UICorner")
                    Button2.Name = "Button2"
                    Button2.Parent = Button
                    Button2.AnchorPoint = Vector2.new(0.5, 0.5)
                    Button2.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                    Button2.BackgroundTransparency = 0.2
                    Button2.Size = UDim2.new( 0.8, 0, 0, 30)
                    Button2.Position = UDim2.new(0.5, 0, 0.5, 0)
                    Button2.ZIndex = 16

                    local UIStroke96 = Instance.new("UIStroke")
                    UIStroke96.Thickness = 0.8
                    UIStroke96.Parent = Button2
                    UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                    UIStroke96.Color = Color3.fromRGB(10, 11, 12)
                    UIStroke96.Transparency = 0.3
                    
                    UICorner_99.CornerRadius = UDim.new(0, 4)
                    UICorner_99.Parent = Button2
    
                    TextLabel_3.Name = "Text"
                    TextLabel_3.Parent = Button2
                    TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
                    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel_3.BackgroundTransparency = 1.000
                    TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                    TextLabel_3.Size = UDim2.new(0, 100, 0, 12)
                    TextLabel_3.ZIndex = 16
                    TextLabel_3.Font = Enum.Font.GothamBold
                    TextLabel_3.Text = Name
                    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel_3.TextSize = 12.000
                    TextLabel_3.TextTransparency = 0
    
                    TextButton.Parent = Button
                    TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    TextButton.BackgroundTransparency = 1.000
                    TextButton.BorderSizePixel = 0
                    TextButton.ClipsDescendants = true
                    TextButton.Size = UDim2.new(1, 0, 1, 0)
                    TextButton.ZIndex = 16
                    TextButton.AutoButtonColor = false
                    TextButton.Font = Enum.Font.Gotham
                    TextButton.Text = ""
                    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton.TextSize = 14.000
                    
                    TextButton.MouseEnter:Connect(function()
                        TweenService:Create(
                            Button2,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.5}
                        ):Play()
                    end)
    
                    TextButton.MouseLeave:Connect(function()
                        TweenService:Create(
                            Button2,
                            TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0}
                        ):Play()
                    end)
    
                    TextButton.MouseButton1Click:Connect(function()
                        TextLabel_3.TextSize = 0
                        TweenService:Create(
                            TextLabel_3,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {TextSize = 12}
                        ):Play()
                        callback()
                    end)
                    
                end
            end

            function functionitem:AddDropdown(options)
                local text = options.Name
                local Flag = options.Flag
                local default = options.Value or ""
                local list = options.List
                local callback = options.Callback

                local Dropfunc = {}

                local MainDropDown = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local MainDropDown_2 = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local v = Instance.new("TextButton")
                local Text_2 = Instance.new("TextLabel")
                local ImageButton = Instance.new("ImageButton")
                local Scroll_Items = Instance.new("ScrollingFrame")
                local UIListLayout_3 = Instance.new("UIListLayout")
                local UIPadding_3 = Instance.new("UIPadding")

                local MainDropDown_3 = Instance.new("Frame")
                MainDropDown_3.Name = text
                MainDropDown_3.Parent = SectionContainer
                MainDropDown_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainDropDown_3.Position = UDim2.new(0,0,2,0)
                MainDropDown_3.BackgroundTransparency = 1
                MainDropDown_3.BorderSizePixel = 0
                MainDropDown_3.ClipsDescendants = true
                MainDropDown_3.Size = UDim2.new(1, 0, 0, 15)
                MainDropDown_3.ZIndex = 16

                local Text_3 = Instance.new("TextLabel")

                Text_3.Name = "Text_3"
                Text_3.Parent = MainDropDown_3
                Text_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_3.BackgroundTransparency = 1.000
                Text_3.Size = UDim2.new(0, 62, 0, 12)
                Text_3.ZIndex = 16
                Text_3.Font = Enum.Font.GothamBold
                Text_3.Text = text
                Text_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_3.TextSize = 12.000
                Text_3.TextXAlignment = Enum.TextXAlignment.Left

                MainDropDown_2.Name = "MainDropDown"
                MainDropDown_2.Parent = MainDropDown
                MainDropDown_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainDropDown_2.BackgroundTransparency = 0.700
                MainDropDown_2.BorderSizePixel = 0
                MainDropDown_2.ClipsDescendants = true
                MainDropDown_2.Size = UDim2.new(1, 0, 0, 35)
                MainDropDown_2.ZIndex = 16

                UICorner_8.CornerRadius = UDim.new(0, 4)
                UICorner_8.Parent = MainDropDown_2

                MainDropDown.Name = text
                MainDropDown.Parent = SectionContainer
                MainDropDown.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainDropDown.BackgroundTransparency = 0.700
                MainDropDown.BorderSizePixel = 0
                MainDropDown.ClipsDescendants = true
                MainDropDown.Size = UDim2.new(1, 0, 0, 35)
                MainDropDown.ZIndex = 16

                local UIStroke96 = Instance.new("UIStroke")
                UIStroke96.Thickness = 1.2
                UIStroke96.Parent = MainDropDown
                UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                UIStroke96.Color = _G.Color
                UIStroke96.Transparency = 1

                MainDropDown.MouseEnter:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.10}
                    ):Play()
                end)

                MainDropDown.MouseLeave:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 1}
                    ):Play()
                end)

                UICorner_7.CornerRadius = UDim.new(0, 4)
                UICorner_7.Parent = MainDropDown


                v.Name = "v"
                v.Parent = MainDropDown_2
                v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v.BackgroundTransparency = 1.000
                v.BorderSizePixel = 0
                v.Size = UDim2.new(1, 0, 1, 0)
                v.ZIndex = 16
                v.AutoButtonColor = false
                v.Font = Enum.Font.GothamBold
                v.Text = ""
                v.TextColor3 = Color3.fromRGB(255, 255, 255)
                v.TextSize = 12.000

                function getpro()
                    if default then
                        if table.find(list, default) then
                            callback(default)
                            return default
                        else
                            return ""
                        end
                    else
                        return ""
                    end
                end

                Text_2.Name = "Text"
                Text_2.Parent = MainDropDown
                Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.BackgroundTransparency = 1.000
                Text_2.Size = UDim2.new(1, 0, 0, 35)
                Text_2.ZIndex = 16
                Text_2.Font = Enum.Font.GothamBold
                Text_2.Text = getpro()
                Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.TextSize = 13.000
                Text_2.TextXAlignment = Enum.TextXAlignment.Center

                ImageButton.Parent = MainDropDown_2
                ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageButton.BackgroundTransparency = 1
                ImageButton.Position = UDim2.new(0, 200, 0, 10)
                ImageButton.Size = UDim2.new(0, 13, 0, 13)
                ImageButton.ZIndex = 16
                ImageButton.Image = "http://www.roblox.com/asset/?id=6282522798"

                local UICorner_35 = Instance.new("UICorner")
                UICorner_35.CornerRadius = UDim.new(0, 5)
                UICorner_35.Parent = ImageButton

                Scroll_Items.Name = "Scroll_Items"
                Scroll_Items.Parent = MainDropDown
                Scroll_Items.Active = true
                Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Scroll_Items.BackgroundTransparency = 1.000
                Scroll_Items.BorderSizePixel = 0
                Scroll_Items.Position = UDim2.new(0, 0, 0, 31)
                Scroll_Items.Size = UDim2.new(1, 0, 0, 375)
                Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 0)
                Scroll_Items.ScrollBarThickness = 0

                UIListLayout_3.Parent = Scroll_Items
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.Padding = UDim.new(0, 5)
                UIListLayout_3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    Scroll_Items.CanvasSize =  UDim2.new(0, 0, 0, UIListLayout_3.AbsoluteContentSize.Y*2)
                end)
                
                UIPadding_3.Parent = Scroll_Items
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingTop = UDim.new(0, 5)

                function Dropfunc:TogglePanel(state)
                    TweenService:Create(
                        MainDropDown,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = state and UDim2.new(1, 0, 0, 299) or UDim2.new(1, 0, 0, 35)}
                    ):Play()
                    TweenService:Create(
                        ImageButton,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = state and 180 or 0}
                    ):Play()
                end
                local Tof = false
                ImageButton.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
                v.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
                function Dropfunc:Clear()
                    for i, v in next, Scroll_Items:GetChildren() do
                        if v:IsA("TextButton") then 
                            v:Destroy()
                        end
                    end
                end

                function Dropfunc:Add(Text)
                    local _5 = Instance.new("TextButton")
                    local UICorner_9 = Instance.new("UICorner")
                    _5.Name = Text
                    _5.Parent = Scroll_Items
                    _5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _5.BorderSizePixel = 0
                    _5.ClipsDescendants = true
                    _5.Size = UDim2.new(1, -10, 0, 30)
                    _5.ZIndex = 17
                    _5.AutoButtonColor = false
                    _5.Font = Enum.Font.GothamBold
                    _5.Text = Text
                    _5.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _5.TextSize = 12.000

                    UICorner_9.CornerRadius = UDim.new(0, 4)
                    UICorner_9.Parent = _5

                    local UIStroke96 = Instance.new("UIStroke")
                    UIStroke96.Thickness = 1.2
                    UIStroke96.Parent = _5
                    UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                    UIStroke96.Color = _G.Color
                    UIStroke96.Transparency = 1

                    for i, v in pairs(Scroll_Items:GetChildren()) do
                        if v.Name == default then
                            TweenService:Create(
                                v,
                                TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {TextColor3 = Color3.fromRGB(255 , 0, 0)}
                            ):Play()
                            callback(default)
                        end
                    end  

                    _5.MouseEnter:Connect(function()
                        TweenService:Create(
                            UIStroke96,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Transparency = 0.10}
                        ):Play()
                    end)

                    _5.MouseLeave:Connect(function()
                        TweenService:Create(
                            UIStroke96,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Transparency = 1}
                        ):Play()
                    end)

                    _5.MouseButton1Click:Connect(
                        function()
                            if _x == nil then
                                Tof = false
                                TweenService:Create(
                                    _5,
                                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = Color3.fromRGB(255 , 0, 0)}
                                ):Play()
                                Dropfunc:TogglePanel(Tof)
                                callback(Text)
                                Text_2.Text = Text
                                _x = nil
                            end
                            for i, v in pairs(Scroll_Items:GetChildren()) do
                                if v:IsA("TextButton") and v.TextColor3 == Color3.fromRGB(255, 0, 0) then
                                    TweenService:Create(
                                        v,
                                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextColor3 = Color3.fromRGB(255, 255, 255)}
                                    ):Play()
                                end
                            end

                        end
                    )
                end
                for i, v in next, list do
                    Dropfunc:Add(v)
                end
                return Dropfunc
            end
            
            function functionitem:AddMultiDropdown(options)
                local text = options.Name
                local Flag = options.Flag
                local default = options.Value or {}
                local list = options.List
                local callback = options.Callback

                local Dropfunc = {}

                local MainDropDown = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local MainDropDown_2 = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local v = Instance.new("TextButton")
                local Text_2 = Instance.new("TextLabel")
                local ImageButton = Instance.new("ImageButton")
                local Scroll_Items = Instance.new("ScrollingFrame")
                local UIListLayout_3 = Instance.new("UIListLayout")
                local UIPadding_3 = Instance.new("UIPadding")

                local MainDropDown_3 = Instance.new("Frame")

                MainDropDown_3.Name = Name
                MainDropDown_3.Parent = SectionContainer
                MainDropDown_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainDropDown_3.Position = UDim2.new(0,0,2,0)
                MainDropDown_3.BackgroundTransparency = 1
                MainDropDown_3.BorderSizePixel = 0
                MainDropDown_3.ClipsDescendants = true
                MainDropDown_3.Size = UDim2.new(1, 0, 0, 15)
                MainDropDown_3.ZIndex = 16

                local Text_3 = Instance.new("TextLabel")

                Text_3.Name = "Text_3"
                Text_3.Parent = MainDropDown_3
                Text_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_3.BackgroundTransparency = 1.000
                Text_3.Size = UDim2.new(0, 62, 0, 12)
                Text_3.ZIndex = 16
                Text_3.Font = Enum.Font.GothamBold
                Text_3.Text = Name
                Text_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_3.TextSize = 12.000
                Text_3.TextXAlignment = Enum.TextXAlignment.Left

                MainDropDown_2.Name = "MainDropDown"
                MainDropDown_2.Parent = MainDropDown
                MainDropDown_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainDropDown_2.BackgroundTransparency = 0.700
                MainDropDown_2.BorderSizePixel = 0
                MainDropDown_2.ClipsDescendants = true
                MainDropDown_2.Size = UDim2.new(1, 0, 0, 35)
                MainDropDown_2.ZIndex = 16

                UICorner_8.CornerRadius = UDim.new(0, 4)
                UICorner_8.Parent = MainDropDown_2

                MainDropDown.Name = Name
                MainDropDown.Parent = SectionContainer
                MainDropDown.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainDropDown.BackgroundTransparency = 0.700
                MainDropDown.BorderSizePixel = 0
                MainDropDown.ClipsDescendants = true
                MainDropDown.Size = UDim2.new(1, 0, 0, 35)
                MainDropDown.ZIndex = 16

                local UIStroke96 = Instance.new("UIStroke")
                UIStroke96.Thickness = 1.2
                UIStroke96.Parent = MainDropDown
                UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                UIStroke96.Color = _G.Color
                UIStroke96.Transparency = 1

                MainDropDown.MouseEnter:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.10}
                    ):Play()
                end)

                MainDropDown.MouseLeave:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 1}
                    ):Play()
                end)

                UICorner_7.CornerRadius = UDim.new(0, 4)
                UICorner_7.Parent = MainDropDown

                v.Name = "v"
                v.Parent = MainDropDown_2
                v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v.BackgroundTransparency = 1.000
                v.BorderSizePixel = 0
                v.Size = UDim2.new(1, 0, 1, 0)
                v.ZIndex = 16
                v.AutoButtonColor = false
                v.Font = Enum.Font.GothamBold
                v.Text = ""
                v.TextColor3 = Color3.fromRGB(255, 255, 255)
                v.TextSize = 12.000
                function getpro()
                    if default then
                        for i, v in next, default do
                            if table.find(list, v) then
                                callback(default)
                            end
                        end
                    end
                end

                Text_2.Name = "Text"
                Text_2.Parent = MainDropDown_2
                Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.BackgroundTransparency = 1.000
                Text_2.Size = UDim2.new(1, 0, 0, 35)
                Text_2.ZIndex = 16
                Text_2.Font = Enum.Font.GothamBold
                Text_2.Text = table.concat(default, ", ")
                Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.TextSize = 13.000
                Text_2.TextXAlignment = Enum.TextXAlignment.Center

                ImageButton.Parent = MainDropDown_2
                ImageButton.AnchorPoint = Vector2.new(0, 0.5)
                ImageButton.BackgroundTransparency = 1.000
                ImageButton.Position = UDim2.new(1, -25, 0.5, 0)
                ImageButton.Size = UDim2.new(0, 12, 0, 12)
                ImageButton.ZIndex = 16
                ImageButton.Image = "http://www.roblox.com/asset/?id=6282522798"
                local DropTable = {}
                Scroll_Items.Name = "Scroll_Items"
                Scroll_Items.Parent = MainDropDown
                Scroll_Items.Active = true
                Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Scroll_Items.BackgroundTransparency = 1.000
                Scroll_Items.BorderSizePixel = 0
                Scroll_Items.Position = UDim2.new(0, 0, 0, 35)
                Scroll_Items.Size = UDim2.new(1, 0, 1, -35)
                Scroll_Items.ZIndex = 16
                Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 265)
                Scroll_Items.ScrollBarThickness = 0

                UIListLayout_3.Parent = Scroll_Items
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.Padding = UDim.new(0, 5)
                UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()
                    Scroll_Items.CanvasSize = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y+40)
                end
                )
                UIPadding_3.Parent = Scroll_Items
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingTop = UDim.new(0, 5)

                function Dropfunc:TogglePanel(state)
                    TweenService:Create(
                        MainDropDown,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = state and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 35)}
                    ):Play()
                    TweenService:Create(
                        ImageButton,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = state and 180 or 0}
                    ):Play()
                end
                local Tof = false
                ImageButton.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
                v.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )

                function Dropfunc:Add(Text)
                    local _5 = Instance.new("TextButton")
                    local UICorner_9 = Instance.new("UICorner")
                    _5.Name = Text
                    _5.Parent = Scroll_Items
                    _5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _5.BorderSizePixel = 0
                    _5.ClipsDescendants = true
                    _5.Size = UDim2.new(1, -10, 0, 30)
                    _5.ZIndex = 17
                    _5.AutoButtonColor = false
                    _5.Font = Enum.Font.GothamBold
                    _5.Text = Text
                    _5.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _5.TextSize = 12.000

                    local UIStroke96 = Instance.new("UIStroke")
                    UIStroke96.Thickness = 1.2
                    UIStroke96.Parent = _5
                    UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                    UIStroke96.Color = _G.Color
                    UIStroke96.Transparency = 1

                    _5.MouseEnter:Connect(function()
                        TweenService:Create(
                            UIStroke96,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Transparency = 0.10}
                        ):Play()
                    end)

                    _5.MouseLeave:Connect(function()
                        TweenService:Create(
                            UIStroke96,
                            TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {Transparency = 1}
                        ):Play()
                    end)

                    UICorner_9.CornerRadius = UDim.new(0, 4)
                    UICorner_9.Parent = _5
                    _5.MouseButton1Click:Connect(
                        function()
                            if not table.find(DropTable, Text) then
                                table.insert(DropTable, Text)
                                callback(DropTable, Text)
                                Text_2.Text = table.concat(DropTable, ", ")
                                TweenService:Create(
                                    _5,
                                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = _G.Color}
                                ):Play()
                            else
                                TweenService:Create(
                                    _5,
                                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = Color3.fromRGB(255, 255, 255)}
                                ):Play()
                                for i2, v2 in pairs(DropTable) do
                                    if v2 == Text then
                                        table.remove(DropTable, i2)
                                        Text_2.Text = table.concat(DropTable, ", ")
                                    end
                                end
                                callback(DropTable, Text)
                            end
                        end
                    )
                end
                function Dropfunc:Clear()
                    for i, v in next, Scroll_Items:GetChildren() do
                        if v:IsA("TextButton")  then 
                            v:Destroy()
                        end
                    end 
                end

                for i, v in next, list do
                    Dropfunc:Add(v)
                end
                return Dropfunc
            end

            function functionitem:AddSlider(options)
                --text,floor,min,max,de,callback
                local text = options.Name
                local floor = options.floor or false
                local Flag = options.Flag
                local de = options.Value or 1
                local min = options.Min or 1
                local max = options.Max or 2

                local callback = options.Format or function() end

                local SliderFrame = Instance.new("Frame")
                local LabelNameSlider = Instance.new("TextLabel")
                local ShowValueFrame = Instance.new("Frame")
                local CustomValue = Instance.new("TextBox")
                local ShowValueFrameUICorner = Instance.new("UICorner")
                local ValueFrame = Instance.new("Frame")
                local ValueFrameUICorner = Instance.new("UICorner")
                local PartValue = Instance.new("Frame")
                local PartValueUICorner = Instance.new("UICorner")
                local MainValue = Instance.new("Frame")
                local MainValueUICorner = Instance.new("UICorner")
                local sliderfunc = {}

                SliderFrame.Name = text
                SliderFrame.Parent = SectionContainer
                SliderFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                SliderFrame.BackgroundTransparency = 0.700
                SliderFrame.Position = UDim2.new(0.109489053, 0, 0.708609283, 0)
                SliderFrame.Size = UDim2.new(1, 0, 0, 45)

                local UIStroke96 = Instance.new("UIStroke")
                UIStroke96.Thickness = 1.2
                UIStroke96.Parent = SliderFrame
                UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                UIStroke96.Color = _G.Color
                UIStroke96.Transparency = 1

                SliderFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.10}
                    ):Play()
                end)

                SliderFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 1}
                    ):Play()
                end)

                local UICorner_7 = Instance.new("UICorner")
                UICorner_7.CornerRadius = UDim.new(0, 4)
                UICorner_7.Parent = SliderFrame

                LabelNameSlider.Name = "LabelNameSlider"
                LabelNameSlider.Parent = SliderFrame
                LabelNameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSlider.BackgroundTransparency = 1.000
                LabelNameSlider.Position = UDim2.new(0.0729926974, 0, 0.0396823473, 0)
                LabelNameSlider.Size = UDim2.new(0, 182, 0, 25)
                LabelNameSlider.Font = Enum.Font.GothamBold
                LabelNameSlider.Text = tostring(text)
                LabelNameSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSlider.TextSize = 11.000
                LabelNameSlider.TextXAlignment = Enum.TextXAlignment.Left

                ShowValueFrame.Name = "ShowValueFrame"
                ShowValueFrame.Parent = SliderFrame
                ShowValueFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                ShowValueFrame.Position = UDim2.new(0.733576655, 0, 0.0656082779, 0)
                ShowValueFrame.Size = UDim2.new(0, 58, 0, 21)

                CustomValue.Name = "CustomValue"
                CustomValue.Parent = ShowValueFrame
                CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
                CustomValue.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                CustomValue.Size = UDim2.new(0, 55, 0, 21)
                CustomValue.Font = Enum.Font.GothamBold
                CustomValue.Text = ""
                CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                CustomValue.TextSize = 11.000

                local UIStroke965 = Instance.new("UIStroke")
                UIStroke965.Thickness = 1.2
                UIStroke965.Parent = CustomValue
                UIStroke965.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke965.LineJoinMode = Enum.LineJoinMode.Round
                UIStroke965.Color = _G.Color
                UIStroke965.Transparency = 0.10

                SliderFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        UIStroke965,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.5}
                    ):Play()
                end)

                SliderFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        UIStroke965,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.10}
                    ):Play()
                end)

                ShowValueFrameUICorner.CornerRadius = UDim.new(0, 4)
                ShowValueFrameUICorner.Name = "ShowValueFrameUICorner"
                ShowValueFrameUICorner.Parent = ShowValueFrame

                ValueFrame.Name = "ValueFrame"
                ValueFrame.Parent = SliderFrame
                ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ValueFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
                ValueFrame.Size = UDim2.new(0, 185, 0, 5)

                ValueFrameUICorner.CornerRadius = UDim.new(0, 30)
                ValueFrameUICorner.Name = "ValueFrameUICorner"
                ValueFrameUICorner.Parent = ValueFrame

                PartValue.Name = "PartValue"
                PartValue.Parent = ValueFrame
                PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
                PartValue.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                PartValue.BackgroundTransparency = 1.000
                PartValue.Position = UDim2.new(0.5, 0, 0.8, 0)
                PartValue.Size = UDim2.new(0, 185, 0, 5)

                PartValueUICorner.CornerRadius = UDim.new(0, 30)
                PartValueUICorner.Name = "PartValueUICorner"
                PartValueUICorner.Parent = PartValue

                MainValue.Name = "MainValue"
                MainValue.Parent = ValueFrame
                MainValue.BackgroundColor3 = _G.Color
                MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
                MainValue.BorderSizePixel = 0

                MainValueUICorner.CornerRadius = UDim.new(0, 30)
                MainValueUICorner.Name = "MainValueUICorner"
                MainValueUICorner.Parent = MainValue


                local ConneValue = Instance.new("Frame")
                ConneValue.Name = "ConneValue"
                ConneValue.Parent = PartValue
                ConneValue.AnchorPoint = Vector2.new(0.7, 0.7)
                ConneValue.BackgroundColor3 = _G.Color
                ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.5,0, 0)
                ConneValue.Size = UDim2.new(0, 10, 0, 10)
                ConneValue.BorderSizePixel = 0

                local UICorner = Instance.new("UICorner")
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = ConneValue


                if floor == true then
                    CustomValue.Text =  tostring(de and string.format("%0.2f",(de / max) * (max - min) + min) or 0)
                else
                    CustomValue.Text =  tostring(de and math.floor((de / max) * (max - min) + min) or 0)
                end

                local function move(input)
                    local pos =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0.5,
                            0
                        )
                    local pos1 =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0,
                            5
                        )
                    MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                    if floor == true then
                        local value = string.format("%.0f",((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback(value)
                    else
                        local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback(value)
                    end
                end
                local dragging = false
                ConneValue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                        end
                    end)
                ConneValue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)
                SliderFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                        end
                    end)
                SliderFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)
                ValueFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                        end
                    end)
                ValueFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end)
                CustomValue.FocusLost:Connect(function()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.6, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.0f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)

                function sliderfunc:Update(value)
                    MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((value or 0)/max, 0.5, 0.5,0, 0) , "Out", "Sine", 0.2, true)
                    CustomValue.Text = value
                    pcall(function()
                        callback(value)
                    end)
                end
                return sliderfunc
            end

            function functionitem:AddColorpicker(text, preset, callback)
                local OldToggleColor = Color3.fromRGB(0, 0, 0)
                local OldColor = Color3.fromRGB(0, 0, 0)
                local OldColorSelectionPosition = nil
                local OldHueSelectionPosition = nil
                local ColorH, ColorS, ColorV = 1, 1, 1
                local RainbowColorPicker = false
                local ColorPickerInput = nil
                local ColorInput = nil
                local HueInput = nil

                local Colorpicker = Instance.new("Frame")
                local ColorpickerTitle = Instance.new("TextLabel")
                local ColorpickerFrameOutline = Instance.new("Frame")
                local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
                local ColorpickerFrame = Instance.new("Frame")
                local ColorpickerFrameCorner = Instance.new("UICorner")
                local Color = Instance.new("ImageLabel")
                local ColorCorner = Instance.new("UICorner")
                local ColorSelection = Instance.new("ImageLabel")
                local Hue = Instance.new("ImageLabel")
                local HueCorner = Instance.new("UICorner")
                local HueGradient = Instance.new("UIGradient")
                local HueSelection = Instance.new("ImageLabel")
                local PresetClr = Instance.new("Frame")
                local PresetClrCorner = Instance.new("UICorner")

                Colorpicker.Name = "Colorpicker"
                Colorpicker.Parent = SectionContainer
                Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Colorpicker.BackgroundTransparency = 1.000
                Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
                Colorpicker.Size = UDim2.new(1, 0, 0, 175)

                ColorpickerTitle.Name = "ColorpickerTitle"
                ColorpickerTitle.Parent = Colorpicker
                ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorpickerTitle.BackgroundTransparency = 1.000
                ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
                ColorpickerTitle.Size = UDim2.new(.92, 0, 0, 29)
                ColorpickerTitle.Font = Enum.Font.Gotham
                ColorpickerTitle.Text = "Colorpicker"
                ColorpickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ColorpickerTitle.TextSize = 14.000
                ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

                ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
                ColorpickerFrameOutline.Parent = ColorpickerTitle
                ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
                ColorpickerFrameOutline.Size = UDim2.new(1.025, 0, 0, 139)

                ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
                ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"
                ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

                ColorpickerFrame.Name = "ColorpickerFrame"
                ColorpickerFrame.Parent = ColorpickerTitle
                ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                ColorpickerFrame.ClipsDescendants = true
                ColorpickerFrame.Position = UDim2.new(0.00899999978, 0, 1.06638515, 0)
                ColorpickerFrame.Selectable = true
                ColorpickerFrame.Size = UDim2.new(1, 0, 0, 135)

                ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
                ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
                ColorpickerFrameCorner.Parent = ColorpickerFrame

                Color.Name = "Color"
                Color.Parent = ColorpickerFrame
                Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                Color.Position = UDim2.new(0, 10, 0, 10)
                Color.Size = UDim2.new(0, 154, 0, 118)
                Color.ZIndex = 10
                Color.Image = "rbxassetid://4155801252"

                ColorCorner.CornerRadius = UDim.new(0, 3)
                ColorCorner.Name = "ColorCorner"
                ColorCorner.Parent = Color

                ColorSelection.Name = "ColorSelection"
                ColorSelection.Parent = Color
                ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
                ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorSelection.BackgroundTransparency = 1.000
                ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
                ColorSelection.Size = UDim2.new(0, 18, 0, 18)
                ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
                ColorSelection.ScaleType = Enum.ScaleType.Fit

                Hue.Name = "Hue"
                Hue.Parent = ColorpickerFrame
                Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Hue.Position = UDim2.new(0, 171, 0, 10)
                Hue.Size = UDim2.new(0, 18, 0, 118)

                HueCorner.CornerRadius = UDim.new(0, 3)
                HueCorner.Name = "HueCorner"
                HueCorner.Parent = Hue

                HueGradient.Color = ColorSequence.new {ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
                HueGradient.Rotation = 270
                HueGradient.Name = "HueGradient"
                HueGradient.Parent = Hue

                HueSelection.Name = "HueSelection"
                HueSelection.Parent = Hue
                HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
                HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSelection.BackgroundTransparency = 1.000
                HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
                HueSelection.Size = UDim2.new(0, 18, 0, 18)
                HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

                PresetClr.Name = "PresetClr"
                PresetClr.Parent = ColorpickerFrame
                PresetClr.BackgroundColor3 = preset
                PresetClr.Position = UDim2.new(0.9, 0, 0.0740740746, 0)
                PresetClr.Size = UDim2.new(0, 20, 0, 20)

                PresetClrCorner.CornerRadius = UDim.new(0, 3)
                PresetClrCorner.Name = "PresetClrCorner"
                PresetClrCorner.Parent = PresetClr

                local function UpdateColorPicker(nope)
                    PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                    pcall(callback, PresetClr.BackgroundColor3)
                end

                ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
                ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

                PresetClr.BackgroundColor3 = preset
                Color.BackgroundColor3 = preset
                pcall(callback, PresetClr.BackgroundColor3)

                Color.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end

                        ColorInput = RunService.RenderStepped:Connect(function()
                            local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                            local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
                            ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                            ColorS = ColorX
                            ColorV = 1 - ColorY

                            UpdateColorPicker(true)
                        end)
                    end
                end)

                Color.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end)

                Hue.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end

                        HueInput = RunService.RenderStepped:Connect(function()
                            local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
                            HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                            ColorH = 1 - HueY

                            UpdateColorPicker(true)
                        end)
                    end
                end)

                Hue.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end
                    end
                end)
            end

            function functionitem:AddTextbox(options)
                local Name = options.Name
                local Placeholder = options.Value
                local callback = options.Callback

                local Textbox = Instance.new("Frame")
                local UICorner_16 = Instance.new("UICorner")
                local Text_5 = Instance.new("TextLabel")
                local TextboxHoler = Instance.new("Frame")
                local UICorner_17 = Instance.new("UICorner")
                local HeadTitle = Instance.new("TextBox")

                Textbox.Name = Name
                Textbox.Parent = SectionContainer
                Textbox.BackgroundColor3 = Color3.fromRGB(1, 2, 3)
                Textbox.BackgroundTransparency = 0.700
                Textbox.BorderSizePixel = 0
                Textbox.ClipsDescendants = true
                Textbox.Size = UDim2.new(1, 0, 0, 60)
                Textbox.ZIndex = 16
                --InputEnded
                local UIStroke96 = Instance.new("UIStroke")
                UIStroke96.Thickness = 1.2
                UIStroke96.Parent = Textbox
                UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
                UIStroke96.Color = _G.Color
                UIStroke96.Transparency = 1

                Textbox.MouseEnter:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.10}
                    ):Play()
                end)

                Textbox.MouseLeave:Connect(function()
                    TweenService:Create(
                        UIStroke96,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 1}
                    ):Play()
                end)

                UICorner_16.CornerRadius = UDim.new(0, 4)
                UICorner_16.Parent = Textbox

                Text_5.Name = "Text"
                Text_5.Parent = Textbox
                Text_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_5.BackgroundTransparency = 1.000
                Text_5.Position = UDim2.new(0, 10, 0, 10)
                Text_5.Size = UDim2.new(0, 43, 0, 12)
                Text_5.ZIndex = 16
                Text_5.Font = Enum.Font.GothamBold
                Text_5.Text = Name
                Text_5.TextColor3 = _G.Color
                Text_5.TextSize = 11.000
                Text_5.TextXAlignment = Enum.TextXAlignment.Left

                TextboxHoler.Name = "TextboxHoler"
                TextboxHoler.Parent = Textbox
                TextboxHoler.AnchorPoint = Vector2.new(0.5, 0.5)
                TextboxHoler.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
                TextboxHoler.BackgroundTransparency = 1.000
                TextboxHoler.BorderSizePixel = 0
                TextboxHoler.Position = UDim2.new(0.5, 0, 0.5, 13)
                TextboxHoler.Size = UDim2.new(0.970000029, 0, 0, 30)

                UICorner_17.CornerRadius = UDim.new(0, 8)
                UICorner_17.Parent = TextboxHoler

                HeadTitle.Name = "HeadTitle"
                HeadTitle.Parent = TextboxHoler
                HeadTitle.AnchorPoint = Vector2.new(0.5, 0.5)
                HeadTitle.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                HeadTitle.BackgroundTransparency = 1.000
                HeadTitle.BorderSizePixel = 0
                HeadTitle.ClipsDescendants = true
                HeadTitle.Position = UDim2.new(0.5, 3, 0.5, 0)
                HeadTitle.Size = UDim2.new(0.949999988, 0, 0, 25)
                HeadTitle.ZIndex = 16
                HeadTitle.Font = Enum.Font.GothamBold
                HeadTitle.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                HeadTitle.PlaceholderText = Placeholder
                HeadTitle.Text = ""
                HeadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                HeadTitle.TextSize = 13.000
                HeadTitle.TextXAlignment = Enum.TextXAlignment.Center

                local ButtonColor44 = Instance.new("UIStroke")

                ButtonColor44.Thickness = 0.9
                ButtonColor44.Name = ""
                ButtonColor44.Parent = HeadTitle
                ButtonColor44.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                ButtonColor44.LineJoinMode = Enum.LineJoinMode.Round
                ButtonColor44.Color = _G.Color
                ButtonColor44.Transparency = 0.2

                Textbox.MouseEnter:Connect(function()
                    TweenService:Create(
                        ButtonColor44,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Thickness = 1}
                    ):Play()
                    TweenService:Create(
                        ButtonColor44,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.5}
                    ):Play()
                end)

                Textbox.MouseLeave:Connect(function()
                    TweenService:Create(
                        ButtonColor44,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Thickness = 0.9}
                    ):Play()
                    TweenService:Create(
                        ButtonColor44,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.2}
                    ):Play()
                end)

                HeadTitle.FocusLost:Connect(function(ep)
                    if ep then
                        if #HeadTitle.Text > 0 then
                            callback(HeadTitle.Text)
                            HeadTitle.Text = HeadTitle.Text
                        end
                    end
                end)
            end

            return functionitem
        end
        return sections
    end
    return tabs
end
return library