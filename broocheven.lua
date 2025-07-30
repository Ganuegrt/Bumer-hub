-- Gui to Lua
-- Version: 3.2

-- Instances:

local Bumerhub2 = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Bumer = Instance.new("TextLabel")
local Fly = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local noclip = Instance.new("TextButton")
local Broochaven = Instance.new("TextLabel")
local speed = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

--Properties:

Bumerhub2.Name = "Bumer hub 2"
Bumerhub2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Bumerhub2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Bumerhub2
Frame.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
Frame.BorderColor3 = Color3.fromRGB(193, 217, 137)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0432098731, 0, 0.0950413197, 0)
Frame.Size = UDim2.new(0, 254, 0, 272)

Bumer.Name = "Bumer"
Bumer.Parent = Frame
Bumer.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Bumer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bumer.BorderSizePixel = 0
Bumer.Size = UDim2.new(0, 254, 0, 58)
Bumer.Font = Enum.Font.SourceSans
Bumer.Text = "Bumer hub"
Bumer.TextColor3 = Color3.fromRGB(0, 0, 0)
Bumer.TextScaled = true
Bumer.TextSize = 60.000
Bumer.TextWrapped = true

Fly.Name = "Fly"
Fly.Parent = Frame
Fly.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Fly.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.0393700786, 0, 0.241895258, 0)
Fly.Size = UDim2.new(0, 91, 0, 50)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "Fly"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextScaled = true
Fly.TextSize = 14.000
Fly.TextWrapped = true

UICorner.Parent = Fly

noclip.Name = "noclip"
noclip.Parent = Frame
noclip.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
noclip.BorderColor3 = Color3.fromRGB(0, 0, 0)
noclip.BorderSizePixel = 0
noclip.Position = UDim2.new(0.0393700786, 0, 0.538653374, 0)
noclip.Size = UDim2.new(0, 91, 0, 50)
noclip.Font = Enum.Font.SourceSans
noclip.Text = "noclip"
noclip.TextColor3 = Color3.fromRGB(255, 255, 255)
noclip.TextScaled = true
noclip.TextSize = 14.000
noclip.TextWrapped = true

Broochaven.Name = "Broochaven"
Broochaven.Parent = Frame
Broochaven.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Broochaven.BackgroundTransparency = 1.000
Broochaven.BorderColor3 = Color3.fromRGB(0, 0, 0)
Broochaven.BorderSizePixel = 0
Broochaven.Position = UDim2.new(0.074069947, 0, 0.773638785, 0)
Broochaven.Size = UDim2.new(0, 200, 0, 50)
Broochaven.Font = Enum.Font.SourceSans
Broochaven.Text = "brookhaven"
Broochaven.TextColor3 = Color3.fromRGB(0, 0, 0)
Broochaven.TextScaled = true
Broochaven.TextSize = 14.000
Broochaven.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
speed.BorderColor3 = Color3.fromRGB(0, 0, 0)
speed.BorderSizePixel = 0
speed.Position = UDim2.new(0.55905509, 0, 0.241895229, 0)
speed.Size = UDim2.new(0, 91, 0, 50)
speed.Font = Enum.Font.SourceSans
speed.Text = "speed"
speed.TextColor3 = Color3.fromRGB(255, 255, 255)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

UICorner_2.Parent = speed

-- Scripts:

local function YOMLS_fake_script() -- Fly.LocalScript 
	local script = Instance.new('LocalScript', Fly)

	local button = script.Parent
	local player = game.Players.LocalPlayer
	local flying = false
	local flySpeed = 50 -- Скорость полёта
	local bodyVelocity -- Объявляем переменную заранее
	
	-- Функция полёта
	local function toggleFlight(enable)
		if not player.Character then return end
	
		local humanoid = player.Character:FindFirstChild("Humanoid")
		local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
	
		if not humanoid or not rootPart then return end
	
		if enable then
			-- Включаем полёт
			humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = Vector3.new(0, flySpeed, 0)
			bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
			bodyVelocity.Parent = rootPart
		else
			-- Выключаем полёт
			humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
			if bodyVelocity then
				bodyVelocity:Destroy()
			end
		end
	end
	
	-- Обработчик клика
	button.MouseButton1Click:Connect(function()
		flying = not flying
		toggleFlight(flying)
	end)
end
coroutine.wrap(YOMLS_fake_script)()
local function GKWYHU_fake_script() -- noclip.LocalScript 
	local script = Instance.new('LocalScript', noclip)

	local button = script.Parent
	local player = game.Players.LocalPlayer
	local noclipEnabled = false
	local connection
	
	local function noclip(character)
		for _, part in pairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = not noclipEnabled
			end
		end
	end
	
	local function onCharacterAdded(character)
		if noclipEnabled then
			noclip(character)
	
			connection = character:GetPropertyChangedSignal("Parent"):Connect(function()
				if not character.Parent then
					connection:Disconnect()
				end
			end)
		end
	end
	
	button.MouseButton1Click:Connect(function()
		noclipEnabled = not noclipEnabled
	
		if player.Character then
			noclip(player.Character)
		end
	
		if noclipEnabled then
			player.CharacterAdded:Connect(onCharacterAdded)
		else
			if connection then
				connection:Disconnect()
			end
		end
	end)
	
	-- Автоподключение при спавне
	player.CharacterAdded:Connect(function(character)
		if noclipEnabled then
			onCharacterAdded(character)
		end
	end)
end
coroutine.wrap(GKWYHU_fake_script)()
local function CLIJRO_fake_script() -- speed.LocalScript 
	local script = Instance.new('LocalScript', speed)

	-- Вставьте этот LocalScript в существующую кнопку GUI
	local button = script.Parent
	local player = game:GetService("Players").LocalPlayer
	local userInput = game:GetService("UserInputService")
	
	-- Настройки скорости
	local speedMultipliers = {1, 2, 3, 5}  -- Доступные множители скорости
	local currentSpeedIndex = 1
	local defaultWalkspeed = 16  -- Стандартная скорость
	
	-- Функция применения скорости
	local function applySpeed()
		if not player.Character then return end
	
		local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.WalkSpeed = defaultWalkspeed * speedMultipliers[currentSpeedIndex]
		end
	end
	
	-- Обработчик клика
	button.MouseButton1Click:Connect(function()
		-- Циклически меняем множитель скорости
		currentSpeedIndex = currentSpeedIndex + 1
		if currentSpeedIndex > #speedMultipliers then
			currentSpeedIndex = 1
		end
	
		-- Применяем новую скорость
		applySpeed()
	end)
	
	-- Автоматическое применение при смене персонажа
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChildOfClass("Humanoid")
		humanoid.WalkSpeed = defaultWalkspeed * speedMultipliers[currentSpeedIndex]
	end)
	
	-- Применяем начальную скорость
	applySpeed()
end
coroutine.wrap(CLIJRO_fake_script)()
