----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns the total income (Revenue.Total attribute) of a given country folder
local function getIncome(countryFolder)
    if not countryFolder then return nil end
    local economy = countryFolder:FindFirstChild("Economy")
    local revenue = economy and economy:FindFirstChild("Revenue")
    return revenue and revenue:GetAttribute("Total") or nil
end

-- Returns the total expenses (Expenses.Total attribute) of a given country folder
local function getExpenses(countryFolder)
    if not countryFolder then return nil end
    local economy = countryFolder:FindFirstChild("Economy")
    local expenses = economy and economy:FindFirstChild("Expenses")
    return expenses and expenses:GetAttribute("Total") or nil
end

-- Returns the net income (Income - Expenses) of a given country folder
local function getNetIncome(countryFolder)
    local income = getIncome(countryFolder) or 0
    local expenses = getExpenses(countryFolder) or 0
    return income - expenses
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")

print("Income:", getIncome(indonesia))
print("Expenses:", getExpenses(indonesia))
print("Net Income:", getNetIncome(indonesia))

return getNetIncome