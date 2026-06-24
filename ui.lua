local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SlapBattlesMasterUI"
screenGui.Parent = player.PlayerGui or player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local WINDOW_WIDTH = 560
local WINDOW_HEIGHT = 440
local TITLE_HEIGHT = 36
local CATEGORY_WIDTH = 0.25

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT)
mainFrame.Position = UDim2.new(0.5, -WINDOW_WIDTH/2, 0.5, -WINDOW_HEIGHT/2)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BackgroundTransparency = 0.6
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 4, 1, 4)
shadow.Position = UDim2.new(0, -2, 0, -2)
shadow.BackgroundColor3 = Color3.new(0, 0, 0)
shadow.BackgroundTransparency = 0.85
shadow.BorderSizePixel = 0
shadow.Parent = mainFrame
local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 14)
shadowCorner.Parent = shadow

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.new(0, 0, 0)
titleBar.BackgroundTransparency = 0.35
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 14, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "slapbattles大师"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextSize = 20
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

local dragArea = Instance.new("Frame")
dragArea.Name = "DragArea"
dragArea.Size = UDim2.new(1, 0, 1, 0)
dragArea.Position = UDim2.new(0, 0, 0, 0)
dragArea.BackgroundTransparency = 1
dragArea.ZIndex = 0
dragArea.Parent = titleBar

local minButton = Instance.new("TextButton")
minButton.Name = "MinButton"
minButton.Size = UDim2.new(0, 30, 0, 30)
minButton.Position = UDim2.new(1, -68, 0.5, -15)
minButton.BackgroundTransparency = 1
minButton.Text = "—"
minButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
minButton.TextSize = 22
minButton.TextXAlignment = Enum.TextXAlignment.Center
minButton.TextYAlignment = Enum.TextYAlignment.Center
minButton.Font = Enum.Font.GothamMedium
minButton.BorderSizePixel = 0
minButton.ZIndex = 2
minButton.Parent = titleBar

minButton.MouseEnter:Connect(function()
    TweenService:Create(minButton, TweenInfo.new(0.15), {BackgroundTransparency = 0.85}):Play()
    minButton.TextColor3 = Color3.new(1, 1, 1)
end)
minButton.MouseLeave:Connect(function()
    TweenService:Create(minButton, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
    minButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
end)

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -34, 0.5, -15)
closeButton.BackgroundTransparency = 1
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
closeButton.TextSize = 20
closeButton.TextXAlignment = Enum.TextXAlignment.Center
closeButton.TextYAlignment = Enum.TextYAlignment.Center
closeButton.Font = Enum.Font.GothamMedium
closeButton.BorderSizePixel = 0
closeButton.ZIndex = 2
closeButton.Parent = titleBar

closeButton.MouseEnter:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundTransparency = 0.7, BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)}):Play()
    closeButton.TextColor3 = Color3.new(1, 1, 1)
end)
closeButton.MouseLeave:Connect(function()
    TweenService:Create(closeButton, TweenInfo.new(0.15), {BackgroundTransparency = 1, BackgroundColor3 = Color3.new(0, 0, 0)}):Play()
    closeButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
end)

local divider = Instance.new("Frame")
divider.Name = "Divider"
divider.Size = UDim2.new(1, 0, 0, 1)
divider.Position = UDim2.new(0, 0, 0, TITLE_HEIGHT)
divider.BackgroundColor3 = Color3.new(1, 1, 1)
divider.BackgroundTransparency = 0.85
divider.BorderSizePixel = 0
divider.Parent = mainFrame

local categoryFrame = Instance.new("Frame")
categoryFrame.Name = "CategoryFrame"
categoryFrame.Size = UDim2.new(CATEGORY_WIDTH, 0, 1, -TITLE_HEIGHT - 1)
categoryFrame.Position = UDim2.new(0, 0, 0, TITLE_HEIGHT + 1)
categoryFrame.BackgroundColor3 = Color3.new(0, 0, 0)
categoryFrame.BackgroundTransparency = 0.75
categoryFrame.BorderSizePixel = 0
categoryFrame.ClipsDescendants = true
categoryFrame.Parent = mainFrame

local catCorner = Instance.new("UICorner")
catCorner.CornerRadius = UDim.new(0, 12)
catCorner.Parent = categoryFrame

local catTitle = Instance.new("TextLabel")
catTitle.Name = "CatTitle"
catTitle.Size = UDim2.new(1, 0, 0, 32)
catTitle.Position = UDim2.new(0, 0, 0, 8)
catTitle.BackgroundTransparency = 1
catTitle.Text = "分类"
catTitle.TextColor3 = Color3.new(0.6, 0.6, 0.6)
catTitle.TextSize = 14
catTitle.TextXAlignment = Enum.TextXAlignment.Center
catTitle.TextYAlignment = Enum.TextYAlignment.Center
catTitle.Font = Enum.Font.GothamMedium
catTitle.Parent = categoryFrame

local categories = {
    {name = "⚔ 徽章", id = "combat"},
    {name = "🛡 辅助", id = "assist"},
    {name = "⚙ 设置", id = "settings"},
    {name = "ℹ 关于", id = "about"}
}

local categoryButtons = {}
local selectedCategory = nil

local function selectCategory(categoryId)
    if selectedCategory == categoryId then
        return
    end

    for id, data in pairs(categoryButtons) do
        local btn = data.button
        local indicator = data.indicator
        if id == categoryId then
            btn.BackgroundTransparency = 0.25
            btn.TextColor3 = Color3.new(1, 1, 1)
            indicator.BackgroundTransparency = 0
            TweenService:Create(indicator, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
        else
            btn.BackgroundTransparency = 0.5
            btn.TextColor3 = Color3.new(0.85, 0.85, 0.85)
            indicator.BackgroundTransparency = 1
            TweenService:Create(indicator, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        end
    end

    for id, panel in pairs(functionPanels) do
        if id == categoryId then
            panel.Visible = true
            panel.BackgroundTransparency = 1
            TweenService:Create(panel, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        else
            panel.Visible = false
        end
    end

    selectedCategory = categoryId
end

local function createCategoryButton(data, index)
    local btn = Instance.new("TextButton")
    btn.Name = data.id .. "Btn"
    btn.Size = UDim2.new(0.88, 0, 0, 38)
    btn.Position = UDim2.new(0.06, 0, 0, 48 + (index - 1) * 46)
    btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    btn.BackgroundTransparency = 0.5
    btn.Text = data.name
    btn.TextColor3 = Color3.new(0.85, 0.85, 0.85)
    btn.TextSize = 16
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.TextYAlignment = Enum.TextYAlignment.Center
    btn.Text = "  " .. data.name
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.Parent = categoryFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 3, 0, 28)
    indicator.Position = UDim2.new(0, 4, 0.5, -14)
    indicator.BackgroundColor3 = Color3.new(0.3, 0.6, 1)
    indicator.BackgroundTransparency = 1
    indicator.BorderSizePixel = 0
    indicator.Parent = btn

    btn.MouseEnter:Connect(function()
        if selectedCategory ~= data.id then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.3}):Play()
            btn.TextColor3 = Color3.new(1, 1, 1)
        end
    end)
    btn.MouseLeave:Connect(function()
        if selectedCategory ~= data.id then
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.5}):Play()
            btn.TextColor3 = Color3.new(0.85, 0.85, 0.85)
        end
    end)

    btn.MouseButton1Click:Connect(function()
        selectCategory(data.id)
    end)

    categoryButtons[data.id] = {
        button = btn,
        indicator = indicator,
        data = data
    }

    return btn
end

for i, cat in ipairs(categories) do
    createCategoryButton(cat, i)
end

local functionFrame = Instance.new("Frame")
functionFrame.Name = "FunctionFrame"
functionFrame.Size = UDim2.new(1 - CATEGORY_WIDTH, 0, 1, -TITLE_HEIGHT - 1)
functionFrame.Position = UDim2.new(CATEGORY_WIDTH, 0, 0, TITLE_HEIGHT + 1)
functionFrame.BackgroundColor3 = Color3.new(0, 0, 0)
functionFrame.BackgroundTransparency = 0.4
functionFrame.BorderSizePixel = 0
functionFrame.ClipsDescendants = true
functionFrame.Parent = mainFrame

local funcCorner = Instance.new("UICorner")
funcCorner.CornerRadius = UDim.new(0, 12)
funcCorner.Parent = functionFrame

local functionPanels = {}

local function createFunctionPanel(categoryId)
    local panel = Instance.new("Frame")
    panel.Name = categoryId .. "Panel"
    panel.Size = UDim2.new(1, 0, 1, 0)
    panel.Position = UDim2.new(0, 0, 0, 0)
    panel.BackgroundTransparency = 1
    panel.Visible = false
    panel.Parent = functionFrame

    local panelTitle = Instance.new("TextLabel")
    panelTitle.Name = "PanelTitle"
    panelTitle.Size = UDim2.new(1, -20, 0, 30)
    panelTitle.Position = UDim2.new(0, 10, 0, 10)
    panelTitle.BackgroundTransparency = 1
    panelTitle.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    panelTitle.TextSize = 14
    panelTitle.TextXAlignment = Enum.TextXAlignment.Left
    panelTitle.TextYAlignment = Enum.TextYAlignment.Center
    panelTitle.Font = Enum.Font.GothamMedium
    panelTitle.Parent = panel

    local btnContainer = Instance.new("Frame")
    btnContainer.Name = "BtnContainer"
    btnContainer.Size = UDim2.new(1, -20, 1, -50)
    btnContainer.Position = UDim2.new(0, 10, 0, 45)
    btnContainer.BackgroundTransparency = 1
    btnContainer.Parent = panel

    local functions = {}

    if categoryId == "combat" then
        panelTitle.Text = "⚔ 徽章"
        functions = {}
    elseif categoryId == "assist" then
        panelTitle.Text = "🛡 辅助功能"
        functions = {
            {name = "自动跳跃", desc = "自动跳跃躲避攻击", type = "toggle"},
            {name = "自动格挡", desc = "自动格挡敌人的攻击", type = "toggle"},
            {name = "移动加速", desc = "增加移动速度", type = "slider"},
            {name = "自动回复", desc = "血量低于设定值时自动回复", type = "toggle"},
        }
    elseif categoryId == "settings" then
        panelTitle.Text = "⚙ 设置"
        functions = {
            {name = "透明度调节", desc = "调整UI透明度", type = "slider"},
            {name = "显示FPS", desc = "在游戏内显示帧率", type = "toggle"},
            {name = "重置窗口位置", desc = "将窗口重置到屏幕中央", type = "button"},
            {name = "保存设置", desc = "保存当前所有设置", type = "button"},
        }
    elseif categoryId == "about" then
        panelTitle.Text = "ℹ 关于"
        local aboutText = Instance.new("TextLabel")
        aboutText.Name = "AboutText"
        aboutText.Size = UDim2.new(1, 0, 1, 0)
        aboutText.Position = UDim2.new(0, 0, 0, 0)
        aboutText.BackgroundTransparency = 1
        aboutText.Text = "SlapBattles 大师 v1.0\n\n一个功能强大的辅助工具\n帮助你在SlapBattles中更轻松地游戏\n\n作者：YourName\n\n按 Insert 键显示/隐藏界面"
        aboutText.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        aboutText.TextSize = 16
        aboutText.TextXAlignment = Enum.TextXAlignment.Left
        aboutText.TextYAlignment = Enum.TextYAlignment.Top
        aboutText.Font = Enum.Font.GothamMedium
        aboutText.LineHeight = 1.5
        aboutText.Parent = panel
        panel:SetAttribute("isInfo", true)
    end

    local function createFunctionItem(funcData, index)
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = funcData.name .. "Item"
        itemFrame.Size = UDim2.new(1, 0, 0, 42)
        itemFrame.Position = UDim2.new(0, 0, 0, (index - 1) * 46)
        itemFrame.BackgroundTransparency = 1
        itemFrame.Parent = btnContainer

        local funcBtn = Instance.new("TextButton")
        funcBtn.Name = "FuncBtn"
        funcBtn.Size = UDim2.new(1, 0, 1, 0)
        funcBtn.Position = UDim2.new(0, 0, 0, 0)
        funcBtn.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
        funcBtn.BackgroundTransparency = 0.4
        funcBtn.Text = funcData.name .. "  [OFF]"
        funcBtn.TextColor3 = Color3.new(0.9, 0.9, 0.9)
        funcBtn.TextSize = 15
        funcBtn.TextXAlignment = Enum.TextXAlignment.Left
        funcBtn.TextYAlignment = Enum.TextYAlignment.Center
        funcBtn.Font = Enum.Font.GothamMedium
        funcBtn.BorderSizePixel = 0
        funcBtn.Parent = itemFrame

        local itemCorner = Instance.new("UICorner")
        itemCorner.CornerRadius = UDim.new(0, 6)
        itemCorner.Parent = funcBtn

        local statusDot = Instance.new("Frame")
        statusDot.Name = "StatusDot"
        statusDot.Size = UDim2.new(0, 10, 0, 10)
        statusDot.Position = UDim2.new(1, -20, 0.5, -5)
        statusDot.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
        statusDot.BackgroundTransparency = 0.3
        statusDot.BorderSizePixel = 0
        statusDot.Parent = funcBtn
        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = statusDot

        local statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "StatusLabel"
        statusLabel.Size = UDim2.new(0, 40, 1, 0)
        statusLabel.Position = UDim2.new(1, -65, 0, 0)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = "OFF"
        statusLabel.TextColor3 = Color3.new(0.6, 0.6, 0.6)
        statusLabel.TextSize = 13
        statusLabel.TextXAlignment = Enum.TextXAlignment.Right
        statusLabel.TextYAlignment = Enum.TextYAlignment.Center
        statusLabel.Font = Enum.Font.GothamMedium
        statusLabel.Parent = funcBtn

        local isOn = false

        funcBtn.MouseButton1Click:Connect(function()
            isOn = not isOn
            if isOn then
                funcBtn.Text = funcData.name .. "  [ON]"
                statusLabel.Text = "ON"
                statusLabel.TextColor3 = Color3.new(0.3, 0.9, 0.3)
                statusDot.BackgroundColor3 = Color3.new(0.3, 0.9, 0.3)
                statusDot.BackgroundTransparency = 0.1
                funcBtn.BackgroundColor3 = Color3.new(0.2, 0.35, 0.2)
            else
                funcBtn.Text = funcData.name .. "  [OFF]"
                statusLabel.Text = "OFF"
                statusLabel.TextColor3 = Color3.new(0.6, 0.6, 0.6)
                statusDot.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
                statusDot.BackgroundTransparency = 0.3
                funcBtn.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
            end
            funcBtn:SetAttribute("isOn", isOn)
        end)

        funcBtn.MouseEnter:Connect(function()
            if not isOn then
                TweenService:Create(funcBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.25}):Play()
            end
        end)
        funcBtn.MouseLeave:Connect(function()
            if not isOn then
                TweenService:Create(funcBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.4}):Play()
            end
        end)

        itemFrame:SetAttribute("isOn", false)
        itemFrame:SetAttribute("funcName", funcData.name)

        return itemFrame
    end

    if categoryId ~= "about" then
        for i, func in ipairs(functions) do
            createFunctionItem(func, i)
        end
    end

    return panel
end

for _, cat in ipairs(categories) do
    local panel = createFunctionPanel(cat.id)
    functionPanels[cat.id] = panel
end

selectCategory("combat")

local isDragging = false
local dragOffset = nil
local moveConn = nil
local upConn = nil

dragArea.MouseButton1Down:Connect(function()
    isDragging = true
    local mouse = player:GetMouse()
    dragOffset = Vector2.new(mouse.X - mainFrame.AbsolutePosition.X, mouse.Y - mainFrame.AbsolutePosition.Y)

    if moveConn then moveConn:Disconnect() end
    if upConn then upConn:Disconnect() end

    moveConn = mouse.Move:Connect(function()
        if isDragging then
            local newX = math.clamp(mouse.X - dragOffset.X, 0, workspace.CurrentCamera.ViewportSize.X - mainFrame.AbsoluteSize.X)
            local newY = math.clamp(mouse.Y - dragOffset.Y, 0, workspace.CurrentCamera.ViewportSize.Y - mainFrame.AbsoluteSize.Y)
            mainFrame.Position = UDim2.new(0, newX, 0, newY)
        end
    end)

    upConn = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
            if moveConn then moveConn:Disconnect() end
            if upConn then upConn:Disconnect() end
        end
    end)
end)

local isMinimized = false

minButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 200, 0, TITLE_HEIGHT)
        }):Play()
        categoryFrame.Visible = false
        functionFrame.Visible = false
        divider.Visible = false
        minButton.Text = "□"
        minButton.TextSize = 18
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT)
        }):Play()
        categoryFrame.Visible = true
        functionFrame.Visible = true
        divider.Visible = true
        minButton.Text = "—"
        minButton.TextSize = 22
    end
end)

local isClosed = false

closeButton.MouseButton1Click:Connect(function()
    isClosed = true
    TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    wait(0.2)
    mainFrame.Visible = false
    screenGui.Enabled = false
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        if isClosed then
            isClosed = false
            screenGui.Enabled = true
            mainFrame.Visible = true
            mainFrame.BackgroundTransparency = 0.6
            mainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT)
            mainFrame.Position = UDim2.new(0.5, -WINDOW_WIDTH/2, 0.5, -WINDOW_HEIGHT/2)
            if isMinimized then
                isMinimized = false
                categoryFrame.Visible = true
                functionFrame.Visible = true
                divider.Visible = true
                minButton.Text = "—"
                minButton.TextSize = 22
            end
        else
            mainFrame.Visible = not mainFrame.Visible
            if mainFrame.Visible then
                screenGui.Enabled = true
                mainFrame.BackgroundTransparency = 0.6
                mainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT)
            end
        end
    end
end)

local UI = {
    GetMainFrame = function() return mainFrame end,
    GetCategoryButtons = function() return categoryButtons end,
    GetFunctionPanels = function() return functionPanels end,
    SelectCategory = selectCategory,
    GetSelectedCategory = function() return selectedCategory end,
    Show = function()
        isClosed = false
        screenGui.Enabled = true
        mainFrame.Visible = true
        mainFrame.BackgroundTransparency = 0.6
        mainFrame.Size = UDim2.new(0, WINDOW_WIDTH, 0, WINDOW_HEIGHT)
        if isMinimized then
            isMinimized = false
            categoryFrame.Visible = true
            functionFrame.Visible = true
            divider.Visible = true
            minButton.Text = "—"
            minButton.TextSize = 22
        end
    end,
    Hide = function()
        mainFrame.Visible = false
        screenGui.Enabled = false
        isClosed = true
    end,
    ToggleMinimize = function()
        minButton.MouseButton1Click:Fire()
    end,
    GetFunctionState = function(panelId, funcName)
        local panel = functionPanels[panelId]
        if not panel then return nil end
        local container = panel:FindFirstChild("BtnContainer")
        if not container then return nil end
        for _, child in ipairs(container:GetChildren()) do
            if child:GetAttribute("funcName") == funcName then
                return child:GetAttribute("isOn")
            end
        end
        return nil
    end,
    SetFunctionState = function(panelId, funcName, state)
        local panel = functionPanels[panelId]
        if not panel then return false end
        local container = panel:FindFirstChild("BtnContainer")
        if not container then return false end
        for _, child in ipairs(container:GetChildren()) do
            if child:GetAttribute("funcName") == funcName then
                local btn = child:FindFirstChild("FuncBtn")
                if btn then
                    btn.MouseButton1Click:Fire()
                    if child:GetAttribute("isOn") ~= state then
                        btn.MouseButton1Click:Fire()
                    end
                    return true
                end
            end
        end
        return false
    end
}

_G.SlapBattlesMasterUI = UI
