<div align="center">

# COSMOS

### *What is "Cosmos"?*

``Cosmos is an Open Source Project to organize and make him more beautiful to humans``

</div>
<div align="center">
  Observation: Cosmos was inspired in project
  <a href="https://github.com/uniquadev/GuiToLuaConverter" style="text-decoration:none;">
  <button style="background-color: blue; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
    GuiToLua
  </button>
</a>
 made by uniquadev 

  # OBSERVATIONS
 For work Cosmos need loadstring and HttpGet or require in your LUAU Space
 if you luau space not Support directly require or loadstring and HttpGet
 you can Direct import code into your LUAU Space puthing this in start of you code
 ```lua
local function CosmosMake(ClassName, Values)
    local instance = Instance.new(ClassName)
    for a,b in pairs(Values) do
        instance[a] = b
    end
    return instance
end
```
</div>
