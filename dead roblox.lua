-- ==========================================
-- [Delta Ultimate Chaos + Public Explosion Script]
-- ==========================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- 1. رفع السرعة والقفز محلياً
humanoid.WalkSpeed = 150
humanoid.JumpPower = 250

-- 2. تغيير الإضاءة والألوان على شاشتك
Lighting.ClockTime = 0
Lighting.Ambient = Color3.fromRGB(255, 0, 0)

-- 3. واجهة "Roblox dead" المهتزة على شاشتك
if player.PlayerGui then
    local old = player.PlayerGui:FindFirstChild("DeltaMegaGui")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui", player.PlayerGui)
    gui.Name = "DeltaMegaGui"
    gui.IgnoreGuiInset = true

    local bg = Instance.new("Frame", gui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

    local txt = Instance.new("TextLabel", gui)
    txt.Size = UDim2.new(1, 0, 0, 100)
    txt.Position = UDim2.new(0, 0, 0.4, 0)
    txt.BackgroundTransparency = 1
    txt.Font = Enum.Font.GothamBlack
    txt.TextColor3 = Color3.fromRGB(255, 0, 0)
    txt.TextSize = 65
    txt.Text = "Roblox dead"

    task.spawn(function()
        while gui.Parent do
            txt.Position = UDim2.new(math.random(-0.03, 0.03), 0, 0.4 + math.random(-0.03, 0.03), 0)
            task.wait(0.05)
        end
    end)
end

-- 4. حركة "تفجير النفس" المرئية للكل (تطير في الهواء بقوة انفجار ضخمة يراها الجميع)
task.spawn(function()
    -- دفع شخصيتك بقوة هائلة للأعلى وللأمام كأنها قنبلة انفجرت فيها، وكل اللاعبين سيشاهدونك تطير
    rootPart.Velocity = Vector3.new(math.random(-300, 300), 500, math.random(-300, 300))
    
    -- إسقاط أو تحطيم أجزاء الحركة ليراها الناس
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            -- جعل أجزاء من الجسم تتناثر أمام الجميع
            part.Velocity = Vector3.new(math.random(-200, 200), math.random(300, 400), math.random(-200, 200))
        end
    end
end)

print("[DELTA]: Ultimate Chaos & Public Explosion Triggered!")
