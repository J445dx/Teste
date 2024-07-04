-- Carregar funções extras
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/aimbot.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/speed.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/show_names.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/high_jump.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_money.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/fire_near_players.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/grow.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_health.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_strength.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_attack.lua"))()

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuGui"
screenGui.Parent = game.CoreGui

-- Criar Frame do Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 500)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -250)
menuFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
menuFrame.Parent = screenGui

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "J445dx Menu"
titleLabel.TextSize = 24
titleLabel.Parent = menuFrame

-- Função para criar uma opção no menu
function createOption(text, position, callback)
    local optionFrame = Instance.new("Frame")
    optionFrame.Size = UDim2.new(1, -20, 0, 40)
    optionFrame.Position = UDim2.new(0, 10, 0, position)
    optionFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    optionFrame.Parent = menuFrame

    local optionLabel = Instance.new("TextLabel")
    optionLabel.Size = UDim2.new(0.6, 0, 1, 0)
    optionLabel.Position = UDim2.new(0, 10, 0, 0)
    optionLabel.BackgroundTransparency = 1
    optionLabel.TextColor3 = Color3.new(1, 1, 1)
    optionLabel.Text = text
    optionLabel.Parent = optionFrame

    local optionButton = Instance.new("TextButton")
    optionButton.Size = UDim2.new(0.3, 0, 0.8, 0)
    optionButton.Position = UDim2.new(0.65, 0, 0.1, 0)
    optionButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    optionButton.TextColor3 = Color3.new(1, 1, 1)
    optionButton.Text = "Toggle"
    optionButton.Parent = optionFrame
    optionButton.MouseButton1Click:Connect(callback)
end

-- Função para criar um slider no menu
function createSlider(text, position, min, max, callback)
    local optionFrame = Instance.new("Frame")
    optionFrame.Size = UDim2.new(1, -20, 0, 60)
    optionFrame.Position = UDim2.new(0, 10, 0, position)
    optionFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    optionFrame.Parent = menuFrame

    local optionLabel = Instance.new("TextLabel")
    optionLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
    optionLabel.Position = UDim2.new(0, 10, 0, 0)
    optionLabel.BackgroundTransparency = 1
    optionLabel.TextColor3 = Color3.new(1, 1, 1)
    optionLabel.Text = text
    optionLabel.Parent = optionFrame

    local slider = Instance.new("Slider")
    slider.Size = UDim2.new(0.8, 0, 0.4, 0)
    slider.Position = UDim2.new(0.1, 0, 0.5, 0)
    slider.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    slider.Min = min
    slider.Max = max
    slider.Parent = optionFrame
    slider.Changed:Connect(callback)
end

-- Adicionar opções ao menu
createOption("Aimbot", 60, function() ToggleAimbot() end)
createSlider("Speed", 120, 1, 100, function(value) AdjustSpeed(value) end)
createOption("Show Names", 180, function() ToggleShowNames() end)
createSlider("Jump", 240, 1, 100, function(value) AdjustJump(value) end)
createOption("Increase Money", 300, function() IncreaseMoney() end)
createOption("Fire Near Players", 360, function() ToggleFireNearPlayers() end)
createOption("Grow", 420, function() ToggleGrow() end)
createOption("Increase Health", 480, function() IncreaseHealth() end)
createOption("Increase Strength", 540, function() IncreaseStrength() end)
createOption("Increase Attack", 600, function() IncreaseAttack() end)

-- Mostrar ou esconder o menu ao clicar no botão flutuante
local floatButton = Instance.new("TextButton")
floatButton.Size = UDim2.new(0, 100, 0, 50)
floatButton.Position = UDim2.new(0, 10, 0, 10)
floatButton.BackgroundColor3 = Color3.new(1, 0, 0)
floatButton.TextColor3 = Color3.new(1, 1, 1)
floatButton.Text = "Toggle Menu"
floatButton.Parent = screenGui
floatButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)