# ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎ ‎ ‎  ‎ ‎ *Vape API*
**NOTES:**

  ‎ ‎ ‎ ‎ ‎ *NOTE 1:If you are a starter check this first* [DOCUMENTATION](https://github.com/KrypDeveloper/MAXIMUS-LIBRARY/blob/main/Vape/Documentation.md)
  
 ‎ ‎ ‎ ‎ ‎  *NOTE 2: Here will not have pre-styles if you are reading here make your own style check [Example.lua](https://github.com/KrypDeveloper/MAXIMUS-LIBRARY/blob/main/Vape/Example.lua)*

# START💻
##  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎ ‎ ‎ ‎ ‎ ‎ ‎  ‎ ‎ ‎  ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎‎ ‎ ‎  ‎ ‎ How i use Vape UI?
```lua
--‎Vape UI can be used with multi forms

---------------------------------------------FIRST EXAMPLE---------------------------------------------
local tab = Window:Tab("Normal Tab")

tab:Button("Click me", function()
  print("Clicked!")
end)

--------------------------------------------SECOND EXAMPLE--------------------------------------------
local Tabs = {
   Main = Window:Tab("Main"),
   Misc = Window:Tab("Misc"),
   Settings = Window:Tab("Settings")
}

Tabs.Main:Button("Click me", function()
  print("Clicked!")
end)
---------------------------------------------LAST EXAMPLE---------------------------------------------
local function CreateTab(Settings)
    local Tab = Window:Tab(Settings.TabName)
    for i, b in pairs(Settings.Buttons) do
        Tab:Button(i, function()
            b()
        end)
    end
end

CreateTab({
    TabName = "Main",
    Buttons = {
        Button1 = function()
            print("hello world")
        end
    }
})
```
## Tab
```lua
Window:Tab("Main")
```
## Window
```lua
Vape:Window("Vape Test",Color3.fromRGB(44, 120, 224),Enum.KeyCode.RightControl)
```
