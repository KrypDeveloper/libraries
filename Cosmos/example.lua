local Cosmos = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/KrypDeveloper/MAXIMUS-LIBRARY/main/Cosmos/source.luau")
))()

local MyElement = Cosmos:Make({
    ClassName = "Part",
    Size = Vector3.new(4, 1, 2),
    Color = Color3.fromRGB(255, 0, 0)
})

MyElement().Parent = workspace

--Making UI

local ScreenGui = Cosmos:Make({
    ClassName = "ScreenGui"
})

ScreenGui().Parent = gethui()
local Canvas = Cosmos:Make({
    ClassName = "CanvasGroup",
    Size = UDim2.new(0,300,0,200),
    Position = UDim2.new(0,260,0,90),
    BackgroundColor3 = Color3.fromRGB(22,22,29),
})

Canvas().Parent = ScreenGui()
local UiCorner = Cosmos:Make({
    ClassName = "UICorner",
})
UiCorner().Parent = Canvas()
