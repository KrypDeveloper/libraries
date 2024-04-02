LSU = {
    PlayerName = game.Players.LocalPlayer.Name,
    Orion = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))(),
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

function LSU.TeleportPlayer(tabel)
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(tabel.X, tabel.Y, tabel.Z))
  end

  function LSU.Execute(tabela)
    for a,b in tabela do
      loadstring(b)
      print("elemento: ".. a.. " Executado")
      end
    end

  function LSU.TweenTp(tabel)
    local x = tabel.X
    local y = tabel.Y
    local z = tabel.Z
    local speed = tabel.time
    local tween_s = game:GetService('TweenService')
    local tweeninfo = TweenInfo.new(speed, Enum.EasingStyle.Linear)
    local lp = game.Players.LocalPlayer
  
    if lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
      local cf = CFrame.new(Vector3.new(x, y, z))
      local a = tween_s:Create(lp.Character.HumanoidRootPart, tweeninfo, {CFrame = cf})
      a:Play()
    end
  end

function LSU.TeleportId(id)
    game:GetService("TeleportService"):Teleport(id)
end

function LSU.suicide()
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
    else
        print("humanoid não encontrado")
    end
end

function SetPlayer(tabel)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        if tabel.Health ~= nil then
        humanoid.Health = tabel.Health
        end
        if tabel.WalkSpeed ~= nil then
        humanoid.WalkSpeed = tabel.WalkSpeed
        end
        if tabel.JumpPower ~= nil then
        humanoid.JumpPower = tabel.JumpPower
        end
    end
end

function Noclip(estado)
    local Noclip = nil
  local Clip = nil

  local function noclip()
    Clip = estado
    local function Nocl()
      if Clip == true and game.Players.LocalPlayer.Character ~= nil then
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
          if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
            v.CanCollide = false
          end
        end
      end
      wait(0.21)
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end
end

--INTERFACE GUI/UI

function LSU.CreateWindow(tabela)
  -- Gui to Lua
-- Version: 3.2

-- Instances:
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Tabs = Instance.new("ScrollingFrame")
local Folder = Instance.new("Folder")

--Properties:


ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.271897823, 0, -0.184, 250)
Frame.Size = UDim2.new(0, 500, 0, 300)

UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 500, 0, 50)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = tabela.Name
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner_2.Parent = TextLabel

Tabs.Name = "Tabs"
Tabs.Parent = Frame
Tabs.Active = true
Tabs.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0, 0, 0.166666672, 0)
Tabs.Size = UDim2.new(0, 124, 0, 239)
Tabs.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
Tabs.VerticalScrollBarInset = Enum.ScrollBarInset.Always
Tabs.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

Folder.Parent = Frame
getgenv().abapos = getgenv().abapos + 1
local Drag = tabela.Draggable
Frame.Active = Drag
Frame.Draggable = Drag
Frame.Selectable = Drag
TextLabel.Text = nome
end

function LSU.CreateTab(a, b)
  local function button(nome, identificador)
    local btn Instance.new("TextButton").Text = nome 
    btn.Position = UDim2.new(0.1, getgenv().abapos,0, 0)
   local Frame = Instance.new("Frame")
   Frame.Name = identificador
   Frame.Parent = ScreenGui
   Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
   Frame.BorderSizePixel = 0
   Frame.Position = UDim2.new(0.247999996, 0, 0.166666672, 0)
   Frame.Size = UDim2.new(0, 376, 0, 239)
    btn.MouseButton1Click:Connect(function()
        for _,obj in pairs(ScreenGui:FindFirstChild(identificador).Folder:GetDescendants()) do
          if obj.Name ~= identificador then
           obj.Visible = false
          else
           obj.Visible = true
          end
        end
    end)
   end
 button(a, b)
 getgenv().LastTab = a
end

function LSU.CreateButton(tabela)
  local TextButton = Instance.new("TextButton")
  TextButton.Parent = ScreenGui.Frame.Folder:FindFirstChild(getgenv().LastTab)
  TextButton.Position = getgenv().UltimaAbaPos
  TextButton.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
  TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
  TextButton.BorderSizePixel = 0
  TextButton.Size = UDim2.new(0, 376, 0, 50)
  TextButton.Font = Enum.Font.SourceSansBold
  TextButton.Text = tabela.Name
  TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  TextButton.TextScaled = true
  TextButton.TextSize = 14.000
  TextButton.TextWrapped = true
  TextButton.MouseButton1Click:Connect(function()
    tabela.Callback()
  end)
end


return LSU
