----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Players = game:GetService("Players")
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns the local player's country folder
local function getLocalPlayerCountry()
    local localPlayer = Players.LocalPlayer
    for _, country in pairs(Workspace.CountryData:GetChildren()) do
        local leader = country:FindFirstChild("Leader")
        if leader and leader:IsA("StringValue") and leader.Value == localPlayer.Name then
            return country  -- Return the folder directly
        end
    end
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local myCountry = getLocalPlayerCountry()
if myCountry then
    print("Local player owns:", myCountry.Name)
else
    print("Local player does not own a country.")
end

return {
    getLocalPlayerCountry = getLocalPlayerCountry
}