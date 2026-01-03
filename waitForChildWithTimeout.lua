----------------------------
-- 1️⃣ Imports / Services
----------------------------
local RunService = game:GetService("RunService")

----------------------------
-- 2️⃣ Function / Helper
----------------------------
-- Safely waits for a child object to exist under a parent, with optional timeout
-- Input: parent (Instance), childName (string), timeout (seconds, optional, default 5)
-- Output: Instance if found, nil if timeout exceeded
local function waitForChildWithTimeout(parent, childName, timeout)
    timeout = timeout or 5
    local startTime = tick()
    local child = parent:FindFirstChild(childName)
    while not child and tick() - startTime < timeout do
        child = parent:FindFirstChild(childName)
        RunService.Heartbeat:Wait()  -- yield without freezing the game
    end
    return child
end

----------------------------
-- 3️⃣ Example Usage
----------------------------
local iranFolder = workspace.CountryData:FindFirstChild("Iran")
local economy = waitForChildWithTimeout(iranFolder, "Economy", 3)

if economy then
    print("Economy folder found!")
else
    print("Economy folder not found after timeout.")
end

return waitForChildWithTimeout