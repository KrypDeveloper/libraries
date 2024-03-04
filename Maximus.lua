Lib = {
  state = true
}

function Lib.TeleportPlayer(x, y, z)
  if Lib.state == true then
  game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
  end
end

function Lib.TeleportPlace(id)
  if Lib.state == true then
    game:GetService("TeleportService"):Teleport(id)
  end
end

function Lib.Desable()
  Lib.state = false
end

function Lib.Active()
  Lib.state = true
end

function Lib.KillPlayer()
  if Lib.state == true
  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
  end
end

return Lib
