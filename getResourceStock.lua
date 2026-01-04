----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns the stock of a specific resource for a given country folder
-- Inputs:
--   countryFolder: Folder from workspace.CountryData
--   resourceName: string, e.g., "Electronics", "Fertilizer", etc.
local function getResourceStock(countryFolder, resourceName)
    if not countryFolder or not resourceName then return nil end
    local resources = countryFolder:FindFirstChild("Resources")
    if resources then
        local resource = resources:FindFirstChild(resourceName)
        if resource and resource:IsA("NumberValue") then
            return resource.Value
        end
    end
    return nil
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local electronicsStock = getResourceStock(indonesia, "Electronics")

if electronicsStock then
    print("Indonesia's Electronics stock:", electronicsStock)
else
    print("Could not find Electronics stock for Indonesia.")
end

return {
    getResourceStock = getResourceStock
}