----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns true if the country is in deficit (NetIncome < 0), false otherwise
-- Input: countryFolder (Folder from workspace.CountryData)
local function isInDeficit(countryFolder)
    if not countryFolder then return nil end

    local economy = countryFolder:FindFirstChild("Economy")
    if not economy then return nil end

    local revenue = economy:FindFirstChild("Revenue")
    local expenses = economy:FindFirstChild("Expenses")
    if not revenue or not expenses then return nil end

    local totalIncome = revenue:GetAttribute("Total") or 0
    local totalExpenses = expenses:GetAttribute("Total") or 0

    return (totalIncome - totalExpenses) < 0
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local deficit = isInDeficit(indonesia)

if deficit ~= nil then
    if deficit then
        print("Indonesia is running a deficit!")
    else
        print("Indonesia is financially healthy.")
    end
else
    print("Could not determine deficit status for Indonesia.")
end

return {
    isInDeficit = isInDeficit
}