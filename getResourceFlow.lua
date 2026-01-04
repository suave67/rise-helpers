----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns the flow of a specific resource for a given country folder
-- Inputs:
--   countryFolder: Folder from workspace.CountryData
--   resourceName: string, e.g., "Electronics", "Fertilizer", etc.
local function getResourceFlow(countryFolder, resourceName)
    if not countryFolder or not resourceName then return nil end

    local resources = countryFolder:FindFirstChild("Resources")
    if not resources then return nil end

    local resource = resources:FindFirstChild(resourceName)
    if not resource or not resource:IsA("NumberValue") then return nil end

    local flow = resource:FindFirstChild("Flow")
    if not flow or not flow:IsA("NumberValue") then return nil end

    return flow.Value
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local electronicsFlow = getResourceFlow(indonesia, "Electronics")

if electronicsFlow then
    print("Indonesia's Electronics flow:", electronicsFlow)
else
    print("Could not find Electronics flow for Indonesia.")
end

return {
    getResourceFlow = getResourceFlow
}