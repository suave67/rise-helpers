----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Executes a single economic action safely
-- Input: action table with keys:
--   type: "buildFactory" | "sellResource" | etc.
--   params: table containing necessary parameters for that action
local function executeAction(action)
    if not action or type(action) ~= "table" then return false end
    local actionType = action.type
    local params = action.params or {}

    if actionType == "buildFactory" then
        local city = params.cityFolder
        local factoryType = params.factoryType
        if city and factoryType then
            local remote = Workspace.GameManager:FindFirstChild("CreateBuilding")
            if remote then
                remote:FireServer({city}, factoryType)
                return true
            end
        end

    elseif actionType == "sellResource" then
        local manageAlliance = Workspace.GameManager:FindFirstChild("ManageAlliance")
        local countryName = params.countryName
        local resourceName = params.resourceName
        local amount = params.amount
        if manageAlliance and countryName and resourceName and amount then
            local data = {resourceName, "Sell", amount, 1, "Trade"}
            manageAlliance:FireServer(countryName, "ResourceTrade", data)
            return true
        end
    end

    warn("Unknown or invalid action:", actionType)
    return false
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local iranFolder = workspace.CountryData:FindFirstChild("Iran")
local iranCities = workspace.Baseplate.Cities:FindFirstChild("Iran")
local tehran = iranCities and iranCities:FindFirstChild("Tehran")

-- Example: Build Motor Factory in Tehran
local buildAction = {
    type = "buildFactory",
    params = {
        cityFolder = tehran,
        factoryType = "Motor Factory"
    }
}

local success = executeAction(buildAction)
if success then
    print("Motor Factory build action executed for Tehran.")
else
    print("Failed to execute build action.")
end

return executeAction