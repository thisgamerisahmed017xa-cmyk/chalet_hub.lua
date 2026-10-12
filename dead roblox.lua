-- ==========================================
-- [Script Name]: Dead Roblox - Owner Control Hub
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

-- 1. واجهة الاعتمادات الرسمية على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadRoblox_Control_Hub"
ScreenGui.Parent = game.CoreGui

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
CreditLabel.BackgroundTransparency = 0.2
CreditLabel.Position = UDim2.new(1, -240, 0, 15)
CreditLabel.Size = UDim2.new(0, 230, 0, 70)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(255, 0, 50)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "☠️ [DEAD ROBLOX HUB]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n⚡ Access: Full Admin / God Mode"

Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -200)
MainFrame.Size = UDim2.new(0, 360, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Text = "☠️ DEAD ROBLOX - SERVER CONTROL"

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 0, 0, 50)
Scroll.Size = UDim2.new(1, 0, 1, -50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 2, 0)

local UIList = Instance.new("UIListLayout", Scroll)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)

local function createBtn(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Scroll
    btn.Size = UDim2.new(0.9, 0, 0, 38)
    btn.Position = UDim2.new(0.05, 0, 0, 0)
    btn.BackgroundColor3 = color
    btn.Font = Enum.Font.SourceSansBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Text = text
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ==================== الأزرار ====================

createBtn("📢 إرسال إعلان إداري (Server Announcement)", Color3.fromRGB(180, 50, 0), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🚨 [تنبيه من إدارة DEAD ROBLOX]",
            Text = "المالك viurstester505 قام بتفعيل وضع التحكم الكامل!",
            Duration = 7,
        })
    end)
end)

createBtn("🧊 تجميد حركة جميع اللاعبين (Freeze Server)", Color3.fromRGB(0, 120, 200), function()
    pcall(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.WalkSpeed = 0
                p.Character.Humanoid.JumpPower = 0
            end
        end
    end)
end)

createBtn("🔴 تحويل ألوان السيرفر إلى أحمر مرعب (Dead Red)", Color3.fromRGB(150, 0, 0), function()
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
    Lighting.FogColor = Color3.fromRGB(100, 0, 0)
    Lighting.FogEnd = 300
end)

createBtn("🟣 تحويل ألوان السيرفر إلى بنفسجي نيون", Color3.fromRGB(120, 0, 180), function()
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(150, 0, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(100, 0, 200)
    Lighting.Brightness = 3
end)

createBtn("☀️ إرجاع ألوان السيرفر طبيعية", Color3.fromRGB(0, 150, 100), function()
    Lighting.ClockTime = 14
    Lighting.Ambient = Color3.fromRGB(128, 128, 128)
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Lighting.FogEnd = 100000
end)

createBtn("🧲 سحب جميع اللاعبين لموقعك (Bring All)", Color3.fromRGB(200, 100, 0), function()
    pcall(function()
        local myPos = LocalPlayer.Character.HumanoidRootPart.CFrame
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                p.Character.HumanoidRootPart.CFrame = myPos + Vector3.new(math.random(-4,4), 0, math.random(-4,4))
            end
        end
    end)
end)

createBtn("🏠 بناء شاليه ملكي ضخم للجميع", Color3.fromRGB(80, 80, 80), function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local base = Instance.new("Part")
            base.Size = Vector3.new(60, 2, 60)
            base.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, -2, 0)
            base.Anchored = true
            base.Material = Enum.Material.Marble
            base.BrickColor = BrickColor.new("White")
            base.Parent = workspace
        end
    end)
end)

createBtn("⚡ سرعة المالك الخارقة (Speed 200)", Color3.fromRGB(220, 0, 0), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 200
    end
end)
