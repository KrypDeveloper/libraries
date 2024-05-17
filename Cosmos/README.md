<div align="center">

# COSMOS

### *What is "Cosmos"?*

```
Cosmos is an Open Source Project to organize and make him more beautiful to humans
```
</div>
<div align="center">
  Observation: Cosmos was inspired in project
  <a href="https://github.com/uniquadev/GuiToLuaConverter" style="text-decoration:none;">
  <button style="background-color: blue; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
    GuiToLua
  </button>
</a>
 made by uniquadev 
  
<div align="center">

Observation: Cosmos was inspired by the project [GuiToLua](https://github.com/uniquadev/GuiToLuaConverter) made by uniquadev.

## [Check Example too](https://github.com/KrypDeveloper/MAXIMUS-LIBRARY/blob/main/Cosmos/example.lua)

## OBSERVATIONS
For Cosmos to work, it needs `loadstring` and `HttpGet` or `require` in your LUAU Space. If your LUAU Space does not support `require` or `loadstring` and `HttpGet` directly, you can directly import the code into your LUAU Space by putting this at the start of your code:

```lua
local function CosmosMake(ClassName, Values)
    local instance = Instance.new(ClassName)
    for a,b in pairs(Values) do
        instance[a] = b
    end
    return instance
end
```
