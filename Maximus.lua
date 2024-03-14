Lib = {
  PlayerName = game.Players.LocalPlayer.Name,
  Orion = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
}

function Lib.TeleportPlayer(x, y, z)
  game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
end

function Lib.getpos()
  return game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end

function Lib.getid()
  return game.PlaceId
end

function Lib.TweenTp(x, y, z, speed)
local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(speed,Enum.EasingStyle.Linear)
local lp = game.Players.LocalPlayer

    if lp.Character and 
    lp.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(Vector3.new(x, y, z))
        local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
    end
end

function Lib.TeleportPlace(id)
    game:GetService("TeleportService"):Teleport(id)
end

function Lib.KillPlayer()
  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
end

function Lib.Load(link)
  loadstring(game:HttpGet(link))()
end

function Lib.IY()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end

function Lib.RemoveGui()
  game.Players.LocalPlayer:FindFirstChild("PlayerGui"):ClearAllChildren()
  game:FindFirstChild("CoreGui"):ClearAllChildren()
end

function Lib.SetSpeed(speed)
  game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = speed
end

function Lib.Anchor(state)
  game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = state
end

function Lib.sendtext(text)
  local args = {
    [1] = text,
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end

function Lib.Noclip()
  local Noclip = nil
        local Clip = nil
        
        local function noclip()
            Clip = false
            local function Nocl()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                            v.CanCollide = false
                        end
                    end
                end
                wait(0.21)
            end
            Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
        end
        
        local function clip()
            if Noclip then Noclip:Disconnect() end
            Clip = true
        end
        
        noclip()
end

function Lib.Optimize()
 for i,v in pairs(workspace:GetDescendants()) do
    if v:IsA("Texture") then
       v:Destroy()
       elseif v:IsA("Decal") then
       v:Destroy()
    end
 end
end

function Lib.MaxOptimize()
  Lib.Optimize()
  Lib.RemoveGui
end

return Lib
