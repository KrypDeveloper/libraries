local TweenService = game:GetService("TweenService")
Module = {}

function Module:Tween(Instance, To)
  local TweenInfo = TweenInfo.new(
    (CFrame.new(Instance.Position) - To).Magnitude,
    Enum.EasingStyle.Linear
  )
  
  local tween = TweenService:Create(
    Instance,
    TweenInfo,
    {CFrame = To}
  )
  return tween
end

return Module
