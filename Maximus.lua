Lib = {}
function Lib.TeleportPlayer(x, y, z)
  game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
end

  function Lib.TeleportPlace(id)
    game:GetService("TeleportService"):Teleport(id)
  end

return Lib
