----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Builds a factory in a given city using the remote
-- Inputs:
--   cityFolder: Folder from workspace.Baseplate.Cities.[Country].[City]
--   factoryType: string, e.g., "Motor Factory"
-- Notes:
-- ⚙️ Actual Factory Types in Rise of Nations:
-- Electronic Factory     -- produces electronics
-- Motor Factory          -- produces motor parts
-- Steel Manufactory      -- produces steel
-- Fertilizer Factory     -- produces fertilizer
-- Civilian Factory       -- produces consumer goods
-- Aircraft Factory       -- produces aircraft parts
-- Uranium Enricher       -- produces enriched uranium

local function buildFactory(cityFolder, factoryType)
    if not cityFolder or not factoryType then return false end

    local createBuildingRemote = Workspace.GameManager:FindFirstChild("CreateBuilding")
    if not createBuildingRemote then
        warn("CreateBuilding remote not found!")
        return false
    end

    -- Fire the remote to build the factory
    local ohTable1 = {cityFolder}
    local ohString2 = factoryType
    print("[DEBUG] Building factory with format:")
    print("[DEBUG] ohTable1:", ohTable1)
    print("[DEBUG] ohString2:", ohString2)
    createBuildingRemote:FireServer(ohTable1, ohString2)
    return true
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
-- Example: building in Tehran, Iran’s capital city
local iranCities = Workspace.Baseplate.Cities:FindFirstChild("Iran")
local tehran = iranCities and iranCities:FindFirstChild("Tehran")

if tehran then
    local success = buildFactory(tehran, "Motor Factory")
    if success then
        print("Motor Factory build command sent for Tehran.")
    else
        print("Failed to build factory in Tehran.")
    end
else
    print("Could not find Tehran city under Iran.")
end

return {
    buildFactory = buildFactory
}