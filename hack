-- VIP GAMER UNIVERSAL - نسخة مبسطة
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- إشعار بسيط
local SG = Instance.new("ScreenGui", CoreGui)
local F = Instance.new("Frame", SG)
F.Size = UDim2.new(0, 300, 0, 100)
F.Position = UDim2.new(0.5, -150, 0.5, -50)
F.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local T = Instance.new("TextLabel", F)
T.Size = UDim2.new(1, 0, 1, 0)
T.Text = "VIP GAMER UNIVERSAL\nشغال! ✅"
T.TextColor3 = Color3.fromRGB(0, 0, 0)
T.TextSize = 24
T.Font = Enum.Font.GothamBold

print("✅ السكربت شغال!")

-- Fly بسيط
local Fly = false
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        Fly = not Fly
        local Character = LocalPlayer.Character
        if not Character then return end
        local hrp = Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        if Fly then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "FlyBV"
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Velocity = Vector3.new(0, 0, 0)
            print("✈️ Fly ON")
        else
            local bv = hrp:FindFirstChild("FlyBV")
            if bv then bv:Destroy() end
            print("🛑 Fly OFF")
        end
    end
end)

-- Noclip بسيط
local Noclip = false
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F2 then
        Noclip = not Noclip
        print(Noclip and "👻 Noclip ON" or "🛑 Noclip OFF")
    end
end)

RunService.Stepped:Connect(function()
    if Noclip then
        local Character = LocalPlayer.Character
        if not Character then return end
        for _, p in pairs(Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

print("F1: Fly | F2: Noclip")
