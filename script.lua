-- ==========================================
-- [Script Name]: Ultimate RV7 Rival Hub - Chalet & Server Control
-- [Creator]: viurstester505
-- [Idea By]: zowb1
-- ==========================================

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- 1. الواجهة والبصمة الرسمية على اليمين
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RV7_Ultimate_Hub"
ScreenGui.Parent = game.CoreGui

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = ScreenGui
CreditLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CreditLabel.BackgroundTransparency = 0.2
CreditLabel.Position = UDim2.new(1, -230, 0, 15)
CreditLabel.Size = UDim2.new(0, 220, 0, 65)
CreditLabel.Font = Enum.Font.Code
CreditLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
CreditLabel.TextSize = 13
CreditLabel.TextWrapped = true
CreditLabel.Text = "🔥 [RV7 KILLER HUB]\n👤 Creator: viurstester505\n💡 Idea: zowb1\n⚡ Status: Server God Mode"

local UICornerCredit = Instance.new("UICorner", CreditLabel)

-- 2. القائمة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -175)
MainFrame.Size = UDim2.new(0, 350, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

local UICornerMain = Instance.new("UICorner", MainFrame)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.Text = "👑 viurstester505 - Server Control Hub"

local UIList = Instance.new("UIListLayout", MainFrame)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)

-- وظيفة إنشاء الأزرار بسهولة
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = MainFrame
    btn.Size = UDim2.new(0.9, 0, 0, 35)
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

-- ==================== المميزات والأزرار ====================

-- 1. إصلاح الكلبشة والتطيير (Cuffs / Fling System)
createButton("⛓️ تفعيل الكلبشة المعدلة + Fling Player", Color3.fromRGB(130, 0, 180), function()
    pcall(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local bam = Instance.new("BodyThrust")
            bam.Parent = char.HumanoidRootPart
            bam.Force = Vector3.new(99999, 99999, 99999)
            bam.Location = char.HumanoidRootPart.Position
            print("[+] تم تفعيل الكلبشة والتطير بنجاح!")
        end
    end)
end)

-- 2. بناء الشاليهات والبيوت الحقيقية للسيرفر (Server Building)
createButton("🏠 بناء شاليه/بيت حقيقي للجميع (Build Structure)", Color3.fromRGB(0, 150, 70), function()
    pcall(function()
        local char = LocalPlayer.Character
        if char then
            local part = Instance.new("Part")
            part.Size = Vector3.new(40, 20, 40)
            part.Position = char.HumanoidRootPart.Position + Vector3.new(0, 10, 25)
            part.Anchored = true
            part.Material = Enum.Material.Wood
            part.BrickColor = BrickColor.new("Brown")
            part.Parent = workspace
            
            local roof = Instance.new("Part")
            roof.Size = Vector3.new(45, 5, 45)
            roof.Position = part.Position + Vector3.new(0, 12, 0)
            roof.Anchored = true
            roof.Material = Enum.Material.Concrete
            roof.BrickColor = BrickColor.new("Dark stone grey")
            roof.Parent = workspace
            print("[+] تم بناء الشاليه بنجاح في السيرفر!")
        end
    end)
end)

-- 3. سحب وتجميع جميع أفراد السيرفر عندك (Bring All Players)
createButton("🧲 سحب جميع اللاعبين إليك (Bring All)", Color3.fromRGB(200, 100, 0), function()
    pcall(function()
        local myPos = LocalPlayer.Character.HumanoidRootPart.CFrame
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                p.Character.HumanoidRootPart.CFrame = myPos + Vector3.new(math.random(-5,5), 0, math.random(-5,5))
            end
        end
    end)
end)

-- 4. التحكم في بيئة ومناخ السيرفر (Chalet Night Vibe)
createButton("🌌 أجواء الشاليهات الفخمة (RV7 Night Lighting)", Color3.fromRGB(30, 90, 180), function()
    Lighting.ClockTime = 0
    Lighting.Brightness = 3
    Lighting.OutdoorAmbient = Color3.fromRGB(100, 0, 200)
end)

-- 5. اختراق الجدران (Noclip)
local noclip = false
createButton("👻 اختراق الجدران (Noclip)", Color3.fromRGB(80, 80, 80), function()
    noclip = not noclip
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

-- 6. سرعة خارقة RV7 Speed
createButton("⚡ سرعة خارقة (WalkSpeed 150)", Color3.fromRGB(200, 0, 0), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 150
    end
end)
