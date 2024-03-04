Lib = {
  state = true
}

function Lib.TeleportPlayer(x, y, z)
  game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
end

function Lib.TeleportPlace(id)
    game:GetService("TeleportService"):Teleport(id)
end

function Lib.Desable()
  Lib.state = false
end

function Lib.Active()
  Lib
  State = true
end

function Lib.KillPlayer()
  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
end

return Lib
