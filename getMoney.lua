----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns the money balance of a given country folder
-- Input: countryFolder (Folder) from workspace.CountryData
local function getCountryMoney(countryFolder)
    if not countryFolder then return nil end
    local economy = countryFolder:FindFirstChild("Economy")
    if economy and economy:FindFirstChild("Balance") then
        return economy.Balance.Value
    end
    return nil
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local balance = getCountryMoney(indonesia)

if balance then
    print("Indonesia's money balance:", balance)
else
    print("Could not find Indonesia's economy balance.")
end

return getCountryMoney