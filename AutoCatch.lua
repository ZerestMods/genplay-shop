-- VIP KEY SYSTEM + AUTO CATCH - GIAO DIỆN CAO CẤP
-- Key: 07TEAM-2026-VIP

loadstring([[
local keyCorrect = "07TEAM-2026-VIP"
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local ts = game:GetService("TweenService")
local hs = game:GetService("HttpService")

-- ====== TẠO GUI KEY ======
local gui = Instance.new("ScreenGui")
gui.Name = "VIPKeySystem"
gui.ResetOnSpawn = false
gui.Parent = pg

-- Background mờ
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = game:GetService("Lighting")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 320)
main.Position = UDim2.new(0.5, -210, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(10, 12, 20)
main.BorderSizePixel = 0
main.Transparency = 0.15
main.Parent = gui

-- Viền sáng
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 4, 1, 4)
border.Position = UDim2.new(0, -2, 0, -2)
border.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
border.BackgroundTransparency = 0.7
border.BorderSizePixel = 0
border.Parent = main
local borderCorner = Instance.new("UICorner")
borderCorner.CornerRadius = UDim.new(0, 20)
borderCorner.Parent = border

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = main

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "✦ VIP SYSTEM ✦"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.TextSize = 38
title.Font = Enum.Font.GothamBold
title.Parent = main

-- Phụ đề
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(0.9, 0, 0, 25)
sub.Position = UDim2.new(0.05, 0, 0.28, 0)
sub.BackgroundTransparency = 1
sub.Text = "Nhập key để kích hoạt Auto Catch"
sub.TextColor3 = Color3.fromRGB(180, 190, 210)
sub.TextSize = 15
sub.Font = Enum.Font.Gotham
sub.Parent = main

-- Ô nhập key (có ẩn mật khẩu)
local input = Instance.new("TextBox")
input.Size = UDim2.new(0.85, 0, 0, 50)
input.Position = UDim2.new(0.075, 0, 0.4, 0)
input.BackgroundColor3 = Color3.fromRGB(25, 30, 45)
input.TextColor3 = Color3.new(1, 1, 1)
input.PlaceholderText = "🔑 Nhập key..."
input.Text = ""
input.TextSize = 20
input.Font = Enum.Font.Gotham
input.ClearTextOnFocus = false
-- Ẩn ký tự (giống mật khẩu)
input.Password = true
input.Parent = main

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = input

-- Nút LOGIN
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.4, 0, 0, 55)
btn.Position = UDim2.new(0.3, 0, 0.62, 0)
btn.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
btn.Text = "LOGIN"
btn.TextColor3 = Color3.new(1, 1, 1)
btn.TextSize = 24
btn.Font = Enum.Font.GothamSemibold
btn.Parent = main

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 14)
btnCorner.Parent = btn

-- Hiệu ứng glow cho nút
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1.1, 0, 1.1, 0)
glow.Position = UDim2.new(-0.05, 0, -0.05, 0)
glow.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
glow.BackgroundTransparency = 0.6
glow.BorderSizePixel = 0
glow.Parent = btn
local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 18)
glowCorner.Parent = glow

-- Trạng thái
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.9, 0, 0, 30)
status.Position = UDim2.new(0.05, 0, 0.82, 0)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 100, 100)
status.TextSize = 15
status.Font = Enum.Font.Gotham
status.Parent = main

-- ====== HIỆU ỨNG HOVER ======
btn.MouseEnter:Connect(function()
    ts:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 200, 255)}):Play()
    ts:Create(glow, TweenInfo.new(0.2), {BackgroundTransparency = 0.3}):Play()
end)
btn.MouseLeave:Connect(function()
    ts:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 180, 255)}):Play()
    ts:Create(glow, TweenInfo.new(0.2), {BackgroundTransparency = 0.6}):Play()
end)

-- ====== KÉO THẢ ======
local drag, start, pos
main.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        drag = true
        start = i.Position
        pos = main.Position
    end
end)
main.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end
end)
game:GetService("UserInputService").InputChanged:Connect(function(i)
    if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - start
        main.Position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X, pos.Y.Scale, pos.Y.Offset + delta.Y)
    end
end)

-- ====== HÀM KIỂM TRA KEY ======
local function verify()
    local k = input.Text
    if k == keyCorrect then
        -- Xóa GUI key
        gui:Destroy()
        blur:Destroy()
        -- Thông báo
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "✦ VIP SYSTEM ✦",
            Text = "✅ Đăng nhập thành công!",
            Duration = 2
        })
        -- ====== AUTO CATCH + ON/OFF ======
        loadstring([[
            local p=game.Players.LocalPlayer
            local c=p.Character or p.CharacterAdded:Wait()
            local h=c:WaitForChild("HumanoidRootPart")
            local m=c:WaitForChild("Humanoid")
            local e=false
            local ball
            local hs=game:GetService("HttpService")
            -- Ẩn script
            local folder=Instance.new("Folder")
            folder.Name=hs:GenerateGUID(false)
            folder.Parent=p.PlayerGui
            script.Parent=folder
            -- Tìm bóng
            spawn(function()
                while wait(0.3) do
                    for _,o in pairs(workspace:GetChildren()) do
                        if o:IsA("Part") and o.Name:lower():find("ball") then
                            ball=o
                            break
                        end
                    end
                end
            end)
            -- Hàm bắt
            local function catch()
                while e do
                    wait(math.random(2,5)/100)
                    local b=ball
                    if b and h and m then
                        local dist=(h.Position-b.Position).Magnitude
                        if dist<30 and b.Velocity.Magnitude>5 then
                            local dir=(b.Position-h.Position).Unit
                            h.Position=h.Position+dir*7
                            m:ChangeState(Enum.HumanoidStateType.Jumping)
                            wait(0.05)
                            b.Velocity=Vector3.new(
                                math.random(-6,6),
                                math.random(12,22),
                                math.random(-6,6)
                            )
                        end
                    end
                end
            end
            -- GUI nút ON/OFF VIP
            local gui=Instance.new("ScreenGui")
            gui.Name=hs:GenerateGUID(false)
            gui.Parent=p.PlayerGui
            local btn=Instance.new("TextButton")
            btn.Size=UDim2.new(0,150,0,60)
            btn.Position=UDim2.new(0.8,0,0.78,0)
            btn.Text="OFF"
            btn.TextScaled=true
            btn.BackgroundColor3=Color3.fromRGB(200,50,50)
            btn.TextColor3=Color3.fromRGB(255,255,255)
            btn.Parent=gui
            -- Viền đẹp
            local br=Instance.new("UIStroke")
            br.Color=Color3.fromRGB(255,255,255)
            br.Thickness=2
            br.Transparency=0.5
            br.Parent=btn
            local cr=Instance.new("UICorner")
            cr.CornerRadius=UDim.new(0,15)
            cr.Parent=btn
            -- Sự kiện bấm
            btn.MouseButton1Click:Connect(function()
                e=not e
                btn.Text=e and"✦ ON ✦" or"OFF"
                btn.BackgroundColor3=e and Color3.fromRGB(0,200,100) or Color3.fromRGB(200,50,50)
                if e then
                    spawn(catch)
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "AUTO CATCH",
                        Text = "✅ Đã bật",
                        Duration = 1
                    })
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "AUTO CATCH",
                        Text = "❌ Đã tắt",
                        Duration = 1
                    })
                end
            end)
            -- Reset
            p.CharacterAdded:Connect(function(n)
                c=n
                h=c:WaitForChild("HumanoidRootPart")
                m=c:WaitForChild("Humanoid")
                e=false
                btn.Text="OFF"
                btn.BackgroundColor3=Color3.fromRGB(200,50,50)
            end)
            print("✦ VIP SYSTEM - AUTO CATCH LOADED ✦")
        ]])()
    else
        status.Text = "❌ Key không hợp lệ! Nhập lại."
        status.TextColor3 = Color3.fromRGB(255,80,80)
        input.Text = ""
        -- Rung lắc hiệu ứng sai
        local x = main.Position.X.Offset
        for i=1,3 do
            main.Position = UDim2.new(0.5, x + math.random(-15,15), 0.5, -160)
            wait(0.05)
        end
        main.Position = UDim2.new(0.5, -210, 0.5, -160)
    end
end

btn.MouseButton1Click:Connect(verify)
input.FocusLost:Connect(function(enter)
    if enter then verify() end
end)

-- Nhấn Enter để login
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Return and gui.Parent then
        verify()
    end
end)
]])()
