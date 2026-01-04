----------------------------
-- 1️⃣ Imports / Services
----------------------------
local Workspace = workspace

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Returns a table of all city folders for a given country
-- Input: countryFolder (Folder from workspace.CountryData)
-- Output: table of city folders
local function getAllCities(countryFolder)
    if not countryFolder then return nil end

    local countryName = countryFolder.Name
    local countryCities = Workspace.Baseplate:FindFirstChild("Cities")
    if not countryCities then return nil end

    local cityFolder = countryCities:FindFirstChild(countryName)
    if not cityFolder then return nil end

    local cityList = {}
    for _, city in pairs(cityFolder:GetChildren()) do
        table.insert(cityList, city)
    end

    return cityList
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local pakistanFolder = workspace.CountryData:FindFirstChild("Pakistan")
local cities = getAllCities(pakistanFolder)

if cities then
    print("Pakistan has", #cities, "cities:")
    for _, city in pairs(cities) do
        print("-", city.Name)
    end
else
    print("No cities found for this country.")
end

return {
    getAllCities = getAllCities
}