-- Função para mostrar o nome dos jogadores
function ShowPlayerNames()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Head") then
            local nameTag = player.Character.Head:FindFirstChild("NameTag")
            if not nameTag then
                nameTag = Instance.new("BillboardGui", player.Character.Head)
                nameTag.Name = "NameTag"
                nameTag.Size = UDim2.new(0, 100, 0, 50)
                nameTag.Adornee = player.Character.Head
                nameTag.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel", nameTag)
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = player.Name
                nameLabel.TextColor3 = Color3.new(1, 1, 1)
                nameLabel.TextStrokeTransparency = 0
            end
        end
    end
end

-- Função para ver jogadores através de paredes
function SeeThroughWalls()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Transparency < 1 then
            part.LocalTransparencyModifier = 0.5
        end
    end
end

-- Função para ajustar o pulo
function AdjustJumpPower(value)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = value
    end
end

-- Função para ajustar a velocidade
function AdjustWalkSpeed(value)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
end

-- Função para ativar o Aimbot
local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local localPlayer = game.Players.LocalPlayer
    local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local localRoot = localCharacter:WaitForChild("HumanoidRootPart")
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (localRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    
    return closestPlayer
end

function Aimbot()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    
    mouse.Button1Down:Connect(function()
        local closestPlayer = GetClosestPlayer()
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
            mouse.TargetFilter = closestPlayer.Character
            local aimAt = closestPlayer.Character.HumanoidRootPart
            mouse.Hit = CFrame.new(aimAt.Position)
        end
    end)
end

-- Ativar funcionalidades
ShowPlayerNames()
SeeThroughWalls()
AdjustJumpPower(100) -- Ajuste conforme necessário
AdjustWalkSpeed(100) -- Ajuste conforme necessário
Aimbot()