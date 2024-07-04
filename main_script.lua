-- Carregar funções extras
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/aimbot.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/speed.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/show_names.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/high_jump.lua"))()

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuGui"
screenGui.Parent = game.CoreGui

-- Criar Frame do Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 400)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
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

-- Adicionar opções ao menu
createOption("Aimbot", 60, function() ToggleAimbot() end)
createOption("Speed 10", 120, function() AdjustSpeed(10) end)
createOption("Speed 50", 180, function() AdjustSpeed(50) end)
createOption("Speed 100", 240, function() AdjustSpeed(100) end)
createOption("Show Names", 300, function() ToggleShowNames() end)
createOption("Jump 10", 360, function() AdjustJump(10) end)
createOption("Jump 50", 420, function() AdjustJump(50) end)
createOption("Jump 100", 480, function() AdjustJump(100) end)

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