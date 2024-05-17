local function a(className)
    return Instance.new(className)
end

Cosmos = {}

function Cosmos:Make(ClassName, Values)
   local instance = Instance.new(ClassName)
   for a,b in pairs(Values) do
       instance[a] = b
   end
   return instance
end

return Cosmos
