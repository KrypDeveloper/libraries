Lib = {}

function Lib.TeleportPlayer(x, y, z)
  game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
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

function Lib.AdvancedEditor(states, value, type)
  if states == true
    if value > 30
      print("the limiter is 30 please desable limiter for more")
    else
      game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")[type] = value
    end
  elseif states == false
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")[type] = value
    end
end

return Lib
