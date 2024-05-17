--If you want to test use loadstring(game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Cosmos/example.lua"))()
local Cosmos = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Cosmos/source.luau")
)()

--Making UI

local ScreenGui = Cosmos:Make("ScreenGui",{
    Name = "ScreenGui"
})

ScreenGui.Parent = gethui()
local Canvas = Cosmos:Make("CanvasGroup",{
    Size = UDim2.new(0,300,0,200),
    Position = UDim2.new(0,260,0,90),
    BackgroundColor3 = Color3.fromRGB(22,22,29),
})

Canvas.Parent = ScreenGui()
local UiCorner = Cosmos:Make("UICorner", {
    Name = 'UICorner'
})

UiCorner.Parent = Canvas
