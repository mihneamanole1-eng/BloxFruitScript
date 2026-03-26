-- [[ PROJECT: ROMANIA FREEZE EDITION 🇷🇴 ]] --
-- Creat special pentru testarea desync-ului in Trade

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local clock = ReplicatedStorage.Remotes.Clock.DelayedRequestFunction
local location = ReplicatedStorage.Remotes.Location

print("🧊 Project Freeze Incarcat! Asteapta finalul numaratorii...")

-- Variabila de control (o poti schimba din consola: _G.Freeze = false)
_G.Freeze = true

-- 1. BLOCAREA LOCATIEI (Te face "invizibil" pentru serverul de trade)
local old; old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if self == location and _G.Freeze then
        -- Returnam nil ca sa oprim serverul din a afla unde esti
        return nil 
    end
    return old(self, ...)
end)

-- 2. LOOP-UL DE DESYNC (Incurcam ceasul serverului)
task.spawn(function()
    while _G.Freeze do
        pcall(function()
            -- Cerem timpul actual
            local t = clock:InvokeServer()
            -- Trimitem imediat inapoi un timp "inghetat" (offset mic)
            clock:InvokeServer(t - 0.5) 
            
            -- Spam de locatie falsa pentru a forca lag-ul pe server
            location:FireServer()
        end)
        -- Viteză mare pentru a forța blocajul
        task.wait(0.01) 
    end
end)

-- Mesaj de confirmare in consola F9
warn("!!! FREEZE ACTIVAT !!! Ruleaza trade-ul acum.")
