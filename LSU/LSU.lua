LSU = {
    PlayerName = game.Players.LocalPlayer.Name,
    Orion = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))(),
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
}

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


return LSU