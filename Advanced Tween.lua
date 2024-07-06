local TweenService = game:GetService("TweenService")
Module = {}

function Module:Tween(Instance, Propertie, To)
  local TweenInfo = TweenInfo.new(
    (Instance[Propertie] - To),
    Enum.EasingStyle.Linear
  )
  
  local tween = TweenService:Create(
    Instance,
    TweenInfo,
    {Propertie = To}
  )
  return tween
end

return Module