-- GUI to Lua 
-- Version: 0.0.3

-- Instances:

local UpdateLog = Instance.new("ScreenGui")
local ImageLabel_1 = Instance.new("ImageLabel")
local UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint")
local UIScale_1 = Instance.new("UIScale")
local Title_1 = Instance.new("ImageLabel")
local TextLabel_1 = Instance.new("TextLabel")
local UIStroke_1 = Instance.new("UIStroke")
local TextLabel_2 = Instance.new("TextLabel")
local Close_1 = Instance.new("ImageButton")
local x_1 = Instance.new("TextLabel")
local UIStroke_2 = Instance.new("UIStroke")
local UIScale_2 = Instance.new("UIScale")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local List_1 = Instance.new("ScrollingFrame")
local MostRecent_1 = Instance.new("ImageLabel")
local Title_2 = Instance.new("ImageLabel")
local w_1 = Instance.new("TextLabel")
local UIStroke_3 = Instance.new("UIStroke")
local Description_1 = Instance.new("TextLabel")
local UIStroke_4 = Instance.new("UIStroke")
local Title_3 = Instance.new("ImageLabel")
local w_2 = Instance.new("TextLabel")
local UIStroke_5 = Instance.new("UIStroke")
local UIListLayout_1 = Instance.new("UIListLayout")
local Frame_1 = Instance.new("Frame")

-- Properties:
UpdateLog.Name = "Update"
UpdateLog.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ImageLabel_1.Parent = UpdateLog
ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_1.BackgroundTransparency = 1
ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_1.BorderSizePixel = 0
ImageLabel_1.Position = UDim2.new(0.5, 0,0.5, 0)
ImageLabel_1.Size = UDim2.new(0.25999999, 0,0.600000024, 0)
ImageLabel_1.Image = "rbxassetid://12343744870"
ImageLabel_1.ScaleType = Enum.ScaleType.Slice
ImageLabel_1.SliceCenter = Rect.new(206, 241, 343, 260)
ImageLabel_1.SliceScale = 0.18000000715255737

UIAspectRatioConstraint_1.Parent = ImageLabel_1
UIAspectRatioConstraint_1.AspectRatio = 0.8999999761581421

UIScale_1.Parent = ImageLabel_1

Title_1.Name = "Title"
Title_1.Parent = ImageLabel_1
Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
Title_1.BackgroundColor3 = Color3.fromRGB(95,184,253)
Title_1.BackgroundTransparency = 1
Title_1.BorderSizePixel = 0
Title_1.Position = UDim2.new(0.375394911, 0,0.00919497758, 0)
Title_1.Size = UDim2.new(0.768769681, 0,0.153458133, 0)
Title_1.Image = "rbxassetid://11675679733"
Title_1.ImageColor3 = Color3.fromRGB(11,255,7)
Title_1.ScaleType = Enum.ScaleType.Slice
Title_1.SliceCenter = Rect.new(197, 220, 312, 220)
Title_1.SliceScale = 0.10000000149011612

TextLabel_1.Parent = Title_1
TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_1.BackgroundTransparency = 1
TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_1.BorderSizePixel = 0
TextLabel_1.Position = UDim2.new(0.0610587634, 0,0.137400299, 0)
TextLabel_1.Size = UDim2.new(0.874622166, 0,0.649999976, 0)
TextLabel_1.Font = Enum.Font.FredokaOne
TextLabel_1.Text = "Update Log"
TextLabel_1.TextColor3 = Color3.fromRGB(253,253,253)
TextLabel_1.TextScaled = true
TextLabel_1.TextSize = 14
TextLabel_1.TextWrapped = true

UIStroke_1.Parent = TextLabel_1
UIStroke_1.Color = Color3.fromRGB(20,20,20)
UIStroke_1.LineJoinMode = Enum.LineJoinMode.Bevel
UIStroke_1.Thickness = 1.4676364660263062

TextLabel_2.Parent = ImageLabel_1
TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.5, 0,1.03537774, 0)
TextLabel_2.Size = UDim2.new(1.014871, 0,0.104641728, 0)
TextLabel_2.Visible = false
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "New Update every Saturday!"
TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextWrapped = true
function CloseLog()
    UpdateLog:Destroy()
end

Close_1.Name = "Close"
Close_1.Parent = ImageLabel_1
Close_1.Active = true
Close_1.AnchorPoint = Vector2.new(0.5, 0.5)
Close_1.BackgroundColor3 = Color3.fromRGB(32,227,29)
Close_1.BackgroundTransparency = 1
Close_1.BorderSizePixel = 0
Close_1.Position = UDim2.new(0.973370969, 0,0.00502924621, 0)
Close_1.Size = UDim2.new(0.153957263, 0,0.145126671, 0)
Close_1.Image = "rbxassetid://11675742557"
Close_1.ScaleType = Enum.ScaleType.Slice
Close_1.SliceCenter = Rect.new(250, 207, 250, 269)
Close_1.SliceScale = 0.10000000149011612
Close_1.MouseButton1Click:Connect(CloseLog)
x_1.Name = "X"
x_1.Parent = Close_1
x_1.AnchorPoint = Vector2.new(0.5, 0.5)
x_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
x_1.BackgroundTransparency = 1
x_1.BorderSizePixel = 0
x_1.Position = UDim2.new(0.497131675, 0,0.374132872, 0)
x_1.Size = UDim2.new(0.879353225, 0,1.0616765, 0)
x_1.Font = Enum.Font.FredokaOne
x_1.Text = "x"
x_1.TextColor3 = Color3.fromRGB(255,255,255)
x_1.TextScaled = true
x_1.TextSize = 14
x_1.TextWrapped = true

UIStroke_2.Parent = x_1
UIStroke_2.Color = Color3.fromRGB(20,20,20)
UIStroke_2.LineJoinMode = Enum.LineJoinMode.Bevel
UIStroke_2.Thickness = 1.4685531854629517

UIScale_2.Parent = Close_1

UIAspectRatioConstraint_2.Parent = Close_1

List_1.Name = "List"
List_1.Parent = ImageLabel_1
List_1.Active = true
List_1.AnchorPoint = Vector2.new(0.5, 0.5)
List_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
List_1.BackgroundTransparency = 1
List_1.BorderSizePixel = 0
List_1.Position = UDim2.new(0.499000162, 0,0.54050523, 0)
List_1.Size = UDim2.new(0.944898546, 0,0.887903571, 0)
List_1.ClipsDescendants = true
List_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
List_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
List_1.CanvasPosition = Vector2.new(0, 0)
List_1.CanvasSize = UDim2.new(0, 0,1.66999996, 0)
List_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
List_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
List_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
List_1.ScrollBarImageTransparency = 0
List_1.ScrollBarThickness = 0
List_1.ScrollingDirection = Enum.ScrollingDirection.Y
List_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
List_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
List_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

MostRecent_1.Name = "Most Recent"
MostRecent_1.Parent = List_1
MostRecent_1.AnchorPoint = Vector2.new(0.5, 0.5)
MostRecent_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
MostRecent_1.BackgroundTransparency = 1
MostRecent_1.BorderSizePixel = 0
MostRecent_1.Position = UDim2.new(0.49999997, 0,0.311359167, 0)
MostRecent_1.Size = UDim2.new(0.968013644, 0,0.602718472, 0)
MostRecent_1.Image = "rbxassetid://11678733186"
MostRecent_1.ScaleType = Enum.ScaleType.Slice
MostRecent_1.SliceCenter = Rect.new(197, 220, 312, 220)
MostRecent_1.SliceScale = 0.10000000149011612

Title_2.Name = "Title"
Title_2.Parent = MostRecent_1
Title_2.AnchorPoint = Vector2.new(0.5, 0)
Title_2.BackgroundColor3 = Color3.fromRGB(95,184,253)
Title_2.BackgroundTransparency = 1
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.5, 0,0, 0)
Title_2.Size = UDim2.new(1, 0,0.400831103, 0)
Title_2.Image = "rbxassetid://11675679733"
Title_2.ImageColor3 = Color3.fromRGB(11,255,7)
Title_2.ScaleType = Enum.ScaleType.Slice
Title_2.SliceCenter = Rect.new(197, 220, 312, 220)
Title_2.SliceScale = 0.10000000149011612

w_1.Name = "w"
w_1.Parent = Title_2
w_1.AnchorPoint = Vector2.new(0, 0.5)
w_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
w_1.BackgroundTransparency = 1
w_1.BorderSizePixel = 0
w_1.LayoutOrder = -5
w_1.Position = UDim2.new(0, 0,0.460000008, 0)
w_1.Size = UDim2.new(1, 0,0.600000024, 0)
w_1.Font = Enum.Font.FredokaOne
w_1.Text = "What is new?"
w_1.TextColor3 = Color3.fromRGB(255,255,255)
w_1.TextSize = 28
w_1.TextWrapped = true

UIStroke_3.Parent = w_1
UIStroke_3.Color = Color3.fromRGB(20,20,20)
UIStroke_3.LineJoinMode = Enum.LineJoinMode.Bevel
UIStroke_3.Thickness = 1.4676364660263062

Description_1.Name = "Description"
Description_1.Parent = MostRecent_1
Description_1.AnchorPoint = Vector2.new(0.5, 0.5)
Description_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Description_1.BackgroundTransparency = 1
Description_1.BorderSizePixel = 0
Description_1.LayoutOrder = -5
Description_1.Position = UDim2.new(0.50000006, 0,0.659437478, 0)
Description_1.Size = UDim2.new(0.971423745, 0,0.463738233, 0)
Description_1.Font = Enum.Font.FredokaOne
Description_1.Text = ""
Description_1.TextColor3 = Color3.fromRGB(255,255,255)
Description_1.TextScaled = true
Description_1.TextSize = 14
Description_1.TextWrapped = true

UIStroke_4.Parent = Description_1
UIStroke_4.Color = Color3.fromRGB(20,20,20)
UIStroke_4.LineJoinMode = Enum.LineJoinMode.Bevel
UIStroke_4.Thickness = 1.4676364660263062
function SetDescription(description)
    Description_1.Text = description
end

function CreateLabel(text)
  Title_3.Name = "Title"
  Title_3.Parent = List_1
  Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
  Title_3.BackgroundColor3 = Color3.fromRGB(95,184,253)
  Title_3.BackgroundTransparency = 1
  Title_3.BorderSizePixel = 0
  Title_3.LayoutOrder = 1,
  Title_3.Position = UDim2.new(0.515993178, 0,0.100999981, 0)
  Title_3.Size = UDim2.new(0.968013644, 0,0.142000005, 0)
  Title_3.Image = "rbxassetid://11675679733"
  Title_3.ImageColor3 = Color3.fromRGB(11,255,7)
  Title_3.ScaleType = Enum.ScaleType.Slice
  Title_3.SliceCenter = Rect.new(197, 220, 312, 220)
  Title_3.SliceScale = 0.10000000149011612
  
  w_2.Name = "w"
  w_2.Parent = Title_3
  w_2.AnchorPoint = Vector2.new(0, 0.5)
  w_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
  w_2.BackgroundTransparency = 1
  w_2.BorderSizePixel = 0
  w_2.LayoutOrder = -5
  w_2.Position = UDim2.new(0, 0,0.460000008, 0)
  w_2.Size = UDim2.new(1, 0,0.600000024, 0)
  w_2.Font = Enum.Font.FredokaOne
  w_2.Text = text
  w_2.TextColor3 = Color3.fromRGB(255,255,255)
  w_2.TextScaled = true
  w_2.TextSize = 14
  w_2.TextWrapped = true
  UIStroke_5.Parent = w_2
  UIStroke_5.Color = Color3.fromRGB(20,20,20)
  UIStroke_5.LineJoinMode = Enum.LineJoinMode.Bevel
  UIStroke_5.Thickness = 1.4676364660263062
end
UIListLayout_1.Parent = List_1
UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

Frame_1.Parent = List_1
Frame_1.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame_1.BorderSizePixel = 0
Frame_1.LayoutOrder = -100
Frame_1.Position = UDim2.new(0.5, 0,0, 0)
Frame_1.Size = UDim2.new(0.949999988, 0,0, 0)

local function egcepWBeBFdZcilR()
local script = Instance.new("LocalScript",Close_1)
local btn = script.Parent

local isHovering = false


btn.MouseEnter:Connect(function()
	isHovering = true

	btn:TweenSize(UDim2.new(0.174, 0, 0.159, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
end)

btn.MouseLeave:Connect(function()
	isHovering = false
		-- 20 , 14
	btn:TweenSize(UDim2.new(0.154, 0, 0.145, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
end)

btn.MouseButton1Down:Connect(function()

	btn:TweenSize(UDim2.new(0.124, 0, 0.155, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
end)

btn.MouseButton1Up:Connect(function()

	if not isHovering then
		btn:TweenSize(UDim2.new(0.154, 0, 0.145, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
	else
		btn:TweenSize(UDim2.new(0.174, 0, 0.159, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.2, true)
	end
end)
end
coroutine.wrap(egcepWBeBFdZcilR)()

return UpdateLog
