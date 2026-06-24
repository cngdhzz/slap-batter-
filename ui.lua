local Players = game:GetService("Players")
local Player = Players.LocalPlayer

if Player.PlayerGui:FindFirstChild("MasteryUI") then
    Player.PlayerGui.MasteryUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MasteryUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 700, 0, 460)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -230)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
MainFrame.BackgroundTransparency = 0.12
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(60, 60, 75)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, 0, 0, 2)
TopLine.Position = UDim2.new(0, 0, 0, 0)
TopLine.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
TopLine.BorderSizePixel = 0
TopLine.Parent = TitleBar

local BottomLine = Instance.new("Frame")
BottomLine.Size = UDim2.new(1, 0, 0, 2)
BottomLine.Position = UDim2.new(0, 0, 0, 48)
BottomLine.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
BottomLine.BorderSizePixel = 0
BottomLine.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.6, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Slap Battles 大师"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 20
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local function createWindowButton(text, xPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 32, 0, 32)
    btn.Position = UDim2.new(1, xPos, 0.5, -16)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    btn.BackgroundTransparency = 0.5
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(220, 220, 230)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.Parent = TitleBar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = btn

    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0.1
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.5
        btn.TextColor3 = Color3.fromRGB(220, 220, 230)
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local isMinimized = false
local originalSize = UDim2.new(0, 700, 0, 460)
local minimizedSize = UDim2.new(0, 700, 0, 50)

local function toggleMinimize()
    isMinimized = not isMinimized
    MainFrame.Size = isMinimized and minimizedSize or originalSize
    Sidebar.Visible = not isMinimized
    ContentArea.Visible = not isMinimized
end

local function reloadUI()
    ScreenGui:Destroy()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cngdhzz/slap-batter-/refs/heads/main/ui.lua'))()
end

local closeBtn = createWindowButton("✕", -45, function()
    ScreenGui:Destroy()
end)
local minBtn = createWindowButton("—", -80, toggleMinimize)
local refreshBtn = createWindowButton("↻", -115, reloadUI)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 170, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, 0, 0, 60)
SidebarTitle.Position = UDim2.new(0, 0, 0, 10)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "⚡ 菜单"
SidebarTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SidebarTitle.Font = Enum.Font.GothamBold
SidebarTitle.TextSize = 22
SidebarTitle.Parent = Sidebar

local Categories = {"战斗辅助", "自动农场", "视觉设置", "通用功能"}
local CategoryButtons = {}
local function CreateCategoryButton(Text, YPos)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.85, 0, 0, 42)
    Button.Position = UDim2.new(0.075, 0, 0, YPos)
    Button.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
    Button.BackgroundTransparency = 0.8
    Button.Text = Text
    Button.TextColor3 = Color3.fromRGB(200, 200, 210)
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.TextSize = 16
    Button.Font = Enum.Font.GothamSans
    Button.BorderSizePixel = 0
    Button.Parent = Sidebar
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Button
    Button.MouseEnter:Connect(function()
        Button.BackgroundTransparency = 0.2
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    Button.MouseLeave:Connect(function()
        Button.BackgroundTransparency = 0.8
        Button.TextColor3 = Color3.fromRGB(200, 200, 210)
    end)
    return Button
end

for i, Cat in ipairs(Categories) do
    local btn = CreateCategoryButton(Cat, 70 + (i-1) * 55)
    table.insert(CategoryButtons, btn)
end

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -190, 1, -70)
ContentArea.Position = UDim2.new(0, 180, 0, 60)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

local ContentTitle = Instance.new("TextLabel")
ContentTitle.Size = UDim2.new(1, 0, 0, 40)
ContentTitle.Position = UDim2.new(0, 0, 0, 0)
ContentTitle.BackgroundTransparency = 1
ContentTitle.Text = "请选择分类"
ContentTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextSize = 24
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
ContentTitle.Parent = ContentArea

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -55)
ScrollFrame.Position = UDim2.new(0, 0, 0, 45)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
ScrollFrame.Parent = ContentArea

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 0, 0)
Container.BackgroundTransparency = 1
Container.Parent = ScrollFrame

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 12)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Top
Layout.Parent = Container

local FeatureData = {
    ["战斗辅助"] = {"自动格挡", "完美弹反", "自动连击", "显示攻击范围"},
    ["自动农场"] = {"自动重生", "自动收集拳头", "保持连击数", "自动使用手套"},
    ["视觉设置"] = {"透视玩家", "高亮手套", "显示CD计时", "隐藏UI"},
    ["通用功能"] = {"防挂机踢", "快速重连", "FPS优化", "点击传送"}
}

local ToggleStates = {}

local function CreateFeatureCard(Parent, FeatureName)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -10, 0, 48)
    Card.BackgroundColor3 = Color3.fromRGB(38, 38, 46)
    Card.BackgroundTransparency = 0.6
    Card.BorderSizePixel = 0
    Card.Parent = Parent
    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 10)
    CardCorner.Parent = Card
    Card.MouseEnter:Connect(function()
        Card.BackgroundTransparency = 0.3
    end)
    Card.MouseLeave:Connect(function()
        Card.BackgroundTransparency = 0.6
    end)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = FeatureName
    Label.TextColor3 = Color3.fromRGB(230, 230, 240)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.GothamSans
    Label.TextSize = 17
    Label.Parent = Card

    local ToggleBtn = Instance.new("Frame")
    ToggleBtn.Size = UDim2.new(0, 44, 0, 24)
    ToggleBtn.Position = UDim2.new(0.92, -44, 0.5, -12)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 85)
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Parent = Card
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleBtn

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 18, 0, 18)
    Dot.Position = UDim2.new(0, 3, 0.5, -9)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.BorderSizePixel = 0
    Dot.Parent = ToggleBtn
    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = Dot

    local Enabled = false
    ToggleStates[FeatureName] = false

    local function ToggleSwitch()
        Enabled = not Enabled
        ToggleStates[FeatureName] = Enabled
        if Enabled then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            Dot.Position = UDim2.new(0, 23, 0.5, -9)
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 85)
            Dot.Position = UDim2.new(0, 3, 0.5, -9)
        end
    end

    Card.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            ToggleSwitch()
        end
    end)
    ToggleBtn.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            ToggleSwitch()
        end
    end)
end

local function LoadCategory(CategoryName)
    for _, child in ipairs(Container:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    ContentTitle.Text = CategoryName
    local Features = FeatureData[CategoryName] or {}
    for _, Feature in ipairs(Features) do
        CreateFeatureCard(Container, Feature)
    end
    local count = #Features
    local CanvasHeight = math.max(count * (48 + 12) + 20, 100)
    Container.Size = UDim2.new(1, 0, 0, CanvasHeight)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, CanvasHeight)
end

for i, btn in ipairs(CategoryButtons) do
    btn.MouseButton1Click:Connect(function()
        local CatName = Categories[i]
        LoadCategory(CatName)
        for _, b in ipairs(CategoryButtons) do
            b.BackgroundTransparency = 0.8
            b.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
        btn.BackgroundTransparency = 0.1
        btn.TextColor3 = Color3.fromRGB(0, 200, 255)
    end)
end

if #CategoryButtons > 0 then
    CategoryButtons[1].MouseButton1Click:Fire()
end

local Dragging = false
local DragStart, FrameStart
TitleBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = Input.Position
        FrameStart = MainFrame.Position
    end
end)
TitleBar.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(Input)
    if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(FrameStart.X.Scale, FrameStart.X.Offset + Delta.X,
                                      FrameStart.Y.Scale, FrameStart.Y.Offset + Delta.Y)
    end
end)
