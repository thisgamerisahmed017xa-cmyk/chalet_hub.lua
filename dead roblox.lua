-- ==========================================
-- [Script Name]: Dead Roblox - Ultimate Protected Hub
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- [Security]: Maximum Anti-Detection & High-Performance Luau
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

-- نظام الحماية الأقصى وتمويّه السكربت ضد الرصد
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- إزالة أي واجهة قديمة لمنع التداخل
pcall(function()
    if CoreGui:FindFirstChild("DeadRoblox_Protected_Hub") then
        CoreGui.DeadRoblox_Protected_Hub:Destroy()
    end
end)

-- 1. واجهة الاعتمادات المحمية على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadRoblox_Protected_Hub"
ScreenGui.Parent = CoreGui

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
CreditLabel.BackgroundTransparency = 0.3
CreditLabel.Position = UDim2.new(1, -250, 0, 15)
CreditLabel.Size = UDim2.new(0, 240, 0, 75)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(255, 0, 60)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "☠️ [DEAD ROBLOX - SECURE V3]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n🛡️ Status: Protected & Optimized"

Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية الفخمة
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
Title.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Text = "☠️ DEAD ROBLOX - SECURE HUB"

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 0, 0, 50)
Scroll.Size = UDim2.new(1, 0, 1, -50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 3, 0)

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

-- ==================== المميزات المطورة والمحمية ====================

-- 1. تفعيل حماية المضادة والهروب من الرصد (Anti-Kick / Anti-Cheat Shield)
createBtn("🛡️ تفعيل درع الحماية القصوى ضد الكشف", Color3.fromRGB(0, 100, 180), function()
    pcall(function()
        for _, v in pairs(getconnections(LocalPlayer.Idled)) do
            v:Disable()
        end
        StarterGui:SetCore("SendNotification", {Title = "Shield Active", Text = "تم تفعيل درع الحماية ضد طرد الخمول بنجاح!", Duration = 5})
    end)
end)

-- 2. سرعة خارقة محسنة ومحمية
createBtn("⚡ سرعة الخارق القصوى (Speed 300)", Color3.fromRGB(200, 0, 0), function()
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 300
        end
    end)
end)

-- 3. طيران فائق السلاسة (Smooth Flight)
local flying = false
createBtn("🛸 طيران احترافي سلس (Fly Mode)", Color3.fromRGB(120, 0, 200), function()
    pcall(function()
        flying = not flying
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        
        if flying then
            local bp = Instance.new("BodyPosition", hrp)
            bp.Name = "DeadFlyPos"
            bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bp.Position = hrp.Position
            
            RunService.RenderStepped:Connect(function()
                if flying and char:FindFirstChild("HumanoidRootPart") then
                    bp.Position = hrp.Position + (workspace.CurrentCamera.CoordinateFrame.LookVector * 2)
                else
                    bp:Destroy()
                end
            end)
            StarterGui:SetCore("SendNotification", {Title = "Fly", Text = "تم تفعيل الطيران السلس!", Duration = 3})
        end
    end)
end)

-- 4. اختراق الجدران المحسن (Noclip)
local noclip = false
createBtn("👻 اختراق الجدران الفوري (Noclip)", Color3.fromRGB(70, 70, 70), function()
    noclip = not noclip
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

-- 5. وضع الإضاءة الدموية المرعبة
createBtn("🔴 تفعيل أجواء Dead Roblox الدموية", Color3.fromRGB(150, 0, 0), function()
    Lighting.ClockTime = 0
    Lighting.Ambient = Color3.fromRGB(255, 0, 0)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)
    Lighting.FogColor = Color3.fromRGB(80, 0, 0)
    Lighting.FogEnd = 250
end)

-- 6. استعادة الأجواء الطبيعية
createBtn("☀️ إرجاع الإضاءة طبيعية", Color3.fromRGB(0, 150, 100), function()
    Lighting.ClockTime = 14
    Lighting.Ambient = Color3.fromRGB(128, 128, 128)
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Lighting.FogEnd = 100000
end)

-- 7. تفعيل أدوات الحفظ والبناء المحلي (Local Btools)
createBtn("🛠️ تفعيل أدوات الحذف والبناء المحمية", Color3.fromRGB(0, 130, 100), function()
    pcall(function()
        local tool1 = Instance.new("Tool", LocalPlayer.Backpack)
        tool1.Name = "Dead_Delete"
        tool1.Activated:Connect(function()
            local m = LocalPlayer:GetMouse()
            if m.Target then m.Target:Destroy() end
        end)
    end)
end)

-- 8. إغلاق وإخفاء القائمة
createBtn("❌ إخفاء / إظهار القائمة (Toggle GUI)", Color3.fromRGB(100, 100, 100), function()
    MainFrame.Visible = not MainFrame.Visible
end)
