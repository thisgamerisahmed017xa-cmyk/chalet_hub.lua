-- ==========================================
-- [Script Name]: Dead Roblox - Real HD Admin Bridge
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- دالة إرسال أمر شات حقيقي يتفاعل مع HD Admin في السيرفر
local function runAdminCommand(cmd)
    pcall(function()
        -- محاولة إرسال الأمر عبر الشات لتنفذه لوحة HD Admin الحقيقية بالماب
        local args = {
            [1] = cmd,
            [2] = "All"
        }
        -- البحث عن ريموت الشات أو HD Admin التنفيذي
        if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(cmd, "All")
        end
    end)
end

-- 1. واجهة الاعتمادات الرسمية على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadRoblox_HD_Commands"
ScreenGui.Parent = game.CoreGui

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CreditLabel.BackgroundTransparency = 0.2
CreditLabel.Position = UDim2.new(1, -240, 0, 15)
CreditLabel.Size = UDim2.new(0, 230, 0, 70)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "☠️ [DEAD ROBLOX HD SYSTEM]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n⚡ Status: Owner HD Bridge"

Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -220)
MainFrame.Size = UDim2.new(0, 360, 0, 440)
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
Title.Text = "☠️ HD ADMIN - OWNER COMMANDS"

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 0, 0, 50)
Scroll.Size = UDim2.new(1, 0, 1, -50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 3.5, 0)

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

-- ==================== الأوامر الحقيقية المرتبطة بـ HD Admin ====================

-- 1. إعطاء رتبة HD Admin لنفسك عبر أوامر الماب
createBtn("👑 تفعيل رتبة HD Admin الرسمية (Rank Me)", Color3.fromRGB(160, 0, 160), function()
    runAdminCommand(":rank me owner")
    runAdminCommand(":admin me")
    StarterGui:SetCore("SendNotification", {Title = "HD Admin", Text = "تم إرسال أمر تفعيل الأدمين للسيرفر!", Duration = 5})
end)

-- 2. إعطاء أدوات Btools حقيقية عبر الأدمن
createBtn("🛠️ إعطاء Btools الحقيقية (Tools All)", Color3.fromRGB(0, 110, 200), function()
    runAdminCommand(":tools me")
    runAdminCommand(":btools me")
end)

-- 3. طرد جميع اللاعبين حقيقي عبر أمر الأدمن
createBtn("🚪 طرد جميع اللاعبين (HD Kick All)", Color3.fromRGB(220, 20, 20), function()
    runAdminCommand(":kick all Dead Roblox Owner Control")
end)

-- 4. قتل جميع اللاعبين في السيرفر
createBtn("💀 قتل جميع اللاعبين (HD Kill All)", Color3.fromRGB(180, 50, 0), function()
    runAdminCommand(":kill all")
end)

-- 5. تطيير جميع اللاعبين في السماء
createBtn("🌪️ تطيير جميع اللاعبين (HD Fling All)", Color3.fromRGB(120, 50, 200), function()
    runAdminCommand(":fly all")
    runAdminCommand(":ungrav all")
end)

-- 6. تجميد حركة كل اللاعبين
createBtn("🧊 تجميد حركة السيرفر (HD Freeze All)", Color3.fromRGB(0, 100, 100), function()
    runAdminCommand(":freeze all")
end)

-- 7. إرسال رسالة تنبيه ضخمة لكل السيرفر
createBtn("📢 إرسال رسالة إدارية كبرى (HD Message)", Color3.fromRGB(200, 120, 0), function()
    runAdminCommand(":m [Dead Roblox] Owner viurstester505 & Idea zowb1 are controlling the server!")
end)

-- 8. تحويل ألوان السيرفر إلى أحمر دموي
createBtn("🔴 تحويل ألوان السيرفر (HD Night/Red)", Color3.fromRGB(130, 0, 0), function()
    runAdminCommand(":night")
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
end)

-- 9. سرعة المالك القصوى
createBtn("⚡ سرعة المالك الخارقة (HD Speed)", Color3.fromRGB(0, 150, 50), function()
    runAdminCommand(":speed me 250")
end)
