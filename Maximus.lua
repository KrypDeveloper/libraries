Lib = {
  PlayerName = game.Players.LocalPlayer.Name
}

function Lib.TeleportPlayer(x, y, z)
  game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
end

function Lib.getpos()
  return game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end

function Lib.getid()
  return game.PlaceId
end

function Lib.TeleportPlace(id)
    game:GetService("TeleportService"):Teleport(id)
end

function Lib.KillPlayer()
  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
end

function Lib.Load(link)
  loadstring(game:HttpGet(link))()
end

function Lib.IY()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end

function Lib.RemoveGui()
  game.Players.LocalPlayer:FindFirstChild("PlayerGui"):ClearAllChildren()
end

function Lib.SetSpeed(speed)
  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = speed
end

function Lib.Anchor(state)
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = state
end

return Lib
