----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Checks if a country has a surplus of a specific resource
-- Inputs:
--   countryFolder: Folder from workspace.CountryData
--   resourceName: string, e.g., "Electronics"
--   amount: number to check against
local function hasSurplus(countryFolder, resourceName, amount)
    if not countryFolder or not resourceName or not amount then return nil end

    local resources = countryFolder:FindFirstChild("Resources")
    if not resources then return nil end

    local resource = resources:FindFirstChild(resourceName)
    if not resource or not resource:IsA("NumberValue") then return nil end

    return resource.Value >= amount
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local surplus = hasSurplus(indonesia, "Electronics", 50)

if surplus ~= nil then
    if surplus then
        print("Indonesia has at least 50 Electronics.")
    else
        print("Indonesia does not have enough Electronics.")
    end
else
    print("Could not determine resource surplus for Indonesia.")
end

return {
    hasSurplus = hasSurplus
}