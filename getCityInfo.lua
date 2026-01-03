----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Recursively scans a city folder and returns all info in a table
-- Input: cityFolder (Folder under workspace.Baseplate.Cities.[Country])
-- Output: nested table with all properties
local function getCityInfo(cityFolder)
    if not cityFolder then return nil end

    local function scanFolder(folder)
        local info = {}
        for _, child in pairs(folder:GetChildren()) do
            if child:IsA("Folder") then
                -- Recursively scan subfolders
                info[child.Name] = scanFolder(child)
            elseif child:IsA("NumberValue") or child:IsA("StringValue") or child:IsA("BoolValue") then
                info[child.Name] = child.Value
            else
                -- For unknown types, store their class name
                info[child.Name] = "<" .. child.ClassName .. ">"
            end
        end
        return info
    end

    return scanFolder(cityFolder)
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local pakistanCities = Workspace.Baseplate.Cities:FindFirstChild("Pakistan")
local bahawalpur = pakistanCities and pakistanCities:FindFirstChild("Bahawalpur")

if bahawalpur then
    local cityInfo = getCityInfo(bahawalpur)
    print("Bahawalpur city info:")
    print(game:GetService("HttpService"):JSONEncode(cityInfo))  -- Pretty JSON for inspection
else
    print("Could not find Bahawalpur city.")
end

return getCityInfo