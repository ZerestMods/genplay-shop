loadstring([[
local keyCorrect = "07TeamBall"
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local ts = game:GetService("TweenService")
local hs = game:GetService("HttpService")
local rs = game:GetService("RunService")
local lp = game:GetService("Lighting")

-- ====== ANTI-BAN LỚP 1: ẨN SCRIPT ======
local folder = Instance.new("Folder")
folder.Name = hs:GenerateGUID(false)
folder.Parent = pg
script.Parent = folder

-- ====== ANTI-BAN LỚP 2: CHẶN CHECK ======
local oldMeta = getrawmetatable and getrawmetatable(game) or getmetatable(game)
local oldNamecall = oldMeta.__namecall
oldMeta.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if args[1] and type(args[1]) == "string" then
        local s = args[1]:lower()
        if s:find("ban") or s:find("check") or s:find("detect") or s:find("scan") or s:find("antibot") then
            return nil
        end
    end
    return oldNamecall and oldNamecall(self, ...) or self
end)

-- ====== GUI ĐĂNG NHẬP ======
local gui = Instance.new("ScreenGui")
gui.Name = "07TeamVIP"
gui.ResetOnSpawn = false
gui.Parent = pg

local blur = Instance.new("BlurEffect")
blur.Size = 14
blur.Parent = lp

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 520)
main.Position = UDim2.new(0.5, -210, 0.5, -260)
main.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 24)
corner.Parent = main

-- Viền đỏ neon
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 6, 1, 6)
border.Position = UDim2.new(0, -3, 0, -3)
border.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
border.BackgroundTransparency = 0.4
border.BorderSizePixel = 0
border.Parent = main
local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 26)
borderCorner.Parent = border

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 80)
header.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
header.Position = UDim2.new(0, 0, 0, 0)
header.BorderSizePixel = 0
header.Parent = main
local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 24)
headerCorner.Parent = header

local logo = Instance.new("TextLabel")
logo.Size = UDim2.new(1, 0, 1, 0)
logo.BackgroundTransparency = 1
logo.Text = "✦ 07TEAM BALL ✦"
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.TextSize = 38
logo.Font = Enum.Font.GothamBold
logo.Parent = header

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 30)
sub.Position = UDim2.new(0, 0, 0, 85)
sub.BackgroundTransparency = 1
sub.Text = "🔐 NHẬP KEY ĐỂ KÍCH HOẠT"
sub.TextColor3 = Color3.fromRGB(180, 180, 200)
sub.TextSize = 16
sub.Font = Enum.Font.GothamSemibold
sub.Parent = main

-- Ô nhập key
local input = Instance.new("TextBox")
input.Size = UDim2.new(0.85, 0, 0, 55)
input.Position = UDim2.new(0.075, 0, 0.28, 0)
input.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "🔑 NHẬP KEY CỦA BẠN"
input.Text = ""
input.TextSize = 20
input.Font = Enum.Font.Gotham
input.ClearTextOnFocus = false
input.Password = true
input.Parent = main

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 14)
inputCorner.Parent = input

-- Nút Login
local loginBtn = Instance.new("TextButton")
loginBtn.Size = UDim2.new(0.85, 0, 0, 55)
loginBtn.Position = UDim2.new(0.075, 0, 0.42, 0)
loginBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
loginBtn.Text = "LOGIN"
loginBtn.TextColor3 = Color3.new(1, 1, 1)
loginBtn.TextSize = 26
loginBtn.Font = Enum.Font.GothamBold
loginBtn.Parent = main

local loginCorner = Instance.new("UICorner")
loginCorner.CornerRadius = UDim.new(0, 14)
loginCorner.Parent = loginBtn

-- Nút chức năng nhỏ
local pasteBtn = Instance.new("TextButton")
pasteBtn.Size = UDim2.new(0.4, 0, 0, 40)
pasteBtn.Position = UDim2.new(0.075, 0, 0.56, 0)
pasteBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
pasteBtn.Text = "📋 DÁN KEY"
pasteBtn.TextColor3 = Color3.new(1, 1, 1)
pasteBtn.TextSize = 16
pasteBtn.Font = Enum.Font.Gotham
pasteBtn.Parent = main

local pasteCorner = Instance.new("UICorner")
pasteCorner.CornerRadius = UDim.new(0, 12)
pasteCorner.Parent = pasteBtn

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.4, 0, 0, 40)
saveBtn.Position = UDim2.new(0.525, 0, 0.56, 0)
saveBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
saveBtn.Text = "💾 LƯU KEY"
saveBtn.TextColor3 = Color3.new(1, 1, 1)
saveBtn.TextSize = 16
saveBtn.Font = Enum.Font.Gotham
saveBtn.Parent = main

local saveCorner = Instance.new("UICorner")
saveCorner.CornerRadius = UDim.new(0, 12)
saveCorner.Parent = saveBtn

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.9, 0, 0, 30)
status.Position = UDim2.new(0.05, 0, 0.72, 0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.TextSize = 15
status.Font = Enum.Font.Gotham
status.Parent = main

-- AntiBan label
local antiLabel = Instance.new("TextLabel")
antiLabel.Size = UDim2.new(0.9, 0, 0, 25)
antiLabel.Position = UDim2.new(0.05, 0, 0.82, 0)
antiLabel.BackgroundTransparency = 1
antiLabel.Text = "🛡️ ANTIBAN ACTIVE"
antiLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
antiLabel.TextSize = 14
antiLabel.Font = Enum.Font.Gotham
antiLabel.Parent = main

-- ====== HIỆU ỨNG ======
loginBtn.MouseEnter:Connect(function()
    ts:Create(loginBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play()
end)
loginBtn.MouseLeave:Connect(function()
    ts:Create(loginBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
end)

-- ====== CHỨC NĂNG ======
pasteBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        local clip = getclipboard and getclipboard() or ""
        if clip ~= "" then
            input.Text = clip
            status.Text = "✅ Đã dán key!"
            status.TextColor3 = Color3.fromRGB(0, 255, 100)
            wait(1.5)
            status.Text = ""
        else
            status.Text = "❌ Clipboard trống!"
        end
    else
        status.Text = "❌ Không hỗ trợ dán!"
    end
end)

saveBtn.MouseButton1Click:Connect(function()
    local k = input.Text
    if k ~= "" then
        p:SetAttribute("SavedKey07", k)
        status.Text = "✅ Đã lưu key!"
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        wait(2)
        status.Text = ""
    else
        status.Text = "❌ Chưa nhập key!"
    end
end)

-- ====== HÀM CHÍNH SAU KHI LOGIN ======
local function loadMainScript()
    gui:Destroy()
    blur:Destroy()
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✦ 07TEAM BALL ✦",
        Text = "✅ KÍCH HOẠT THÀNH CÔNG!",
        Duration = 2
    })
    
    -- ====== VARIABLES ======
    local char = p.Character or p.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local hum = char:WaitForChild("Humanoid")
    local ball = nil
    local hitbox = nil
    local hitboxEnabled = false
    local autoSelectEnabled = false
    local selectedPosition = "GK" -- GK hoặc CF
    
    -- ====== TÌM BÓNG ======
    spawn(function()
        while wait(0.1) do
            for _, o in pairs(workspace:GetChildren()) do
                if o:IsA("Part") and o.Name:lower():find("ball") then
                    ball = o
                    break
                end
            end
        end
    end)
    
    -- ====== TẠO HITBOX ĐỎ ======
    local function createHitbox()
        if hitbox then hitbox:Destroy() end
        if not ball then return end
        
        hitbox = Instance.new("Part")
        hitbox.Size = Vector3.new(8, 8, 8) -- Size to
        hitbox.CFrame = ball.CFrame
        hitbox.Anchored = true
        hitbox.CanCollide = false
        hitbox.Transparency = 0.4
        hitbox.Color = Color3.fromRGB(255, 0, 0)
        hitbox.Material = Enum.Material.Neon
        hitbox.Name = "HitBox07"
        hitbox.Parent = workspace
        
        -- Chỉ mình thấy (dùng LocalTransparency)
        local att = Instance.new("Part")
        att.Size = Vector3.new(8.5, 8.5, 8.5)
        att.CFrame = ball.CFrame
        att.Anchored = true
        att.CanCollide = false
        att.Transparency = 0.7
        att.Color = Color3.fromRGB(255, 50, 50)
        att.Material = Enum.Material.Neon
        att.Name = "HitBoxGlow"
        att.Parent = workspace
        
        -- Cập nhật vị trí hitbox
        spawn(function()
            while hitboxEnabled and ball do
                wait(0.03)
                if hitbox then
                    hitbox.CFrame = ball.CFrame
                end
                if att then
                    att.CFrame = ball.CFrame
                end
            end
        end)
    end
    
    -- ====== CƯỚP BÓNG KHI LƯỚT ======
    local function stealBall()
        if not hitboxEnabled or not ball or not hrp then return end
        local dist = (hrp.Position - ball.Position).Magnitude
        if dist < 8 then -- Trong hitbox
            -- Đẩy bóng về phía mình
            local dir = (hrp.Position - ball.Position).Unit
            ball.Velocity = Vector3.new(
                dir.X * 15,
                10,
                dir.Z * 15
            )
            -- Chuyển bóng về chân
            local ballHandle = ball:FindFirstChild("Handle")
            if ballHandle then
                ballHandle.Velocity = Vector3.new(
                    dir.X * 10,
                    5,
                    dir.Z * 10
                )
            end
            -- Hiệu ứng cướp
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "⚽ CƯỚP BÓNG",
                Text = "Đã cướp bóng thành công!",
                Duration = 0.5
            })
        end
    end
    
    -- ====== AUTO SELECT GK/CF ======
    local function autoSelect()
        while autoSelectEnabled do
            wait(0.5)
            -- Tìm GUI chọn vị trí
            local selectGui = nil
            for _, v in pairs(pg:GetChildren()) do
                if v:IsA("ScreenGui") and v.Name:lower():find("select") then
                    selectGui = v
                    break
                end
            end
            
            if selectGui then
                -- Tìm nút GK hoặc CF
                for _, btn in pairs(selectGui:GetDescendants()) do
                    if btn:IsA("TextButton") then
                        local txt = btn.Text:lower()
                        if selectedPosition == "GK" and (txt:find("gk") or txt:find("thủ môn") or txt:find("goalkeeper")) then
                            btn:Click()
                            wait(0.1)
                        elseif selectedPosition == "CF" and (txt:find("cf") or txt:find("tiền đạo") or txt:find("forward")) then
                            btn:Click()
                            wait(0.1)
                        end
                    end
                end
            end
        end
    end
    
    -- ====== GUI ĐIỀU KHIỂN ======
    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = hs:GenerateGUID(false)
    mainGui.Parent = pg
    
    -- Frame chính
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 320)
    frame.Position = UDim2.new(0.75, 0, 0.5, -160)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    frame.BorderSizePixel = 0
    frame.Parent = mainGui
    
    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 16)
    frameCorner.Parent = frame
    
    -- Viền đỏ
    local frameBorder = Instance.new("Frame")
    frameBorder.Size = UDim2.new(1, 4, 1, 4)
    frameBorder.Position = UDim2.new(0, -2, 0, -2)
    frameBorder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    frameBorder.BackgroundTransparency = 0.5
    frameBorder.BorderSizePixel = 0
    frameBorder.Parent = frame
    local fbCorner = Instance.new("UICorner")
    fbCorner.CornerRadius = UDim.new(0, 18)
    fbCorner.Parent = frameBorder
    
    -- Title
    local titleGui = Instance.new("TextLabel")
    titleGui.Size = UDim2.new(1, 0, 0, 40)
    titleGui.BackgroundTransparency = 1
    titleGui.Text = "✦ 07TEAM ✦"
    titleGui.TextColor3 = Color3.fromRGB(255, 50, 50)
    titleGui.TextSize = 22
    titleGui.Font = Enum.Font.GothamBold
    titleGui.Parent = frame
    
    -- Nút ON/OFF Hitbox (hình đẹp)
    local hitboxBtn = Instance.new("TextButton")
    hitboxBtn.Size = UDim2.new(0.85, 0, 0, 50)
    hitboxBtn.Position = UDim2.new(0.075, 0, 0.15, 0)
    hitboxBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    hitboxBtn.Text = "⚽ HITBOX: OFF"
    hitboxBtn.TextColor3 = Color3.new(1, 1, 1)
    hitboxBtn.TextSize = 18
    hitboxBtn.Font = Enum.Font.GothamSemibold
    hitboxBtn.Parent = frame
    
    local hbCorner = Instance.new("UICorner")
    hbCorner.CornerRadius = UDim.new(0, 12)
    hbCorner.Parent = hitboxBtn
    
    -- Nút chọn GK
    local gkBtn = Instance.new("TextButton")
    gkBtn.Size = UDim2.new(0.4, 0, 0, 45)
    gkBtn.Position = UDim2.new(0.075, 0, 0.38, 0)
    gkBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    gkBtn.Text = "🧤 GK"
    gkBtn.TextColor3 = Color3.new(1, 1, 1)
    gkBtn.TextSize = 18
    gkBtn.Font = Enum.Font.GothamBold
    gkBtn.Parent = frame
    
    local gkCorner = Instance.new("UICorner")
    gkCorner.CornerRadius = UDim.new(0, 10)
    gkCorner.Parent = gkBtn
    
    -- Nút chọn CF
    local cfBtn = Instance.new("TextButton")
    cfBtn.Size = UDim2.new(0.4, 0, 0, 45)
    cfBtn.Position = UDim2.new(0.525, 0, 0.38, 0)
    cfBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    cfBtn.Text = "⚡ CF"
    cfBtn.TextColor3 = Color3.new(1, 1, 1)
    cfBtn.TextSize = 18
    cfBtn.Font = Enum.Font.GothamBold
    cfBtn.Parent = frame
    
    local cfCorner = Instance.new("UICorner")
    cfCorner.CornerRadius = UDim.new(0, 10)
    cfCorner.Parent = cfBtn
    
    -- Nút AUTO SELECT
    local autoBtn = Instance.new("TextButton")
    autoBtn.Size = UDim2.new(0.85, 0, 0, 45)
    autoBtn.Position = UDim2.new(0.075, 0, 0.55, 0)
    autoBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    autoBtn.Text = "🔄 AUTO SELECT: OFF"
    autoBtn.TextColor3 = Color3.new(1, 1, 1)
    autoBtn.TextSize = 16
    autoBtn.Font = Enum.Font.GothamSemibold
    autoBtn.Parent = frame
    
    local autoCorner = Instance.new("UICorner")
    autoCorner.CornerRadius = UDim.new(0, 12)
    autoCorner.Parent = autoBtn
    
    -- Status vị trí
    local posLabel = Instance.new("TextLabel")
    posLabel.Size = UDim2.new(0.9, 0, 0, 25)
    posLabel.Position = UDim2.new(0.05, 0, 0.72, 0)
    posLabel.BackgroundTransparency = 1
    posLabel.Text = "VỊ TRÍ: GK"
    posLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    posLabel.TextSize = 15
    posLabel.Font = Enum.Font.Gotham
    posLabel.Parent = frame
    
    -- AntiBan status
    local antiStatus = Instance.new("TextLabel")
    antiStatus.Size = UDim2.new(0.9, 0, 0, 20)
    antiStatus.Position = UDim2.new(0.05, 0, 0.85, 0)
    antiStatus.BackgroundTransparency = 1
    antiStatus.Text = "🛡️ ANTIBAN ACTIVE"
    antiStatus.TextColor3 = Color3.fromRGB(0, 255, 100)
    antiStatus.TextSize = 13
    antiStatus.Font = Enum.Font.Gotham
    antiStatus.Parent = frame
    
    -- Kéo thả
    local drag, start, posFrame
    frame.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true
            start = i.Position
            posFrame = frame.Position
        end
    end)
    frame.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = i.Position - start
            frame.Position = UDim2.new(posFrame.X.Scale, posFrame.X.Offset + delta.X, posFrame.Y.Scale, posFrame.Y.Offset + delta.Y)
        end
    end)
    
    -- ====== SỰ KIỆN NÚT ======
    -- Hitbox ON/OFF
    hitboxBtn.MouseButton1Click:Connect(function()
        hitboxEnabled = not hitboxEnabled
        hitboxBtn.Text = hitboxEnabled and "⚽ HITBOX: ON" or "⚽ HITBOX: OFF"
        hitboxBtn.BackgroundColor3 = hitboxEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        if hitboxEnabled and ball then
            createHitbox()
        elseif not hitboxEnabled and hitbox then
            hitbox:Destroy()
            hitbox = nil
        end
    end)
    
    -- Chọn GK
    gkBtn.MouseButton1Click:Connect(function()
        selectedPosition = "GK"
        posLabel.Text = "VỊ TRÍ: GK"
        gkBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        cfBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "🧤 GK",
            Text = "Đã chọn vị trí Thủ Môn",
            Duration = 1
        })
    end)
    
    -- Chọn CF
    cfBtn.MouseButton1Click:Connect(function()
        selectedPosition = "CF"
        posLabel.Text = "VỊ TRÍ: CF"
        cfBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        gkBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "⚡ CF",
            Text = "Đã chọn vị trí Tiền Đạo",
            Duration = 1
        })
    end)
    
    -- Auto Select ON/OFF
    autoBtn.MouseButton1Click:Connect(function()
        autoSelectEnabled = not autoSelectEnabled
        autoBtn.Text = autoSelectEnabled and "🔄 AUTO SELECT: ON" or "🔄 AUTO SELECT: OFF"
        autoBtn.BackgroundColor3 = autoSelectEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        if autoSelectEnabled then
            spawn(autoSelect)
        end
    end)
    
    -- ====== VÒNG LẶP CƯỚP BÓNG ======
    spawn(function()
        while wait(0.05) do
            if hitboxEnabled then
                stealBall()
            end
        end
    end)
    
    -- ====== RESET KHI CHẾT ======
    p.CharacterAdded:Connect(function(newChar)
        char = newChar
        hrp = char:WaitForChild("HumanoidRootPart")
        hum = char:WaitForChild("Humanoid")
        hitboxEnabled = false
        hitboxBtn.Text = "⚽ HITBOX: OFF"
        hitboxBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        if hitbox then
            hitbox:Destroy()
            hitbox = nil
        end
    end)
    
    print("✦ 07TEAM BALL VIP LOADED ✦")
end

-- ====== HÀM KIỂM TRA KEY ======
local function verify()
    local k = input.Text
    if k == keyCorrect then
        loadMainScript()
    else
        status.Text = "❌ KEY SAI! VUI LÒNG NHẬP LẠI"
        status.TextColor3 = Color3.fromRGB(255, 50, 50)
        input.Text = ""
        -- Rung lắc
        local x = main.Position.X.Offset
        for i = 1, 4 do
            main.Position = UDim2.new(0.5, x + math.random(-20, 20), 0.5, -260)
            wait(0.05)
        end
        main.Position = UDim2.new(0.5, -210, 0.5, -260)
    end
end

loginBtn.MouseButton1Click:Connect(verify)
input.FocusLost:Connect(function(enter)
    if enter then verify() end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Return and gui.Parent then
        verify()
    end
end)
]])()