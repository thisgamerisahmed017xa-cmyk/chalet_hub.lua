
-- ==========================================
-- [Script Name]: Chalet & Brookhaven Clichés Hub
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- ==========================================

-- حماية السكربت والتأكد من تحميله داخل اللعبة
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- 1. إنشاء واجهة البصمة والاعتمادات على يمين الشاشة
local ScreenGui = Instance.new("ScreenGui")
local CreditLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "RV7_Style_GUI"

CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CreditLabel.BackgroundTransparency = 0.5
CreditLabel.Position = UDim2.new(1, -220, 0, 20) -- أعلى اليمين
CreditLabel.Size = UDim2.new(0, 210, 0, 60)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "⚡ [Chalet/House Hub]\n👤 صانع سكربت: viurstester505\n💡 الفكرة: zowb1"

-- زر صغير لإخفاء وإظهار الواجهة
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBtn.Position = UDim2.new(1, -220, 0, 85)
ToggleBtn.Size = UDim2.new(0, 210, 0, 30)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 12
ToggleBtn.Text = "إخفاء / إظهار القائمة"

-- 2. إنشاء القائمة الرئيسية للتحكم والكليشات
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Visible = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 16
Title.Text = "🔥 RV7 Style - Chalet & Houses"

-- زر الكليشات الخاص بماب الشاليهات/البيوت
local ClicheButton = Instance.new("TextButton")
ClicheButton.Parent = MainFrame
ClicheButton.Position = UDim2.new(0.1, 0, 0.3, 0)
ClicheButton.Size = UDim2.new(0, 240, 0, 45)
ClicheButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ClicheButton.Font = Enum.Font.SourceSansBold
ClicheButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClicheButton.TextSize = 14
ClicheButton.Text = "✨ تفعيل كليشات الشاليهات / البيوت"

-- زر السرعة الخارقة (ميزة إضافية قوية للـ Hub)
local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = MainFrame
SpeedButton.Position = UDim2.new(0.1, 0, 0.55, 0)
SpeedButton.Size = UDim2.new(0, 240, 0, 45)
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
SpeedButton.Font = Enum.Font.SourceSansBold
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.TextSize = 14
SpeedButton.Text = "⚡ سرعة خارقة (RV7 Speed)"

-- وظيفة زر الإخفاء والإظهار
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- وظيفة كليشات الماب
ClicheButton.MouseButton1Click:Connect(function()
    pcall(function()
        game.Lighting.ClockTime = 0
        game.Lighting.Brightness = 2
        game.Lighting.OutdoorAmbient = Color3.fromRGB(50, 50, 80)
        print("[+] تم تفعيل كليشات الشاليهات والبيوت بنجاح بواسطة viurstester505!")
    end)
end)

-- وظيفة السرعة
SpeedButton.MouseButton1Click:Connect(function()
    pcall(function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 100
            print("[+] تم تفعيل السرعة!")
        end
    end)
end)
