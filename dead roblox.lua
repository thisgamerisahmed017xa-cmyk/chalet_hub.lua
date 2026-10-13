-- ==========================================
-- [Script Name]: Dead Roblox - Ahmedshaben505 Jumpscare & Server Terror
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- [Target User]: Ahmedshaben505
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")
local CoreGui = game:GetService("CoreGui")

-- إزالة الواجهة القديمة إن وجدت
pcall(function()
    if CoreGui:FindFirstChild("DeadRoblox_Terror_Hub") then
        CoreGui.DeadRoblox_Terror_Hub:Destroy()
    end
end)

-- 1. واجهة الاعتمادات على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadRoblox_Terror_Hub"
ScreenGui.Parent = CoreGui

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
CreditLabel.BackgroundTransparency = 0.3
CreditLabel.Position = UDim2.new(1, -250, 0, 15)
CreditLabel.Size = UDim2.new(0, 240, 0, 75)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "☠️ [AHMEDSHABEN505 TERROR]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n⚡ Status: Active Terror"

Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
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
Title.TextSize = 15
Title.Text = "☠️ AHMEDSHABEN505 - TERROR PANEL"

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

-- ==================== الأزرار والوظائف المرعبة ====================

-- الزر الأساسي: تفعيل عرض مقطع الرعب والصورة والنصوص تماماً مثل الفيديو على شخصية Ahmedshaben505 للجميع
createBtn("🎬 تشغيل تأثير Ahmedshaben505 المرعب للكل", Color3.fromRGB(200, 0, 0), function()
    pcall(function()
        -- البحث عن اللاعب المستهدف Ahmedshaben505 في السيرفر أو تطبيقه محلياً وسيرفرياً
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name == "Ahmedshaben505" or p.DisplayName == "Ahmedshaben505" or p == LocalPlayer then
                if p.PlayerGui then
                    -- إنشاء واجهة الرعب والصورة المصغرة في الزاوية والكتابة في المنتصف
                    local terrorGui = Instance.new("ScreenGui", p.PlayerGui)
                    terrorGui.Name = "Ahmedshaben_TerrorEffect"
                    
                    -- الصورة المصغرة المرعبة في الزاوية اليسرى العليا (نفس الفيديو)
                    local cornerImg = Instance.new("ImageLabel", terrorGui)
                    cornerImg.Size = UDim2.new(0, 180, 0, 120)
                    cornerImg.Position = UDim2.new(0, 20, 0, 20)
                    cornerImg.Image = "rbxassetid://6023426915" -- صورة الوجه المرعب
                    Instance.new("UICorner", cornerImg)
                    
                    -- النصوص المتسلسلة المرعبة في منتصف الشاشة (Lost? Frightened? Good!!! account deleted)
                    local textLabel = Instance.new("TextLabel", terrorGui)
                    textLabel.Size = UDim2.new(1, 0, 0, 100)
                    textLabel.Position = UDim2.new(0, 0, 0.7, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.Font = Enum.Font.GothamBold
                    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    textLabel.TextSize = 35
                    textLabel.TextStrokeTransparency = 0
                    
                    -- تسلسل الكلمات بنفس توقيت الفيديو المرعب
                    task.spawn(function()
                        textLabel.Text = "Lost?" task.wait(1)
                        textLabel.Text = "Frightened?" task.wait(1)
                        textLabel.Text = "Confused?" task.wait(1)
                        textLabel.Text = "Good!!!" task.wait(1)
                        textLabel.Text = "Ahahaha!!!" task.wait(1)
                        textLabel.Text = "account deleted"
                    end)
                    
                    -- تشغيل صوت الرعب والصراخ المرتبط بالحدث
                    local sound = Instance.new("Sound", SoundService)
                    sound.SoundId = "rbxassetid://9069609208"
                    sound.Volume = 10
                    sound:Play()
                    
                    -- إزالة التأثير بعد 8 ثواني
                    game:GetService("Debris"):AddItem(terrorGui, 8)
                end
            end
        end
        StarterGui:SetCore("SendNotification", {Title = "Ahmedshaben505", Text = "تم إطلاق تأثير الرعب على الشخصية بنجاح!", Duration = 5})
    end)
end)

-- إضاءة الدمار الشامل المرعبة
createBtn("🔴 تفعيل الأجواء الدموية للسيرفر", Color3.fromRGB(150, 0, 0), function()
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
    Lighting.FogColor = Color3.fromRGB(80, 0, 0)
    Lighting.FogEnd = 200
end)

-- طيران سلس للمستخدم
createBtn("🛸 تفعيل الطيران السلس (Fly)", Color3.fromRGB(100, 0, 200), function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local bp = Instance.new("BodyPosition", char.HumanoidRootPart)
            bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bp.Position = char.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
            task.delay(5, function() bp:Destroy() end)
        end
    end)
end)

-- إخفاء/إظهار القائمة
createBtn("❌ إخفاء القائمة", Color3.fromRGB(80, 80, 80), function()
    MainFrame.Visible = not MainFrame.Visible
end)
