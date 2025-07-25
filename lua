local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local fly = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local noclip = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local antikick = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local menu = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

--Properties:

Bumerhub.Name = "Bumer hub"
Bumerhub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Bumerhub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Bumerhub.ResetOnSpawn = false

Frame.Parent = Bumerhub
Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0432098769, 0, 0.13429752, 0)
Frame.Size = UDim2.new(0, 199, 0, 215)
Frame.Visible = false

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(143, 255, 165)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 199, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Bumer hub"
TextLabel.TextColor3 = Color3.fromRGB(63, 62, 62)
TextLabel.TextSize = 29.000
TextLabel.TextWrapped = true

fly.Name = "fly"
fly.Parent = Frame
fly.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
fly.BorderColor3 = Color3.fromRGB(186, 186, 186)
fly.BorderSizePixel = 0
fly.Position = UDim2.new(0.0452261306, 0, 0.265116274, 0)
fly.Size = UDim2.new(0, 74, 0, 32)
fly.Font = Enum.Font.Michroma
fly.Text = "fly"
fly.TextColor3 = Color3.fromRGB(0, 0, 0)
fly.TextSize = 14.000

UICorner.Parent = fly

noclip.Name = "noclip"
noclip.Parent = Frame
noclip.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
noclip.BorderColor3 = Color3.fromRGB(186, 186, 186)
noclip.BorderSizePixel = 0
noclip.Position = UDim2.new(0.0452261306, 0, 0.590697646, 0)
noclip.Size = UDim2.new(0, 74, 0, 32)
noclip.Font = Enum.Font.SciFi
noclip.Text = "noclip"
noclip.TextColor3 = Color3.fromRGB(0, 0, 0)
noclip.TextScaled = true
noclip.TextSize = 29.000
noclip.TextWrapped = true

UICorner_2.Parent = noclip

antikick.Name = "anti kick"
antikick.Parent = Frame
antikick.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
antikick.BorderColor3 = Color3.fromRGB(186, 186, 186)
antikick.BorderSizePixel = 0
antikick.Position = UDim2.new(0.572864294, 0, 0.265116274, 0)
antikick.Size = UDim2.new(0, 74, 0, 32)
antikick.Font = Enum.Font.Michroma
antikick.Text = "anti kick"
antikick.TextColor3 = Color3.fromRGB(0, 0, 0)
antikick.TextSize = 14.000

UICorner_3.Parent = antikick

menu.Name = "menu"
menu.Parent = Bumerhub
menu.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
menu.BorderSizePixel = 0
menu.Position = UDim2.new(0.22310406, 0, 0.262396693, 0)
menu.Size = UDim2.new(0, 53, 0, 50)
menu.Font = Enum.Font.SourceSans
menu.Text = "Bumer hub"
menu.TextColor3 = Color3.fromRGB(0, 0, 0)
menu.TextScaled = true
menu.TextSize = 14.000
menu.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(1, 5)
UICorner_4.Parent = menu

-- Scripts:

local function EGFXCM_fake_script() -- fly.LocalScript 
	local script = Instance.new('LocalScript', fly)

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
coroutine.wrap(EGFXCM_fake_script)()
local function GTHFEP_fake_script() -- noclip.LocalScript 
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
coroutine.wrap(GTHFEP_fake_script)()
local function REKYP_fake_script() -- antikick.LocalScript 
	local script = Instance.new('LocalScript', antikick)

	local button = script.Parent -- Ваша существующая кнопка GUI
	local player = game.Players.LocalPlayer
	local antiKickEnabled = false
	
	-- Защита от кика
	local function enableAntiKick(state)
		if state then
			-- Хук для блокировки киков
			local originalNamecall
			originalNamecall = hookmetamethod(game, "__namecall", function(self, ...)
				local method = getnamecallmethod()
				if method == "Kick" or method == "kick" then
					return nil -- Блокируем кик
				end
				return originalNamecall(self, ...)
			end)
	
			-- Защита от TeleportService
			game:GetService("TeleportService").Teleport = function() return true end
		else
			-- Восстанавливаем оригинальные функции (при отключении)
			if originalNamecall then
				unhookmetamethod(game, "__namecall", originalNamecall)
			end
		end
	end
	
	-- Клик по кнопке
	button.MouseButton1Click:Connect(function()
		antiKickEnabled = not antiKickEnabled
		enableAntiKick(antiKickEnabled)
	end)
	
	print("Анти-кик система готова к активации")
end
coroutine.wrap(REKYP_fake_script)()
local function EFCRKD_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local guiElement = script.Parent -- Элемент GUI, который будем двигать
	local player = game.Players.LocalPlayer
	local userInput = game:GetService("UserInputService")
	
	local dragging = false
	local dragStartPos
	local guiStartPos
	
	-- Функция для перемещения
	local function updatePosition(input)
		if dragging then
			local delta = input.Position - dragStartPos
			guiElement.Position = UDim2.new(
				guiStartPos.X.Scale, 
				guiStartPos.X.Offset + delta.X,
				guiStartPos.Y.Scale, 
				guiStartPos.Y.Offset + delta.Y
			)
		end
	end
	
	-- Обработчики ввода
	guiElement.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStartPos = input.Position
			guiStartPos = guiElement.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	userInput.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			updatePosition(input)
		end
	end)
end
coroutine.wrap(EFCRKD_fake_script)()
local function MLEM_fake_script() -- menu.LocalScript 
	local script = Instance.new('LocalScript', menu)

	local guiElement = script.Parent -- Элемент GUI, который будем двигать
	local player = game.Players.LocalPlayer
	local userInput = game:GetService("UserInputService")
	
	local dragging = false
	local dragStartPos
	local guiStartPos
	
	-- Функция для перемещения
	local function updatePosition(input)
		if dragging then
			local delta = input.Position - dragStartPos
			guiElement.Position = UDim2.new(
				guiStartPos.X.Scale, 
				guiStartPos.X.Offset + delta.X,
				guiStartPos.Y.Scale, 
				guiStartPos.Y.Offset + delta.Y
			)
		end
	end
	
	-- Обработчики ввода
	guiElement.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStartPos = input.Position
			guiStartPos = guiElement.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	userInput.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			updatePosition(input)
		end
	end)
end
coroutine.wrap(MLEM_fake_script)()
local function ZPYW_fake_script() -- menu.LocalScript 
	local script = Instance.new('LocalScript', menu)

	local player = game.Players.LocalPlayer
	local gui = player:WaitForChild("PlayerGui"):WaitForChild("Bumer hub")
	local button = script.Parent -- Ссылка на кнопку
	local frame = gui:WaitForChild("Frame") -- Ссылка на Frame
	
	-- Функция для открытия/закрытия Frame
	local function toggleFrame()
		frame.Visible = not frame.Visible -- Переключаем видимость Frame
	end
	
	-- Обработка нажатия кнопки
	button.MouseButton1Click:Connect(toggleFrame)
	
end
coroutine.wrap(ZPYW_fake_script)()
