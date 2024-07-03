-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESP_GUI"
screenGui.Parent = game.CoreGui

-- Criar botão flutuante
local floatButton = Instance.new("ImageButton")
floatButton.Size = UDim2.new(0, 50, 0, 50)
floatButton.Position = UDim2.new(0, 10, 0, 10)
floatButton.BackgroundColor3 = Color3.new(1, 1, 1)
floatButton.Image = "rbxassetid://1234567890" -- Substitua pelo ID correto da imagem do ícone
floatButton.Parent = screenGui

-- Criar Frame do Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 200, 0, 200)
menuFrame.Position = UDim2.new(0, 70, 0, 10)
menuFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
menuFrame.Visible = false
menuFrame.Parent = screenGui

-- Criar Botão de Toggle ESP
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Text = "Toggle ESP"
toggleButton.Parent = menuFrame

-- Criar Slider para Velocidade
local speedSlider = Instance.new("TextLabel")
speedSlider.Size = UDim2.new(1, -20, 0, 30)
speedSlider.Position = UDim2.new(0, 10, 0, 70)
speedSlider.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
speedSlider.TextColor3 = Color3.new(1, 1, 1)
speedSlider.Text = "Speed: 16"
speedSlider.Parent = menuFrame

local speedBar = Instance.new("Frame")
speedBar.Size = UDim2.new(1, -40, 0, 10)
speedBar.Position = UDim2.new(0, 20, 0, 100)
speedBar.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
speedBar.Parent = menuFrame

local speedBarFill = Instance.new("Frame")
speedBarFill.Size = UDim2.new(0, 0, 1, 0)
speedBarFill.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
speedBarFill.Parent = speedBar

-- Criar Botão de Noclip
local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(1, -20, 0, 50)
noclipButton.Position = UDim2.new(0, 10, 0, 120)
noclipButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
noclipButton.TextColor3 = Color3.new(1, 1, 1)
noclipButton.Text = "Toggle Noclip"
noclipButton.Parent = menuFrame

local ESP_ENABLED = false
local Noclip_ENABLED = false
local player = game.Players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

-- Função para criar um "highlight" ao redor de um jogador
function CreateESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local highlight = Instance.new("BoxHandleAdornment")
        highlight.Name = "ESP"
        highlight.Size = player.Character:FindFirstChild("HumanoidRootPart").Size
        highlight.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
        highlight.Color3 = Color3.new(1, 0, 0)
        highlight.Transparency = 0.5
        highlight.AlwaysOnTop = true
        highlight.ZIndex = 0
        highlight.Parent = player.Character:FindFirstChild("HumanoidRootPart")
    end
end

-- Função para remover o "highlight"
function RemoveESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local highlight = player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("ESP")
        if highlight then
            highlight:Destroy()
        end
    end
end

-- Função para alternar o ESP
function ToggleESP()
    ESP_ENABLED = not ESP_ENABLED
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            if ESP_ENABLED then
                CreateESP(player)
            else
                RemoveESP(player)
            end
        end
    end
end

-- Função para alternar Noclip
function ToggleNoclip()
    Noclip_ENABLED = not Noclip_ENABLED
    while Noclip_ENABLED do
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        game:GetService("RunService").Stepped:Wait()
    end
end

-- Função para ajustar a velocidade
function AdjustSpeed(value)
    if humanoid then
        humanoid.WalkSpeed = value
        speedSlider.Text = "Speed: " .. value
    end
end

-- Conectar o botão de toggle à função ToggleESP
toggleButton.MouseButton1Click:Connect(ToggleESP)

-- Conectar o botão de toggle à função ToggleNoclip
noclipButton.MouseButton1Click:Connect(ToggleNoclip)

-- Mostrar ou esconder o menu ao clicar no botão flutuante
floatButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Monitorar novos jogadores entrando no jogo
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if ESP_ENABLED then
            CreateESP(player)
        end
    end)
end)

-- Monitorar jogadores existentes
for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        if player.Character then
            CreateESP(player)
        end
        player.CharacterAdded:Connect(function()
            if ESP_ENABLED then
                CreateESP(player)
            end
        end)
    end
end

-- Ajustar velocidade conforme a barra
speedBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local function updateSpeed()
            local delta = (mouse.X - speedBar.AbsolutePosition.X) / speedBar.AbsoluteSize.X
            delta = math.clamp(delta, 0, 1)
            speedBarFill.Size = UDim2.new(delta, 0, 1, 0)
            AdjustSpeed(math.floor(delta * 100))
        end
        updateSpeed()
        local connection
        connection = mouse.Move:Connect(updateSpeed)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                connection:Disconnect()
            end
        end)
    end
end)