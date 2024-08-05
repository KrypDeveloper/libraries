local L_1_ = game:GetService("UserInputService")
local L_2_ = game:GetService("TweenService")
local L_3_ = game:GetService("RunService")
local L_4_ = game:GetService("Players").LocalPlayer
local L_5_ = L_4_:GetMouse()
local L_6_ = game:GetService("HttpService")

local L_7_ = {
	Elements = {},
	ThemeObjects = {},
	Connections = {},
	Flags = {},
	Themes = {
		Default = {
			Main = Color3.fromRGB(25, 25, 35),
			Second = Color3.fromRGB(32, 32, 42),
			Stroke = Color3.fromRGB(37, 37, 47),
			Divider = Color3.fromRGB(60, 60, 70),
			Text = Color3.fromRGB(240, 240, 240),
			TextDark = Color3.fromRGB(150, 150, 150)
		}
	},
	SelectedTheme = "Default",
	Folder = nil,
	SaveCfg = false
}

--Feather Icons https://github.com/evoincorp/lucideblox/tree/master/src/modules/util - Created by 7kayoh
local L_8_ = {}

local L_9_, L_10_ = pcall(function()
	L_8_ = L_6_:JSONDecode(game:HttpGetAsync("https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json")).icons
end)

if not L_9_ then
	warn("\nOrion Library - Failed to load Feather Icons. Error code: " .. L_10_ .. "\n")
end	

local function L_11_func(L_32_arg0)
	if L_8_[L_32_arg0] ~= nil then
		return L_8_[L_32_arg0]
	else
		return nil
	end
end   

local L_12_ = Instance.new("ScreenGui")
L_12_.Name = "Orion"
if syn then
	syn.protect_gui(L_12_)
	L_12_.Parent = game.CoreGui
else
	L_12_.Parent = gethui() or game.CoreGui
end

function L_7_:IsRunning()
	if gethui then
		return L_12_.Parent == gethui()
	else
		return L_12_.Parent == game:GetService("CoreGui")
	end

end

local function L_13_func(L_33_arg0, L_34_arg1)
	if (not L_7_:IsRunning()) then
		return
	end
	local L_35_ = L_33_arg0:Connect(L_34_arg1)
	table.insert(L_7_.Connections, L_35_)
	return L_35_
end

task.spawn(function()
	while (L_7_:IsRunning()) do
		wait()
	end

	for L_36_forvar0, L_37_forvar1 in next, L_7_.Connections do
		L_37_forvar1:Disconnect()
	end
end)

local function L_14_func(L_38_arg0, L_39_arg1)
	pcall(function()
		local L_40_, L_41_, L_42_, L_43_ = false
		L_13_func(L_38_arg0.InputBegan, function(L_44_arg0)
			if L_44_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_44_arg0.UserInputType == Enum.UserInputType.Touch then
				L_40_ = true
				L_42_ = L_44_arg0.Position
				L_43_ = L_39_arg1.Position

				L_44_arg0.Changed:Connect(function()
					if L_44_arg0.UserInputState == Enum.UserInputState.End then
						L_40_ = false
					end
				end)
			end
		end)
		L_13_func(L_38_arg0.InputChanged, function(L_45_arg0)
			if L_45_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_45_arg0.UserInputType == Enum.UserInputType.Touch then
				L_41_ = L_45_arg0
			end
		end)
		L_13_func(L_1_.InputChanged, function(L_46_arg0)
			if L_46_arg0 == L_41_ and L_40_ then
				local L_47_ = L_46_arg0.Position - L_42_
				L_2_:Create(L_39_arg1, TweenInfo.new(0.05, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Position = UDim2.new(L_43_.X.Scale, L_43_.X.Offset + L_47_.X, L_43_.Y.Scale, L_43_.Y.Offset + L_47_.Y)
				}):Play()
				L_39_arg1.Position = UDim2.new(L_43_.X.Scale, L_43_.X.Offset + L_47_.X, L_43_.Y.Scale, L_43_.Y.Offset + L_47_.Y)
			end
		end)
	end)
end    

local function L_15_func(L_48_arg0, L_49_arg1, L_50_arg2)
	local L_51_ = Instance.new(L_48_arg0)
	for L_52_forvar0, L_53_forvar1 in next, L_49_arg1 or {} do
		L_51_[L_52_forvar0] = L_53_forvar1
	end
	for L_54_forvar0, L_55_forvar1 in next, L_50_arg2 or {} do
		L_55_forvar1.Parent = L_51_
	end
	return L_51_
end

local function L_16_func(L_56_arg0, L_57_arg1)
	L_7_.Elements[L_56_arg0] = function(...)
		return L_57_arg1(...)
	end
end

local function L_17_func(L_58_arg0, ...)
	local L_59_ = L_7_.Elements[L_58_arg0](...)
	return L_59_
end

local function L_18_func(L_60_arg0, L_61_arg1)
	table.foreach(L_61_arg1, function(L_62_arg0, L_63_arg1)
		L_60_arg0[L_62_arg0] = L_63_arg1
	end)
	return L_60_arg0
end

local function L_19_func(L_64_arg0, L_65_arg1)
	table.foreach(L_65_arg1, function(L_66_arg0, L_67_arg1)
		L_67_arg1.Parent = L_64_arg0
	end)
	return L_64_arg0
end

local function L_20_func(L_68_arg0, L_69_arg1)
	local L_70_ = math.floor(L_68_arg0 / L_69_arg1 + (math.sign(L_68_arg0) * 0.5)) * L_69_arg1
	if L_70_ < 0 then
		L_70_ = L_70_ + L_69_arg1
	end
	return L_70_
end

local function L_21_func(L_71_arg0)
	if L_71_arg0:IsA("Frame") or L_71_arg0:IsA("TextButton") then
		return "BackgroundColor3"
	end 
	if L_71_arg0:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	end 
	if L_71_arg0:IsA("UIStroke") then
		return "Color"
	end 
	if L_71_arg0:IsA("TextLabel") or L_71_arg0:IsA("TextBox") then
		return "TextColor3"
	end   
	if L_71_arg0:IsA("ImageLabel") or L_71_arg0:IsA("ImageButton") then
		return "ImageColor3"
	end   
end

local function L_22_func(L_72_arg0, L_73_arg1)
	if not L_7_.ThemeObjects[L_73_arg1] then
		L_7_.ThemeObjects[L_73_arg1] = {}
	end    
	table.insert(L_7_.ThemeObjects[L_73_arg1], L_72_arg0)
	L_72_arg0[L_21_func(L_72_arg0)] = L_7_.Themes[L_7_.SelectedTheme][L_73_arg1]
	return L_72_arg0
end    

local function L_23_func()
	for L_74_forvar0, L_75_forvar1 in pairs(L_7_.ThemeObjects) do
		for L_76_forvar0, L_77_forvar1 in pairs(L_75_forvar1) do
			L_77_forvar1[L_21_func(L_77_forvar1)] = L_7_.Themes[L_7_.SelectedTheme][L_74_forvar0]
		end    
	end    
end

local function L_24_func(L_78_arg0)
	return {
		R = L_78_arg0.R * 255,
		G = L_78_arg0.G * 255,
		B = L_78_arg0.B * 255
	}
end    

local function L_25_func(L_79_arg0)
	return Color3.fromRGB(L_79_arg0.R, L_79_arg0.G, L_79_arg0.B)
end

local function L_26_func(L_80_arg0)
	local L_81_ = L_6_:JSONDecode(L_80_arg0)
	table.foreach(L_81_, function(L_82_arg0, L_83_arg1)
		if L_7_.Flags[L_82_arg0] then
			spawn(function() 
				if L_7_.Flags[L_82_arg0].Type == "Colorpicker" then
					L_7_.Flags[L_82_arg0]:Set(L_25_func(L_83_arg1))
				else
					L_7_.Flags[L_82_arg0]:Set(L_83_arg1)
				end    
			end)
		else
			warn("Orion Library Config Loader - Could not find ", L_82_arg0, L_83_arg1)
		end
	end)
end

local function L_27_func(L_84_arg0)
	local L_85_ = {}
	for L_86_forvar0, L_87_forvar1 in pairs(L_7_.Flags) do
		if L_87_forvar1.Save then
			if L_87_forvar1.Type == "Colorpicker" then
				L_85_[L_86_forvar0] = L_24_func(L_87_forvar1.Value)
			else
				L_85_[L_86_forvar0] = L_87_forvar1.Value
			end
		end	
	end
end

local L_28_ = {
	Enum.UserInputType.MouseButton1,
	Enum.UserInputType.MouseButton2,
	Enum.UserInputType.MouseButton3,
	Enum.UserInputType.Touch
}
local L_29_ = {
	Enum.KeyCode.Unknown,
	Enum.KeyCode.W,
	Enum.KeyCode.A,
	Enum.KeyCode.S,
	Enum.KeyCode.D,
	Enum.KeyCode.Up,
	Enum.KeyCode.Left,
	Enum.KeyCode.Down,
	Enum.KeyCode.Right,
	Enum.KeyCode.Slash,
	Enum.KeyCode.Tab,
	Enum.KeyCode.Backspace,
	Enum.KeyCode.Escape
}

local function L_30_func(L_88_arg0, L_89_arg1)
	for L_90_forvar0, L_91_forvar1 in next, L_88_arg0 do
		if L_91_forvar1 == L_89_arg1 then
			return true
		end
	end
end

L_16_func("Corner", function(L_92_arg0, L_93_arg1)
	local L_94_ = L_15_func("UICorner", {
		CornerRadius = UDim.new(L_92_arg0 or 0, L_93_arg1 or 10)
	})
	return L_94_
end)

L_16_func("Stroke", function(L_95_arg0, L_96_arg1)
	local L_97_ = L_15_func("UIStroke", {
		Color = L_95_arg0 or Color3.fromRGB(255, 255, 255),
		Thickness = L_96_arg1 or 1
	})
	return L_97_
end)

L_16_func("List", function(L_98_arg0, L_99_arg1)
	local L_100_ = L_15_func("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(L_98_arg0 or 0, L_99_arg1 or 0)
	})
	return L_100_
end)

L_16_func("Padding", function(L_101_arg0, L_102_arg1, L_103_arg2, L_104_arg3)
	local L_105_ = L_15_func("UIPadding", {
		PaddingBottom = UDim.new(0, L_101_arg0 or 4),
		PaddingLeft = UDim.new(0, L_102_arg1 or 4),
		PaddingRight = UDim.new(0, L_103_arg2 or 4),
		PaddingTop = UDim.new(0, L_104_arg3 or 4)
	})
	return L_105_
end)

L_16_func("TFrame", function()
	local L_106_ = L_15_func("Frame", {
		BackgroundTransparency = 1
	})
	return L_106_
end)

L_16_func("Frame", function(L_107_arg0)
	local L_108_ = L_15_func("Frame", {
		BackgroundColor3 = L_107_arg0 or Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	})
	return L_108_
end)

L_16_func("RoundFrame", function(L_109_arg0, L_110_arg1, L_111_arg2)
	local L_112_ = L_15_func("Frame", {
		BackgroundColor3 = L_109_arg0 or Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	}, {
		L_15_func("UICorner", {
			CornerRadius = UDim.new(L_110_arg1, L_111_arg2)
		})
	})
	return L_112_
end)

L_16_func("Button", function()
	local L_113_ = L_15_func("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	})
	return L_113_
end)

L_16_func("ScrollFrame", function(L_114_arg0, L_115_arg1)
	local L_116_ = L_15_func("ScrollingFrame", {
		BackgroundTransparency = 1,
		MidImage = "rbxassetid://7445543667",
		BottomImage = "rbxassetid://7445543667",
		TopImage = "rbxassetid://7445543667",
		ScrollBarImageColor3 = L_114_arg0,
		BorderSizePixel = 0,
		ScrollBarThickness = L_115_arg1,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	})
	return L_116_
end)

L_16_func("Image", function(L_117_arg0)
	local L_118_ = L_15_func("ImageLabel", {
		Image = L_117_arg0,
		BackgroundTransparency = 1
	})

	if L_11_func(L_117_arg0) ~= nil then
		L_118_.Image = L_11_func(L_117_arg0)
	end	

	return L_118_
end)

L_16_func("ImageButton", function(L_119_arg0)
	local L_120_ = L_15_func("ImageButton", {
		Image = L_119_arg0,
		BackgroundTransparency = 1
	})
	return L_120_
end)

L_16_func("Label", function(L_121_arg0, L_122_arg1, L_123_arg2)
	local L_124_ = L_15_func("TextLabel", {
		Text = L_121_arg0 or "",
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextTransparency = L_123_arg2 or 0,
		TextSize = L_122_arg1 or 15,
		Font = Enum.Font.Roboto,
		RichText = true,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	return L_124_
end)

local L_31_ = L_18_func(L_19_func(L_17_func("TFrame"), {
	L_18_func(L_17_func("List"), {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, 5)
	})
}), {
	Position = UDim2.new(1, -25, 1, -25),
	Size = UDim2.new(0, 300, 1, -25),
	AnchorPoint = Vector2.new(1, 1),
	Parent = L_12_
})

function L_7_:MakeNotification(L_125_arg0)
	spawn(function()
		L_125_arg0.Name = L_125_arg0.Name or "Notification"
		L_125_arg0.Content = L_125_arg0.Content or "Test"
		L_125_arg0.Image = L_125_arg0.Image or "rbxassetid://4384403532"
		L_125_arg0.Time = L_125_arg0.Time or 15

		local L_126_ = L_18_func(L_17_func("TFrame"), {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = L_31_
		})

		local L_127_ = L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(25, 25, 25), 0, 10), {
			Parent = L_126_, 
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(1, -55, 0, 0),
			BackgroundTransparency = 0,
			AutomaticSize = Enum.AutomaticSize.Y
		}), {
			L_17_func("Stroke", Color3.fromRGB(93, 93, 93), 1.2),
			L_17_func("Padding", 12, 12, 12, 12),
			L_18_func(L_17_func("Image", L_125_arg0.Image), {
				Size = UDim2.new(0, 20, 0, 20),
				ImageColor3 = Color3.fromRGB(240, 240, 240),
				Name = "Icon"
			}),
			L_18_func(L_17_func("Label", L_125_arg0.Name, 15), {
				Size = UDim2.new(1, -30, 0, 20),
				Position = UDim2.new(0, 30, 0, 0),
				Font = Enum.Font.GothamBold,
				Name = "Title"
			}),
			L_18_func(L_17_func("Label", L_125_arg0.Content, 14), {
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0, 0, 0, 25),
				Font = Enum.Font.GothamSemibold,
				Name = "Content",
				AutomaticSize = Enum.AutomaticSize.Y,
				TextColor3 = Color3.fromRGB(200, 200, 200),
				TextWrapped = true
			})
		})

		L_2_:Create(L_127_, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
			Position = UDim2.new(0, 0, 0, 0)
		}):Play()

		wait(L_125_arg0.Time - 0.88)
		L_2_:Create(L_127_.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
			ImageTransparency = 1
		}):Play()
		L_2_:Create(L_127_, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {
			BackgroundTransparency = 0.6
		}):Play()
		wait(0.3)
		L_2_:Create(L_127_.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
			Transparency = 0.9
		}):Play()
		L_2_:Create(L_127_.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
			TextTransparency = 0.4
		}):Play()
		L_2_:Create(L_127_.Content, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
			TextTransparency = 0.5
		}):Play()
		wait(0.05)

		L_127_:TweenPosition(UDim2.new(1, 20, 0, 0), 'In', 'Quint', 0.8, true)
		wait(1.35)
		L_127_:Destroy()
	end)
end    

function L_7_:Init()
	if L_7_.SaveCfg then	
		pcall(function()
			if isfile(L_7_.Folder .. "/" .. game.GameId .. ".txt") then
				L_26_func(readfile(L_7_.Folder .. "/" .. game.GameId .. ".txt"))
				L_7_:MakeNotification({
					Name = "Configuration",
					Content = "Auto-loaded configuration for the game " .. game.GameId .. ".",
					Time = 5
				})
			end
		end)		
	end	
end	

function L_7_:MakeWindow(L_128_arg0)
	local L_129_ = true
	local L_130_ = false
	local L_131_ = false
	local L_132_ = false

	L_128_arg0 = L_128_arg0 or {}
	L_128_arg0.Name = L_128_arg0.Name or "Orion Library"
	L_128_arg0.ConfigFolder = L_128_arg0.ConfigFolder or L_128_arg0.Name
	L_128_arg0.SaveConfig = L_128_arg0.SaveConfig or false
	L_128_arg0.HidePremium = L_128_arg0.HidePremium or false
	if L_128_arg0.IntroEnabled == nil then
		L_128_arg0.IntroEnabled = true
	end
	L_128_arg0.IntroText = L_128_arg0.IntroText or "Orion Library"
	L_128_arg0.CloseCallback = L_128_arg0.CloseCallback or function()
	end
	L_128_arg0.ShowIcon = L_128_arg0.ShowIcon or false
	L_128_arg0.Icon = L_128_arg0.Icon or "rbxassetid://8834748103"
	L_128_arg0.IntroIcon = L_128_arg0.IntroIcon or "rbxassetid://8834748103"
	L_7_.Folder = L_128_arg0.ConfigFolder
	L_7_.SaveCfg = L_128_arg0.SaveConfig

	if L_128_arg0.SaveConfig then
		if not isfolder(L_128_arg0.ConfigFolder) then
			makefolder(L_128_arg0.ConfigFolder)
		end	
	end

	local L_133_ = L_22_func(L_19_func(L_18_func(L_17_func("ScrollFrame", Color3.fromRGB(255, 255, 255), 4), {
		Size = UDim2.new(1, 0, 1, -50)
	}), {
		L_17_func("List"),
		L_17_func("Padding", 8, 0, 0, 8)
	}), "Divider")

	L_13_func(L_133_.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		L_133_.CanvasSize = UDim2.new(0, 0, 0, L_133_.UIListLayout.AbsoluteContentSize.Y + 16)
	end)

	local L_134_ = L_19_func(L_18_func(L_17_func("Button"), {
		Size = UDim2.new(0.5, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = 1
	}), {
		L_22_func(L_18_func(L_17_func("Image", "rbxassetid://7072725342"), {
			Position = UDim2.new(0, 9, 0, 6),
			Size = UDim2.new(0, 18, 0, 18)
		}), "Text")
	})

	local L_135_ = L_19_func(L_18_func(L_17_func("Button"), {
		Size = UDim2.new(0.5, 0, 1, 0),
		BackgroundTransparency = 1
	}), {
		L_22_func(L_18_func(L_17_func("Image", "rbxassetid://7072719338"), {
			Position = UDim2.new(0, 9, 0, 6),
			Size = UDim2.new(0, 18, 0, 18),
			Name = "Ico"
		}), "Text")
	})

	local L_136_ = L_18_func(L_17_func("TFrame"), {
		Size = UDim2.new(1, 0, 0, 50)
	})

	local L_137_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
		Size = UDim2.new(0, 150, 1, -50),
		Position = UDim2.new(0, 0, 0, 50)
	}), {
		L_22_func(L_18_func(L_17_func("Frame"), {
			Size = UDim2.new(1, 0, 0, 10),
			Position = UDim2.new(0, 0, 0, 0)
		}), "Second"), 
		L_22_func(L_18_func(L_17_func("Frame"), {
			Size = UDim2.new(0, 10, 1, 0),
			Position = UDim2.new(1, -10, 0, 0)
		}), "Second"), 
		L_22_func(L_18_func(L_17_func("Frame"), {
			Size = UDim2.new(0, 1, 1, 0),
			Position = UDim2.new(1, -1, 0, 0)
		}), "Stroke"), 
		L_133_,
		L_19_func(L_18_func(L_17_func("TFrame"), {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, -50)
		}), {
			L_22_func(L_18_func(L_17_func("Frame"), {
				Size = UDim2.new(1, 0, 0, 1)
			}), "Stroke"), 
			L_22_func(L_19_func(L_18_func(L_17_func("Frame"), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(0, 10, 0.5, 0)
			}), {
				L_18_func(L_17_func("Image", "https://www.roblox.com/headshot-thumbnail/image?userId=" .. L_4_.UserId .. "&width=420&height=420&format=png"), {
					Size = UDim2.new(1, 0, 1, 0)
				}),
				L_22_func(L_18_func(L_17_func("Image", "rbxassetid://4031889928"), {
					Size = UDim2.new(1, 0, 1, 0),
				}), "Second"),
				L_17_func("Corner", 1)
			}), "Divider"),
			L_19_func(L_18_func(L_17_func("TFrame"), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(0, 10, 0.5, 0)
			}), {
				L_22_func(L_17_func("Stroke"), "Stroke"),
				L_17_func("Corner", 1)
			}),
			L_22_func(L_18_func(L_17_func("Label", "User", L_128_arg0.HidePremium and 14 or 13), {
				Size = UDim2.new(1, -60, 0, 13),
				Position = L_128_arg0.HidePremium and UDim2.new(0, 50, 0, 19) or UDim2.new(0, 50, 0, 12),
				Font = Enum.Font.GothamBold,
				ClipsDescendants = true
			}), "Text"),
			L_22_func(L_18_func(L_17_func("Label", "", 12), {
				Size = UDim2.new(1, -60, 0, 12),
				Position = UDim2.new(0, 50, 1, -25),
				Visible = not L_128_arg0.HidePremium
			}), "TextDark")
		}),
	}), "Second")

	local L_138_ = L_22_func(L_18_func(L_17_func("Label", L_128_arg0.Name, 14), {
		Size = UDim2.new(1, -30, 2, 0),
		Position = UDim2.new(0, 25, 0, -24),
		Font = Enum.Font.GothamBlack,
		TextSize = 20
	}), "Text")

	local L_139_ = L_22_func(L_18_func(L_17_func("Frame"), {
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1)
	}), "Stroke")

	local L_140_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
		Parent = L_12_,
		Position = UDim2.new(0.5, -307, 0.5, -172),
		Size = UDim2.new(0, 615, 0, 344),
		ClipsDescendants = true
	}), {
		L_19_func(L_18_func(L_17_func("TFrame"), {
			Size = UDim2.new(1, 0, 0, 50),
			Name = "TopBar"
		}), {
			L_138_,
			L_139_,
			L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 7), {
				Size = UDim2.new(0, 70, 0, 30),
				Position = UDim2.new(1, -90, 0, 10)
			}), {
				L_22_func(L_17_func("Stroke"), "Stroke"),
				L_22_func(L_18_func(L_17_func("Frame"), {
					Size = UDim2.new(0, 1, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0)
				}), "Stroke"), 
				L_134_,
				L_135_
			}), "Second"), 
		}),
		L_136_,
		L_137_
	}), "Main")

	if L_128_arg0.ShowIcon then
		L_138_.Position = UDim2.new(0, 50, 0, -24)
		local L_149_ = L_18_func(L_17_func("Image", L_128_arg0.Icon), {
			Size = UDim2.new(0, 20, 0, 20),
			Position = UDim2.new(0, 25, 0, 15)
		})
		L_149_.Parent = L_140_.TopBar
	end	

	L_14_func(L_136_, L_140_)

	L_13_func(L_134_.MouseButton1Up, function()
		L_140_.Visible = false
		L_132_ = true
		L_7_:MakeNotification({
			Name = "Interface Hidden",
			Content = "Tap Left Control to reopen the interface",
			Time = 5
		})
		L_128_arg0.CloseCallback()
	end)

	L_13_func(L_1_.InputBegan, function(L_150_arg0)
		if L_150_arg0.KeyCode == Enum.KeyCode.LeftControl and L_132_ == true then
			L_140_.Visible = true
		end
	end)

	L_13_func(L_135_.MouseButton1Up, function()
		if L_130_ then
			L_2_:Create(L_140_, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 615, 0, 344)
			}):Play()
			L_135_.Ico.Image = "rbxassetid://7072719338"
			wait(.02)
			L_140_.ClipsDescendants = false
			L_137_.Visible = true
			L_139_.Visible = true
		else
			L_140_.ClipsDescendants = true
			L_139_.Visible = false
			L_135_.Ico.Image = "rbxassetid://7072720870"

			L_2_:Create(L_140_, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, L_138_.TextBounds.X + 140, 0, 50)
			}):Play()
			wait(0.1)
			L_137_.Visible = false	
		end
		L_130_ = not L_130_    
	end)
	
	local L_141_ = Instance.new("ScreenGui", L_12_)
	L_141_.Name = "FloatNoob"
	L_141_.IgnoreGuiInset = true
	L_141_.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	L_141_.ResetOnSpawn = false
	local L_142_ = Instance.new("Sound", L_141_)
	L_142_.Name = "ClickSound"
	L_142_.SoundId = "rbxassetid://5273899897"
	local L_143_ = Instance.new("Frame", L_141_)
	L_143_.Name = "TopbarContainer"
	L_143_.Size = UDim2.new(1, 0, 0, 36)
	L_143_.BackgroundTransparency = 1
	local L_144_ = Instance.new("Frame", L_143_)
	L_144_.Name = "Main"
	L_144_.Size = UDim2.new(0, 32, 0, 32)
	L_144_.Position = UDim2.new(0, 104, 0, 4)
	L_144_.BackgroundTransparency = 1
	local L_145_ = Instance.new("ImageButton", L_144_)
	L_145_.Name = "IconButton"
	L_145_.Size = UDim2.new(1, 0, 1, 0)
	L_145_.Position = UDim2.new(0, 300, 0, -4)
	L_145_.BorderSizePixel = 0
	L_145_.Image = "rbxassetid://9794613660"
	L_145_.ImageColor3 = Color3.fromRGB(246, 246, 246)
	L_145_.ImageTransparency = 0.1
	L_145_.ScaleType = Enum.ScaleType.Crop
	L_145_.BackgroundTransparency = 1
	local L_146_ = Instance.new("UICorner", L_145_)
	L_146_.CornerRadius = UDim.new(0.25, 0)
	L_145_.MouseButton1Click:Connect(function()
		if L_130_ then
			L_2_:Create(L_140_, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 615, 0, 344)
			}):Play()
			L_135_.Ico.Image = "rbxassetid://7072719338"
			wait(.02)
			L_140_.ClipsDescendants = false
			L_137_.Visible = true
			L_139_.Visible = true
		else
			L_140_.ClipsDescendants = true
			L_139_.Visible = false
			L_135_.Ico.Image = "rbxassetid://7072720870"

			L_2_:Create(L_140_, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, L_138_.TextBounds.X + 140, 0, 50)
			}):Play()
			wait(0.1)
			L_137_.Visible = false	
		end
		L_130_ = not L_130_
	end)

	local function L_147_func()
		L_140_.Visible = false
		local L_151_ = L_18_func(L_17_func("Image", L_128_arg0.IntroIcon), {
			Parent = L_12_,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.4, 0),
			Size = UDim2.new(0, 28, 0, 28),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			ImageTransparency = 1
		})

		local L_152_ = L_18_func(L_17_func("Label", L_128_arg0.IntroText, 14), {
			Parent = L_12_,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 19, 0.5, 0),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = Enum.Font.GothamBold,
			TextTransparency = 1
		})

		L_2_:Create(L_151_, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			ImageTransparency = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
		wait(0.8)
		L_2_:Create(L_151_, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, - (L_152_.TextBounds.X / 2), 0.5, 0)
		}):Play()
		wait(0.3)
		L_2_:Create(L_152_, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextTransparency = 0
		}):Play()
		wait(2)
		L_2_:Create(L_152_, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextTransparency = 1
		}):Play()
		L_140_.Visible = true
		L_151_:Destroy()
		L_152_:Destroy()
	end 

	if L_128_arg0.IntroEnabled then
		L_147_func()
	end	

	local L_148_ = {}
	function L_148_:MakeTab(L_153_arg0)
		L_153_arg0 = L_153_arg0 or {}
		L_153_arg0.Name = L_153_arg0.Name or "Tab"
		L_153_arg0.Icon = L_153_arg0.Icon or ""
		L_153_arg0.PremiumOnly = L_153_arg0.PremiumOnly or false

		local L_154_ = L_19_func(L_18_func(L_17_func("Button"), {
			Size = UDim2.new(1, 0, 0, 30),
			Parent = L_133_
		}), {
			L_22_func(L_18_func(L_17_func("Image", L_153_arg0.Icon), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(0, 10, 0.5, 0),
				ImageTransparency = 0.4,
				Name = "Ico"
			}), "Text"),
			L_22_func(L_18_func(L_17_func("Label", L_153_arg0.Name, 14), {
				Size = UDim2.new(1, -35, 1, 0),
				Position = UDim2.new(0, 35, 0, 0),
				Font = Enum.Font.GothamSemibold,
				TextTransparency = 0.4,
				Name = "Title"
			}), "Text")
		})

		if L_11_func(L_153_arg0.Icon) ~= nil then
			L_154_.Ico.Image = L_11_func(L_153_arg0.Icon)
		end	

		local L_155_ = L_22_func(L_19_func(L_18_func(L_17_func("ScrollFrame", Color3.fromRGB(255, 255, 255), 5), {
			Size = UDim2.new(1, -150, 1, -50),
			Position = UDim2.new(0, 150, 0, 50),
			Parent = L_140_,
			Visible = false,
			Name = "ItemContainer"
		}), {
			L_17_func("List", 0, 6),
			L_17_func("Padding", 15, 10, 10, 15)
		}), "Divider")

		L_13_func(L_155_.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
			L_155_.CanvasSize = UDim2.new(0, 0, 0, L_155_.UIListLayout.AbsoluteContentSize.Y + 30)
		end)

		if L_129_ then
			L_129_ = false
			L_154_.Ico.ImageTransparency = 0
			L_154_.Title.TextTransparency = 0
			L_154_.Title.Font = Enum.Font.GothamBlack
			L_155_.Visible = true
		end    

		L_13_func(L_154_.MouseButton1Click, function()
			for L_158_forvar0, L_159_forvar1 in next, L_133_:GetChildren() do
				if L_159_forvar1:IsA("TextButton") then
					L_159_forvar1.Title.Font = Enum.Font.GothamSemibold
					L_2_:Create(L_159_forvar1.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						ImageTransparency = 0.4
					}):Play()
					L_2_:Create(L_159_forvar1.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						TextTransparency = 0.4
					}):Play()
				end    
			end
			for L_160_forvar0, L_161_forvar1 in next, L_140_:GetChildren() do
				if L_161_forvar1.Name == "ItemContainer" then
					L_161_forvar1.Visible = false
				end    
			end  
			L_2_:Create(L_154_.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				ImageTransparency = 0
			}):Play()
			L_2_:Create(L_154_.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				TextTransparency = 0
			}):Play()
			L_154_.Title.Font = Enum.Font.GothamBlack
			L_155_.Visible = true   
		end)

		local function L_156_func(L_162_arg0)
			local L_163_ = {}
			function L_163_:AddLabel(L_164_arg0)
				local L_165_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 0.7,
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_164_arg0, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					L_22_func(L_17_func("Stroke"), "Stroke")
				}), "Second")

				local L_166_ = {}
				function L_166_:Set(L_167_arg0)
					L_165_.Content.Text = L_167_arg0
				end
				return L_166_
			end
			function L_163_:AddParagraph(L_168_arg0, L_169_arg1)
				L_168_arg0 = L_168_arg0 or "Text"
				L_169_arg1 = L_169_arg1 or "Content"

				local L_170_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 0.7,
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_168_arg0, 15), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 10),
						Font = Enum.Font.GothamBold,
						Name = "Title"
					}), "Text"),
					L_22_func(L_18_func(L_17_func("Label", "", 13), {
						Size = UDim2.new(1, -24, 0, 0),
						Position = UDim2.new(0, 12, 0, 26),
						Font = Enum.Font.GothamSemibold,
						Name = "Content",
						TextWrapped = true
					}), "TextDark"),
					L_22_func(L_17_func("Stroke"), "Stroke")
				}), "Second")

				L_13_func(L_170_.Content:GetPropertyChangedSignal("Text"), function()
					L_170_.Content.Size = UDim2.new(1, -24, 0, L_170_.Content.TextBounds.Y)
					L_170_.Size = UDim2.new(1, 0, 0, L_170_.Content.TextBounds.Y + 35)
				end)

				L_170_.Content.Text = L_169_arg1

				local L_171_ = {}
				function L_171_:Set(L_172_arg0)
					L_170_.Content.Text = L_172_arg0
				end
				return L_171_
			end    
			function L_163_:AddButton(L_173_arg0)
				L_173_arg0 = L_173_arg0 or {}
				L_173_arg0.Name = L_173_arg0.Name or "Button"
				L_173_arg0.Callback = L_173_arg0.Callback or function()
				end
				L_173_arg0.Icon = L_173_arg0.Icon or "rbxassetid://3944703587"

				local L_174_ = {}

				local L_175_ = L_18_func(L_17_func("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local L_176_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 33),
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_173_arg0.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					L_22_func(L_18_func(L_17_func("Image", L_173_arg0.Icon), {
						Size = UDim2.new(0, 20, 0, 20),
						Position = UDim2.new(1, -30, 0, 7),
					}), "TextDark"),
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_175_
				}), "Second")

				L_13_func(L_175_.MouseEnter, function()
					L_2_:Create(L_176_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)

				L_13_func(L_175_.MouseLeave, function()
					L_2_:Create(L_176_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = L_7_.Themes[L_7_.SelectedTheme].Second
					}):Play()
				end)

				L_13_func(L_175_.MouseButton1Up, function()
					L_2_:Create(L_176_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
					spawn(function()
						L_173_arg0.Callback()
					end)
				end)

				L_13_func(L_175_.MouseButton1Down, function()
					L_2_:Create(L_176_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)

				function L_174_:Set(L_177_arg0)
					L_176_.Content.Text = L_177_arg0
				end	

				return L_174_
			end    
			function L_163_:AddToggle(L_178_arg0)
				L_178_arg0 = L_178_arg0 or {}
				L_178_arg0.Name = L_178_arg0.Name or "Toggle"
				L_178_arg0.Default = L_178_arg0.Default or false
				L_178_arg0.Callback = L_178_arg0.Callback or function()
				end
				L_178_arg0.Color = L_178_arg0.Color or Color3.fromRGB(9, 99, 195)
				L_178_arg0.Flag = L_178_arg0.Flag or nil
				L_178_arg0.Save = L_178_arg0.Save or false

				local L_179_ = {
					Value = L_178_arg0.Default,
					Save = L_178_arg0.Save
				}

				local L_180_ = L_18_func(L_17_func("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local L_181_ = L_19_func(L_18_func(L_17_func("RoundFrame", L_178_arg0.Color, 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -24, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}), {
					L_18_func(L_17_func("Stroke"), {
						Color = L_178_arg0.Color,
						Name = "Stroke",
						Transparency = 0.5
					}),
					L_18_func(L_17_func("Image", "rbxassetid://3944680095"), {
						Size = UDim2.new(0, 20, 0, 20),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						ImageColor3 = Color3.fromRGB(255, 255, 255),
						Name = "Ico"
					}),
				})

				local L_182_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_178_arg0.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_181_,
					L_180_
				}), "Second")

				function L_179_:Set(L_183_arg0)
					L_179_.Value = L_183_arg0
					L_2_:Create(L_181_, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = L_179_.Value and L_178_arg0.Color or L_7_.Themes.Default.Divider
					}):Play()
					L_2_:Create(L_181_.Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Color = L_179_.Value and L_178_arg0.Color or L_7_.Themes.Default.Stroke
					}):Play()
					L_2_:Create(L_181_.Ico, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						ImageTransparency = L_179_.Value and 0 or 1,
						Size = L_179_.Value and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 8, 0, 8)
					}):Play()
					L_178_arg0.Callback(L_179_.Value)
				end    

				L_179_:Set(L_179_.Value)

				L_13_func(L_180_.MouseEnter, function()
					L_2_:Create(L_182_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)

				L_13_func(L_180_.MouseLeave, function()
					L_2_:Create(L_182_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = L_7_.Themes[L_7_.SelectedTheme].Second
					}):Play()
				end)

				L_13_func(L_180_.MouseButton1Up, function()
					L_2_:Create(L_182_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
					L_27_func(game.GameId)
					L_179_:Set(not L_179_.Value)
				end)

				L_13_func(L_180_.MouseButton1Down, function()
					L_2_:Create(L_182_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)

				if L_178_arg0.Flag then
					L_7_.Flags[L_178_arg0.Flag] = L_179_
				end	
				return L_179_
			end  
			function L_163_:AddSlider(L_184_arg0)
				L_184_arg0 = L_184_arg0 or {}
				L_184_arg0.Name = L_184_arg0.Name or "Slider"
				L_184_arg0.Min = L_184_arg0.Min or 0
				L_184_arg0.Max = L_184_arg0.Max or 100
				L_184_arg0.Increment = L_184_arg0.Increment or 1
				L_184_arg0.Default = L_184_arg0.Default or 50
				L_184_arg0.Callback = L_184_arg0.Callback or function()
				end
				L_184_arg0.ValueName = L_184_arg0.ValueName or ""
				L_184_arg0.Color = L_184_arg0.Color or Color3.fromRGB(9, 149, 98)
				L_184_arg0.Flag = L_184_arg0.Flag or nil
				L_184_arg0.Save = L_184_arg0.Save or false

				local L_185_ = {
					Value = L_184_arg0.Default,
					Save = L_184_arg0.Save
				}
				local L_186_ = false

				local L_187_ = L_19_func(L_18_func(L_17_func("RoundFrame", L_184_arg0.Color, 0, 5), {
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundTransparency = 0.3,
					ClipsDescendants = true
				}), {
					L_22_func(L_18_func(L_17_func("Label", "value", 13), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 6),
						Font = Enum.Font.GothamBold,
						Name = "Value",
						TextTransparency = 0
					}), "Text")
				})

				local L_188_ = L_19_func(L_18_func(L_17_func("RoundFrame", L_184_arg0.Color, 0, 5), {
					Size = UDim2.new(1, -24, 0, 26),
					Position = UDim2.new(0, 12, 0, 30),
					BackgroundTransparency = 0.9
				}), {
					L_18_func(L_17_func("Stroke"), {
						Color = L_184_arg0.Color
					}),
					L_22_func(L_18_func(L_17_func("Label", "value", 13), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 6),
						Font = Enum.Font.GothamBold,
						Name = "Value",
						TextTransparency = 0.8
					}), "Text"),
					L_187_
				})

				local L_189_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(1, 0, 0, 65),
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_184_arg0.Name, 15), {
						Size = UDim2.new(1, -12, 0, 14),
						Position = UDim2.new(0, 12, 0, 10),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_188_
				}), "Second")

				L_188_.InputBegan:Connect(function(L_190_arg0)
					if L_190_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_190_arg0.UserInputType == Enum.UserInputType.Touch then 
						L_186_ = true 
					end 
				end)
				L_188_.InputEnded:Connect(function(L_191_arg0) 
					if L_191_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_191_arg0.UserInputType == Enum.UserInputType.Touch then 
						L_186_ = false 
					end 
				end)

				L_1_.InputChanged:Connect(function(L_192_arg0)
					if L_186_ then 
						local L_193_ = math.clamp((L_5_.X - L_188_.AbsolutePosition.X) / L_188_.AbsoluteSize.X, 0, 1)
						L_185_:Set(L_184_arg0.Min + ((L_184_arg0.Max - L_184_arg0.Min) * L_193_)) 
						L_27_func(game.GameId)
					end
				end)

				function L_185_:Set(L_194_arg0)
					self.Value = math.clamp(L_20_func(L_194_arg0, L_184_arg0.Increment), L_184_arg0.Min, L_184_arg0.Max)
					L_2_:Create(L_187_, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = UDim2.fromScale((self.Value - L_184_arg0.Min) / (L_184_arg0.Max - L_184_arg0.Min), 1)
					}):Play()
					L_188_.Value.Text = tostring(self.Value) .. " " .. L_184_arg0.ValueName
					L_187_.Value.Text = tostring(self.Value) .. " " .. L_184_arg0.ValueName
					L_184_arg0.Callback(self.Value)
				end      

				L_185_:Set(L_185_.Value)
				if L_184_arg0.Flag then				
					L_7_.Flags[L_184_arg0.Flag] = L_185_
				end
				return L_185_
			end  
			function L_163_:AddDropdown(L_195_arg0)
				L_195_arg0 = L_195_arg0 or {}
				L_195_arg0.Name = L_195_arg0.Name or "Dropdown"
				L_195_arg0.Options = L_195_arg0.Options or {}
				L_195_arg0.Default = L_195_arg0.Default or ""
				L_195_arg0.Callback = L_195_arg0.Callback or function()
				end
				L_195_arg0.Flag = L_195_arg0.Flag or nil
				L_195_arg0.Save = L_195_arg0.Save or false

				local L_196_ = {
					Value = L_195_arg0.Default,
					Options = L_195_arg0.Options,
					Buttons = {},
					Toggled = false,
					Type = "Dropdown",
					Save = L_195_arg0.Save
				}
				local L_197_ = 5

				if not table.find(L_196_.Options, L_196_.Value) then
					L_196_.Value = "..."
				end

				local L_198_ = L_17_func("List")

				local L_199_ = L_22_func(L_18_func(L_19_func(L_17_func("ScrollFrame", Color3.fromRGB(40, 40, 40), 4), {
					L_198_
				}), {
					Parent = L_162_arg0,
					Position = UDim2.new(0, 0, 0, 38),
					Size = UDim2.new(1, 0, 1, -38),
					ClipsDescendants = true
				}), "Divider")

				local L_200_ = L_18_func(L_17_func("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local L_201_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = L_162_arg0,
					ClipsDescendants = true
				}), {
					L_199_,
					L_18_func(L_19_func(L_17_func("TFrame"), {
						L_22_func(L_18_func(L_17_func("Label", L_195_arg0.Name, 15), {
							Size = UDim2.new(1, -12, 1, 0),
							Position = UDim2.new(0, 12, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Content"
						}), "Text"),
						L_22_func(L_18_func(L_17_func("Image", "rbxassetid://7072706796"), {
							Size = UDim2.new(0, 20, 0, 20),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(1, -30, 0.5, 0),
							ImageColor3 = Color3.fromRGB(240, 240, 240),
							Name = "Ico"
						}), "TextDark"),
						L_22_func(L_18_func(L_17_func("Label", "Selected", 13), {
							Size = UDim2.new(1, -40, 1, 0),
							Font = Enum.Font.Gotham,
							Name = "Selected",
							TextXAlignment = Enum.TextXAlignment.Right
						}), "TextDark"),
						L_22_func(L_18_func(L_17_func("Frame"), {
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, -1),
							Name = "Line",
							Visible = false
						}), "Stroke"), 
						L_200_
					}), {
						Size = UDim2.new(1, 0, 0, 38),
						ClipsDescendants = true,
						Name = "F"
					}),
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_17_func("Corner")
				}), "Second")

				L_13_func(L_198_:GetPropertyChangedSignal("AbsoluteContentSize"), function()
					L_199_.CanvasSize = UDim2.new(0, 0, 0, L_198_.AbsoluteContentSize.Y)
				end)  

				local function L_202_func(L_203_arg0)
					for L_204_forvar0, L_205_forvar1 in pairs(L_203_arg0) do
						local L_206_ = L_22_func(L_18_func(L_19_func(L_17_func("Button", Color3.fromRGB(40, 40, 40)), {
							L_17_func("Corner", 0, 6),
							L_22_func(L_18_func(L_17_func("Label", L_205_forvar1, 13, 0.4), {
								Position = UDim2.new(0, 8, 0, 0),
								Size = UDim2.new(1, -8, 1, 0),
								Name = "Title"
							}), "Text")
						}), {
							Parent = L_199_,
							Size = UDim2.new(1, 0, 0, 28),
							BackgroundTransparency = 1,
							ClipsDescendants = true
						}), "Divider")

						L_13_func(L_206_.MouseButton1Click, function()
							L_196_:Set(L_205_forvar1)
							L_27_func(game.GameId)
						end)

						L_196_.Buttons[L_205_forvar1] = L_206_
					end
				end	

				function L_196_:Refresh(L_207_arg0, L_208_arg1)
					if L_208_arg1 then
						for L_209_forvar0, L_210_forvar1 in pairs(L_196_.Buttons) do
							L_210_forvar1:Destroy()
						end    
						table.clear(L_196_.Options)
						table.clear(L_196_.Buttons)
					end
					L_196_.Options = L_207_arg0
					L_202_func(L_196_.Options)
				end  

				function L_196_:Set(L_211_arg0)
					if not table.find(L_196_.Options, L_211_arg0) then
						L_196_.Value = "..."
						L_201_.F.Selected.Text = L_196_.Value
						for L_212_forvar0, L_213_forvar1 in pairs(L_196_.Buttons) do
							L_2_:Create(L_213_forvar1, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundTransparency = 1
							}):Play()
							L_2_:Create(L_213_forvar1.Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextTransparency = 0.4
							}):Play()
						end	
						return
					end

					L_196_.Value = L_211_arg0
					L_201_.F.Selected.Text = L_196_.Value

					for L_214_forvar0, L_215_forvar1 in pairs(L_196_.Buttons) do
						L_2_:Create(L_215_forvar1, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundTransparency = 1
						}):Play()
						L_2_:Create(L_215_forvar1.Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							TextTransparency = 0.4
						}):Play()
					end	
					L_2_:Create(L_196_.Buttons[L_211_arg0], TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundTransparency = 0
					}):Play()
					L_2_:Create(L_196_.Buttons[L_211_arg0].Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextTransparency = 0
					}):Play()
					return L_195_arg0.Callback(L_196_.Value)
				end

				L_13_func(L_200_.MouseButton1Click, function()
					L_196_.Toggled = not L_196_.Toggled
					L_201_.F.Line.Visible = L_196_.Toggled
					L_2_:Create(L_201_.F.Ico, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Rotation = L_196_.Toggled and 180 or 0
					}):Play()
					if # L_196_.Options > L_197_ then
						L_2_:Create(L_201_, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Size = L_196_.Toggled and UDim2.new(1, 0, 0, 38 + (L_197_ * 28)) or UDim2.new(1, 0, 0, 38)
						}):Play()
					else
						L_2_:Create(L_201_, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Size = L_196_.Toggled and UDim2.new(1, 0, 0, L_198_.AbsoluteContentSize.Y + 38) or UDim2.new(1, 0, 0, 38)
						}):Play()
					end
				end)

				L_196_:Refresh(L_196_.Options, false)
				L_196_:Set(L_196_.Value)
				if L_195_arg0.Flag then				
					L_7_.Flags[L_195_arg0.Flag] = L_196_
				end
				return L_196_
			end
			function L_163_:AddBind(L_216_arg0)
				L_216_arg0.Name = L_216_arg0.Name or "Bind"
				L_216_arg0.Default = L_216_arg0.Default or Enum.KeyCode.Unknown
				L_216_arg0.Hold = L_216_arg0.Hold or false
				L_216_arg0.Callback = L_216_arg0.Callback or function()
				end
				L_216_arg0.Flag = L_216_arg0.Flag or nil
				L_216_arg0.Save = L_216_arg0.Save or false

				local L_217_ = {
					Value,
					Binding = false,
					Type = "Bind",
					Save = L_216_arg0.Save
				}
				local L_218_ = false

				local L_219_ = L_18_func(L_17_func("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local L_220_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_22_func(L_18_func(L_17_func("Label", L_216_arg0.Name, 14), {
						Size = UDim2.new(1, 0, 1, 0),
						Font = Enum.Font.GothamBold,
						TextXAlignment = Enum.TextXAlignment.Center,
						Name = "Value"
					}), "Text")
				}), "Main")

				local L_221_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_216_arg0.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_220_,
					L_219_
				}), "Second")

				L_13_func(L_220_.Value:GetPropertyChangedSignal("Text"), function()
					L_2_:Create(L_220_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Size = UDim2.new(0, L_220_.Value.TextBounds.X + 16, 0, 24)
					}):Play()
				end)

				L_13_func(L_219_.InputEnded, function(L_222_arg0)
					if L_222_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_222_arg0.UserInputType == Enum.UserInputType.Touch then
						if L_217_.Binding then
							return
						end
						L_217_.Binding = true
						L_220_.Value.Text = ""
					end
				end)

				L_13_func(L_1_.InputBegan, function(L_223_arg0)
					if L_1_:GetFocusedTextBox() then
						return
					end
					if (L_223_arg0.KeyCode.Name == L_217_.Value or L_223_arg0.UserInputType.Name == L_217_.Value) and not L_217_.Binding then
						if L_216_arg0.Hold then
							L_218_ = true
							L_216_arg0.Callback(L_218_)
						else
							L_216_arg0.Callback()
						end
					elseif L_217_.Binding then
						local L_224_
						pcall(function()
							if not L_30_func(L_29_, L_223_arg0.KeyCode) then
								L_224_ = L_223_arg0.KeyCode
							end
						end)
						pcall(function()
							if L_30_func(L_28_, L_223_arg0.UserInputType) and not L_224_ then
								L_224_ = L_223_arg0.UserInputType
							end
						end)
						L_224_ = L_224_ or L_217_.Value
						L_217_:Set(L_224_)
						L_27_func(game.GameId)
					end
				end)

				L_13_func(L_1_.InputEnded, function(L_225_arg0)
					if L_225_arg0.KeyCode.Name == L_217_.Value or L_225_arg0.UserInputType.Name == L_217_.Value then
						if L_216_arg0.Hold and L_218_ then
							L_218_ = false
							L_216_arg0.Callback(L_218_)
						end
					end
				end)

				L_13_func(L_219_.MouseEnter, function()
					L_2_:Create(L_221_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)

				L_13_func(L_219_.MouseLeave, function()
					L_2_:Create(L_221_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = L_7_.Themes[L_7_.SelectedTheme].Second
					}):Play()
				end)

				L_13_func(L_219_.MouseButton1Up, function()
					L_2_:Create(L_221_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)

				L_13_func(L_219_.MouseButton1Down, function()
					L_2_:Create(L_221_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)

				function L_217_:Set(L_226_arg0)
					L_217_.Binding = false
					L_217_.Value = L_226_arg0 or L_217_.Value
					L_217_.Value = L_217_.Value.Name or L_217_.Value
					L_220_.Value.Text = L_217_.Value
				end

				L_217_:Set(L_216_arg0.Default)
				if L_216_arg0.Flag then				
					L_7_.Flags[L_216_arg0.Flag] = L_217_
				end
				return L_217_
			end  
			function L_163_:AddTextbox(L_227_arg0)
				L_227_arg0 = L_227_arg0 or {}
				L_227_arg0.Name = L_227_arg0.Name or "Textbox"
				L_227_arg0.Default = L_227_arg0.Default or ""
				L_227_arg0.TextDisappear = L_227_arg0.TextDisappear or false
				L_227_arg0.Callback = L_227_arg0.Callback or function()
				end

				local L_228_ = L_18_func(L_17_func("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local L_229_ = L_22_func(L_15_func("TextBox", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					PlaceholderColor3 = Color3.fromRGB(210, 210, 210),
					PlaceholderText = "Input",
					Font = Enum.Font.GothamSemibold,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextSize = 14,
					ClearTextOnFocus = false
				}), "Text")

				local L_230_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_229_
				}), "Main")


				local L_231_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = L_162_arg0
				}), {
					L_22_func(L_18_func(L_17_func("Label", L_227_arg0.Name, 15), {
						Size = UDim2.new(1, -12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					L_22_func(L_17_func("Stroke"), "Stroke"),
					L_230_,
					L_228_
				}), "Second")

				L_13_func(L_229_:GetPropertyChangedSignal("Text"), function()
					L_2_:Create(L_230_, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Size = UDim2.new(0, L_229_.TextBounds.X + 16, 0, 24)
					}):Play()
				end)

				L_13_func(L_229_.FocusLost, function()
					L_227_arg0.Callback(L_229_.Text)
					if L_227_arg0.TextDisappear then
						L_229_.Text = ""
					end	
				end)

				L_229_.Text = L_227_arg0.Default

				L_13_func(L_228_.MouseEnter, function()
					L_2_:Create(L_231_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)

				L_13_func(L_228_.MouseLeave, function()
					L_2_:Create(L_231_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = L_7_.Themes[L_7_.SelectedTheme].Second
					}):Play()
				end)

				L_13_func(L_228_.MouseButton1Up, function()
					L_2_:Create(L_231_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 3, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 3)
					}):Play()
					L_229_:CaptureFocus()
				end)

				L_13_func(L_228_.MouseButton1Down, function()
					L_2_:Create(L_231_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(L_7_.Themes[L_7_.SelectedTheme].Second.R * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.G * 255 + 6, L_7_.Themes[L_7_.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)
			end 
			function L_163_:AddColorpicker(L_232_arg0)
				L_232_arg0 = L_232_arg0 or {}
				L_232_arg0.Name = L_232_arg0.Name or "Colorpicker"
				L_232_arg0.Default = L_232_arg0.Default or Color3.fromRGB(255, 255, 255)
				L_232_arg0.Callback = L_232_arg0.Callback or function()
				end
				L_232_arg0.Flag = L_232_arg0.Flag or nil
				L_232_arg0.Save = L_232_arg0.Save or false

				local L_233_, L_234_, L_235_ = 1, 1, 1
				local L_236_ = {
					Value = L_232_arg0.Default,
					Toggled = false,
					Type = "Colorpicker",
					Save = L_232_arg0.Save
				}

				local L_237_ = L_15_func("ImageLabel", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(select(3, Color3.toHSV(L_236_.Value))),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=4805639000"
				})

				local L_238_ = L_15_func("ImageLabel", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0.5, 0, 1 - select(1, Color3.toHSV(L_236_.Value))),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=4805639000"
				})

				local L_239_ = L_15_func("ImageLabel", {
					Size = UDim2.new(1, -25, 1, 0),
					Visible = false,
					Image = "rbxassetid://4155801252"
				}, {
					L_15_func("UICorner", {
						CornerRadius = UDim.new(0, 5)
					}),
					L_237_
				})

				local L_240_ = L_15_func("Frame", {
					Size = UDim2.new(0, 20, 1, 0),
					Position = UDim2.new(1, -20, 0, 0),
					Visible = false
				}, {
					L_15_func("UIGradient", {
						Rotation = 270,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
							ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
							ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
							ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
							ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
						},
					}),
					L_15_func("UICorner", {
						CornerRadius = UDim.new(0, 5)
					}),
					L_238_
				})

				local L_241_ = L_15_func("Frame", {
					Position = UDim2.new(0, 0, 0, 32),
					Size = UDim2.new(1, 0, 1, -32),
					BackgroundTransparency = 1,
					ClipsDescendants = true
				}, {
					L_240_,
					L_239_,
					L_15_func("UIPadding", {
						PaddingLeft = UDim.new(0, 35),
						PaddingRight = UDim.new(0, 35),
						PaddingBottom = UDim.new(0, 10),
						PaddingTop = UDim.new(0, 17)
					})
				})

				local L_242_ = L_18_func(L_17_func("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})

				local L_243_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, -12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					L_22_func(L_17_func("Stroke"), "Stroke")
				}), "Main")

				local L_244_ = L_22_func(L_19_func(L_18_func(L_17_func("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = L_162_arg0
				}), {
					L_18_func(L_19_func(L_17_func("TFrame"), {
						L_22_func(L_18_func(L_17_func("Label", L_232_arg0.Name, 15), {
							Size = UDim2.new(1, -12, 1, 0),
							Position = UDim2.new(0, 12, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Content"
						}), "Text"),
						L_243_,
						L_242_,
						L_22_func(L_18_func(L_17_func("Frame"), {
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, -1),
							Name = "Line",
							Visible = false
						}), "Stroke"), 
					}), {
						Size = UDim2.new(1, 0, 0, 38),
						ClipsDescendants = true,
						Name = "F"
					}),
					L_241_,
					L_22_func(L_17_func("Stroke"), "Stroke"),
				}), "Second")

				L_13_func(L_242_.MouseButton1Click, function()
					L_236_.Toggled = not L_236_.Toggled
					L_2_:Create(L_244_, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = L_236_.Toggled and UDim2.new(1, 0, 0, 148) or UDim2.new(1, 0, 0, 38)
					}):Play()
					L_239_.Visible = L_236_.Toggled
					L_240_.Visible = L_236_.Toggled
					L_244_.F.Line.Visible = L_236_.Toggled
				end)

				local function L_245_func()
					L_243_.BackgroundColor3 = Color3.fromHSV(L_233_, L_234_, L_235_)
					L_239_.BackgroundColor3 = Color3.fromHSV(L_233_, 1, 1)
					L_236_:Set(L_243_.BackgroundColor3)
					L_232_arg0.Callback(L_243_.BackgroundColor3)
					L_27_func(game.GameId)
				end

				L_233_ = 1 - (math.clamp(L_238_.AbsolutePosition.Y - L_240_.AbsolutePosition.Y, 0, L_240_.AbsoluteSize.Y) / L_240_.AbsoluteSize.Y)
				L_234_ = (math.clamp(L_237_.AbsolutePosition.X - L_239_.AbsolutePosition.X, 0, L_239_.AbsoluteSize.X) / L_239_.AbsoluteSize.X)
				L_235_ = 1 - (math.clamp(L_237_.AbsolutePosition.Y - L_239_.AbsolutePosition.Y, 0, L_239_.AbsoluteSize.Y) / L_239_.AbsoluteSize.Y)

				L_13_func(L_239_.InputBegan, function(L_246_arg0)
					if L_246_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_246_arg0.UserInputType == Enum.UserInputType.Touch then
						if G_1_ then
							G_1_:Disconnect()
						end
						G_1_ = L_13_func(L_3_.RenderStepped, function()
							local L_247_ = (math.clamp(L_5_.X - L_239_.AbsolutePosition.X, 0, L_239_.AbsoluteSize.X) / L_239_.AbsoluteSize.X)
							local L_248_ = (math.clamp(L_5_.Y - L_239_.AbsolutePosition.Y, 0, L_239_.AbsoluteSize.Y) / L_239_.AbsoluteSize.Y)
							L_237_.Position = UDim2.new(L_247_, 0, L_248_, 0)
							L_234_ = L_247_
							L_235_ = 1 - L_248_
							L_245_func()
						end)
					end
				end)

				L_13_func(L_239_.InputEnded, function(L_249_arg0)
					if L_249_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_249_arg0.UserInputType == Enum.UserInputType.Touch then
						if G_1_ then
							G_1_:Disconnect()
						end
					end
				end)

				L_13_func(L_240_.InputBegan, function(L_250_arg0)
					if L_250_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_250_arg0.UserInputType == Enum.UserInputType.Touch then
						if G_2_ then
							G_2_:Disconnect()
						end;

						G_2_ = L_13_func(L_3_.RenderStepped, function()
							local L_251_ = (math.clamp(L_5_.Y - L_240_.AbsolutePosition.Y, 0, L_240_.AbsoluteSize.Y) / L_240_.AbsoluteSize.Y)

							L_238_.Position = UDim2.new(0.5, 0, L_251_, 0)
							L_233_ = 1 - L_251_

							L_245_func()
						end)
					end
				end)

				L_13_func(L_240_.InputEnded, function(L_252_arg0)
					if L_252_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_252_arg0.UserInputType == Enum.UserInputType.Touch then
						if G_2_ then
							G_2_:Disconnect()
						end
					end
				end)

				function L_236_:Set(L_253_arg0)
					L_236_.Value = L_253_arg0
					L_243_.BackgroundColor3 = L_236_.Value
					L_232_arg0.Callback(L_236_.Value)
				end

				L_236_:Set(L_236_.Value)
				if L_232_arg0.Flag then				
					L_7_.Flags[L_232_arg0.Flag] = L_236_
				end
				return L_236_
			end  
			return L_163_   
		end	

		local L_157_ = {}

		function L_157_:AddSection(L_254_arg0)
			L_254_arg0.Name = L_254_arg0.Name or "Section"

			local L_255_ = L_19_func(L_18_func(L_17_func("TFrame"), {
				Size = UDim2.new(1, 0, 0, 26),
				Parent = L_155_
			}), {
				L_22_func(L_18_func(L_17_func("Label", L_254_arg0.Name, 14), {
					Size = UDim2.new(1, -12, 0, 16),
					Position = UDim2.new(0, 0, 0, 3),
					Font = Enum.Font.GothamSemibold
				}), "TextDark"),
				L_19_func(L_18_func(L_17_func("TFrame"), {
					AnchorPoint = Vector2.new(0, 0),
					Size = UDim2.new(1, 0, 1, -24),
					Position = UDim2.new(0, 0, 0, 23),
					Name = "Holder"
				}), {
					L_17_func("List", 0, 6)
				}),
			})

			L_13_func(L_255_.Holder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				L_255_.Size = UDim2.new(1, 0, 0, L_255_.Holder.UIListLayout.AbsoluteContentSize.Y + 31)
				L_255_.Holder.Size = UDim2.new(1, 0, 0, L_255_.Holder.UIListLayout.AbsoluteContentSize.Y)
			end)

			local L_256_ = {}
			for L_257_forvar0, L_258_forvar1 in next, L_156_func(L_255_.Holder) do
				L_256_[L_257_forvar0] = L_258_forvar1 
			end
			return L_256_
		end	

		for L_259_forvar0, L_260_forvar1 in next, L_156_func(L_155_) do
			L_157_[L_259_forvar0] = L_260_forvar1 
		end

		if L_153_arg0.PremiumOnly then
			for L_261_forvar0, L_262_forvar1 in next, L_157_ do
				L_157_[L_261_forvar0] = function()
				end
			end    
			L_155_:FindFirstChild("UIListLayout"):Destroy()
			L_155_:FindFirstChild("UIPadding"):Destroy()
			L_19_func(L_18_func(L_17_func("TFrame"), {
				Size = UDim2.new(1, 0, 1, 0),
				Parent = ItemParent
			}), {
				L_22_func(L_18_func(L_17_func("Image", "rbxassetid://3610239960"), {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 15, 0, 15),
					ImageTransparency = 0.4
				}), "Text"),
				L_22_func(L_18_func(L_17_func("Label", "Unauthorised Access", 14), {
					Size = UDim2.new(1, -38, 0, 14),
					Position = UDim2.new(0, 38, 0, 18),
					TextTransparency = 0.4
				}), "Text"),
				L_22_func(L_18_func(L_17_func("Image", "rbxassetid://4483345875"), {
					Size = UDim2.new(0, 56, 0, 56),
					Position = UDim2.new(0, 84, 0, 110),
				}), "Text"),
				L_22_func(L_18_func(L_17_func("Label", "Premium Features", 14), {
					Size = UDim2.new(1, -150, 0, 14),
					Position = UDim2.new(0, 150, 0, 112),
					Font = Enum.Font.GothamBold
				}), "Text"),
				L_22_func(L_18_func(L_17_func("Label", "This part of the script is locked to Sirius Premium users. Purchase Premium in the Discord server (discord.gg/sirius)", 12), {
					Size = UDim2.new(1, -200, 0, 14),
					Position = UDim2.new(0, 150, 0, 138),
					TextWrapped = true,
					TextTransparency = 0.4
				}), "Text")
			})
		end
		return L_157_   
	end  
	
	return L_148_
end   

function L_7_:Destroy()
	L_12_:Destroy()
end

return L_7_