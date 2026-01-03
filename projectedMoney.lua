----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns projected money after a given number of turns
-- Inputs:
--   countryFolder: Folder from workspace.CountryData
--   turns: number of turns to project ahead
local function projectedMoney(countryFolder, turns)
    if not countryFolder or not turns or turns < 0 then return nil end

    -- Get current balance
    local economy = countryFolder:FindFirstChild("Economy")
    if not economy or not economy:FindFirstChild("Balance") then return nil end
    local currentBalance = economy.Balance.Value or 0

    -- Get net income
    local revenue = economy:FindFirstChild("Revenue")
    local expenses = economy:FindFirstChild("Expenses")
    if not revenue or not expenses then return nil end
    local netIncome = (revenue:GetAttribute("Total") or 0) - (expenses:GetAttribute("Total") or 0)

    -- Projected money
    return currentBalance + netIncome * turns
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local futureBalance = projectedMoney(indonesia, 10) -- 10 turns ahead

if futureBalance then
    print("Projected balance in 10 turns:", futureBalance)
else
    print("Could not calculate projected money for Indonesia.")
end

return projectedMoney