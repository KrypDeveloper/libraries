# Vape V2(non oficial)
### *Why use Vape?* 

- [X] Beautiful
- [X] Optimized
- [X] Easy to use
- [ ] Fires all anti cheats
- [X] Mobile Friendly

## Init🔌
```lua
local Vape = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Vape/V2/source.lua")()
```
## Window✨
```lua
local Window = Vape:Window(
Name = "Vape Test",
Color = Color3.fromRGB(44, 120, 224),
KeyCode = Enum.KeyCode.RightControl,
KeySystemSettings = {
    Service = "pandadevkit",
    AutoLogin = true,
    Active = true
}
)
```
## Tab🚪
```lua
local Tab = Window:Tab("Main")
```
## Create Button🔘
```lua
Tab:Button("My Button", function()
  print("Clicked!")
end)
```
## Notification💡
```lua
Vape:Notification(
  "Vape", --Title
  "Hello!", --Content
  "Hi!" --SubContent
)
```
## Toggle👇
```lua
Tab:Toggle(
  "Toggle", --Toggle Name
  false,
  function(Value)
    print(Value)
  end)
```
## Slider🎧
```lua
Tab:Slider(
  "Slider", --Name
  0,100,30, --Value
  function(Value) --Callback
    print(Value)
  end
)
```
## Dropdown⏬
```lua
Tab:Dropdown(
  "Dropdown", --Name
  {"Option 1","Option 2","Option 3","Option 4","Option 5"}, --Options
  function(Value) --Callback
    print(Value)
  end
)
```
## ColorPicker🌈
```lua
Tab:Colorpicker(
  "Colorpicker", --Name
  Color3.fromRGB(255,0,0), --Default Color
  function(Value) --Callback
    print(Value)
  end
)
```
## TextBox📝
```lua
Tab:Textbox("Textbox", --Name
  true, function(Value) --Callback
    print(Value)
  end
)
```
## KeyBind🎹
```lua
Tab:Bind(
  "KeyBind", --Name
  Enum.KeyCode.RightShift, --Keybind
  function() --Callback
      print("Pressed!")
  end
)
```
## Label🔤
```lua
Tab:Label("Label")
```
## Change UI Color🟥🟦🟨
```lua
Vape:ChangePresetColor(Color3.fromRGB(255,255,255))
```
