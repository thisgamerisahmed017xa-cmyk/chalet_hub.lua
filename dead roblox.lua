-- ==========================================
-- [Script Name]: Dead Roblox - HD Admin & Owner Panel
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

-- 1. واجهة الاعتمادات على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadRoblox_HD_Hub"
ScreenGui.Parent = game.CoreGui

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CreditLabel.BackgroundTransparency = 0.2
CreditLabel.Position = UDim2.new(1, -240, 0, 15)
CreditLabel.Size = UDim2.new(0, 230, 0, 70)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "☠️ [DEAD ROBLOX HD ADMIN]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n⚡ Mode: Owner Level"

Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -200)
MainFrame.Size = UDim2.new(0, 360, 0, 420)
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Text = "☠️ DEAD ROBLOX - HD CONTROL"

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 0, 0, 50)
Scroll.Size = UDim2.new(1, 0, 1, -50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 2.5, 0)

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

-- ==================== الأزرار والوظائف ====================

-- 1. تشغيل HD Admin الحقيقي
createBtn("👑 تشغيل HD Admin الحقيقي (HD Admin V2)", Color3.fromRGB(180, 0, 180), function()
    pcall(function()
        -- استدعاء سكربت HD Admin المباشر
        loadstring(game:HttpGet("https://raw.githubusercontent.com/bf94a11f/HD-Admin/main/Source.lua"))()
        StarterGui:SetCore("SendNotification", {
            Title = "HD Admin",
            Text = "تم إعطاؤك رتبة HD Admin بنجاح! جرب كتابة الأوامر.",
            Duration = 6
        })
    end)
end)

-- 2. Btools حقيقية متوافقة
createBtn("🛠️ أدوات البناء والحذف (Btools الشغالة)", Color3.fromRGB(0, 120, 200), function()
    pcall(function()
        local a = Instance.new("HopperBin", LocalPlayer.Backpack)
        a.BinType = Enum.BinType.Hammer
        local b = Instance.new("HopperBin", LocalPlayer.Backpack)
        b.BinType = Enum.BinType.Clone
        local c = Instance.new("HopperBin", LocalPlayer.Backpack)
        c.BinType = Enum.BinType.Grab
    end)
end)

-- 3. إرسال رسالة علوية للجميع
createBtn("📢 إرسال إعلان إداري للجميع", Color3.fromRGB(200, 80, 0), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🚨 [إعلان HD Admin]",
            Text = "المالك viurstester505 يسيطر على السيرفر!",
            Duration = 8,
        })
    end)
end)

-- 4. صورة الشاشة للجميع
createBtn("🖼️ إظهار صورة بملء الشاشة", Color3.fromRGB(180, 0, 0), function()
    pcall(function()
        local sgi = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
        local img = Instance.new("ImageLabel", sgi)
        img.Size = UDim2.new(1, 0, 1, 0)
        img.Image = "rbxassetid://6023426915"
        game:GetService("Debris"):AddItem(sgi, 5)
    end)
end)

-- 5. تشغيل صوت مزعج جداً
createBtn("🔊 تشغيل الصوت المزعج", Color3.fromRGB(220, 20, 60), function()
    pcall(function()
        local sound = Instance.new("Sound", SoundService)
        sound.SoundId = "rbxassetid://9069609208"
        sound.Volume = 10
        sound:Play()
    end)
end)

-- 6. تحويل الألوان للأحمر المرعب
createBtn("🔴 تحويل ألوان السيرفر إلى أحمر", Color3.fromRGB(140, 0, 0), function()
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
end)

-- 7. سرعة المالك
createBtn("⚡ سرعة المالك (250)", Color3.fromRGB(0, 150, 50), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 250
    end
end)
