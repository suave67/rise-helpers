----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns a table of all resources for a given country folder
-- Each resource includes Stock and Flow
local helpers = {}

function helpers.getAllResources(countryFolder)
    if not countryFolder then return nil end
    local resourcesFolder = countryFolder:FindFirstChild("Resources")
    if not resourcesFolder then return nil end

    local resources = {}
    for _, res in pairs(resourcesFolder:GetChildren()) do
        if res:IsA("NumberValue") then
            local flow = res:FindFirstChild("Flow")
            resources[res.Name] = {
                Stock = res.Value,
                Flow  = flow and flow.Value or 0
            }
        end
    end

    return resources
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local indonesia = Workspace.CountryData:FindFirstChild("Indonesia")
local allResources = helpers.getAllResources(indonesia)
local allResources = getAllResources(indonesia)

if allResources then
    for name, info in pairs(allResources) do
        print(name, "Stock:", info.Stock, "Flow:", info.Flow)
    end
else
    print("Could not get resources for Indonesia.")
end

return {
    getAllResources = getAllResources
}