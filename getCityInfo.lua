----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns information about a specific city in the country
-- Input: countryFolder (Folder from workspace.CountryData), cityName (string)
-- Output: nested table with all properties
local function getCityInfo(countryFolder, cityName)
    if not countryFolder or not cityName then return nil end

    local countryName = countryFolder.Name
    local countryCities = Workspace.Baseplate:FindFirstChild("Cities")
    if not countryCities then return nil end

    local cityFolder = countryCities:FindFirstChild(countryName)
    if not cityFolder then return nil end

    local targetCity = cityFolder:FindFirstChild(cityName)
    if not targetCity then return nil end

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

    return scanFolder(targetCity)
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local pakistanFolder = Workspace.CountryData:FindFirstChild("Pakistan")
local cityInfo = getCityInfo(pakistanFolder, "Bahawalpur")

if cityInfo then
    print("Bahawalpur city info:")
    print(game:GetService("HttpService"):JSONEncode(cityInfo))  -- Pretty JSON for inspection
else
    print("Could not find Bahawalpur city.")
end

return {
    getCityInfo = getCityInfo
}