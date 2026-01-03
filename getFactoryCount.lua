----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns a table counting factories by type for a given country
-- Input: countryFolder (Folder from workspace.CountryData)
-- Output: table, e.g., {["Motor Factory"] = 2, ["Steel Manufactory"] = 1}
local function getFactoryCount(countryFolder)
    if not countryFolder then return {} end

    -- Get all cities for this country
    local countryName = countryFolder.Name
    local countryCitiesFolder = Workspace.Baseplate:FindFirstChild("Cities")
    local cityParent = countryCitiesFolder and countryCitiesFolder:FindFirstChild(countryName)
    if not cityParent then return {} end

    local factoryCounts = {}

    for _, city in pairs(cityParent:GetChildren()) do
        local buildingsFolder = city:FindFirstChild("Buildings")
        if buildingsFolder then
            for _, factory in pairs(buildingsFolder:GetChildren()) do
                factoryCounts[factory.Name] = (factoryCounts[factory.Name] or 0) + 1
            end
        end
    end

    return factoryCounts
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local iranFolder = Workspace.CountryData:FindFirstChild("Iran")
local counts = getFactoryCount(iranFolder)

if next(counts) then
    print("Factory counts in Iran:")
    for factoryType, count in pairs(counts) do
        print("-", factoryType, ":", count)
    end
else
    print("No factories found in Iran.")
end

return getFactoryCount