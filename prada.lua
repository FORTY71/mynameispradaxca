-- ==========================================
-- FORSAKEN PLUS - PINK CLEAN EDITION
-- ==========================================

if workspace.DistributedGameTime < 3 then
	task.wait(3 - workspace.DistributedGameTime)
end

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("ForsakenPinkUI") then
    return warn("Script is already running!")
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character
local LocalHumanoid, LocalHead, LocalRoot, SpeedMultipliers
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local PlayerData = LocalPlayer:FindFirstChild("PlayerData") or Instance.new("Folder", LocalPlayer)
if PlayerData.Name ~= "PlayerData" then PlayerData.Name = "PlayerData" end

local PlusFolderSettings = Instance.new("Folder")
PlusFolderSettings.Name = "Plus"
PlusFolderSettings.Parent = PlayerData

-- Services & Variables
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local Network = ReplicatedStorage:FindFirstChild("Modules") and (ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true) and ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true):FindFirstChild("Network")) or ReplicatedStorage:FindFirstChild("Modules"):FindFirstChild("Network",true) or nil

local InGame = workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Ingame")
local GameMap = InGame and InGame:FindFirstChild("Map") or nil
local IsUnderground, IsFixingGenerator = false, false
local OverriddenAnimations, AllAnimations = {}, {}
local ColorPresets = {["White"] = Color3.fromRGB(255,255,255),["Teal"] = Color3.fromRGB(3,252,157),["Green"] = Color3.fromRGB(0,255,0),["Purple"] = Color3.fromRGB(128,0,128),["Red"] = Color3.fromRGB(255,0,0),["Blue"] = Color3.fromRGB(0,0,255),["Cyan"] = Color3.fromRGB(0,255,255),["Gold"] = Color3.fromRGB(255,215,0),["Orange"] = Color3.fromRGB(255,165,0)}

-- Dummy Data System for File Saving Bypasses
local fakeFiles = {}
local function isfile(path) return fakeFiles[path] ~= nil end
local function readfile(path) return fakeFiles[path] or "{}" end
local function writefile(path, content) fakeFiles[path] = content end
local function isfolder(path) return true end
local function makefolder(path) end

-- Utilities
local function GetValue(FeatureName)
    local res = PlusFolderSettings:FindFirstChild(FeatureName, true)
    return res and res.Value or nil
end

local function GetFunction(...)
    for i,v in table.pack(...) do if v and typeof(v) == "function" then return v end end
    return nil
end

-- ==========================================
-- FEATURE LOADOUT DATABASE
-- ==========================================
local FeatureLoadout = {
    ["Automation"] = {
        ["AutoGeneratorPuzzle"] = {["DisplayTitle"] = "Auto Generator", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["AutoPickup"] = {["DisplayTitle"] = "Auto Pickup Items", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
    },
    ["Features"] = {
        ["Invincible"] = {["DisplayTitle"] = "Invincible (God Mode)", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) 
            if workspace:GetAttribute("Invincible") == nil then
                workspace:SetAttribute("Invincible", val)
                if val then
                    local t1 = PlusFolderSettings:FindFirstChild("DisableToxicTrails", true)
                    local t2 = PlusFolderSettings:FindFirstChild("DisableFootprints", true)
                    if t1 then t1.Value = true end
                    if t2 then t2.Value = true end
                end
                task.delay(1.5, function() workspace:SetAttribute("Invincible",nil) end)
            end
        end},
        ["DisableKillerWalls"] = {["DisplayTitle"] = "Disable Killer Walls", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["DisableToxicTrails"] = {["DisplayTitle"] = "Disable Toxic Trails", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["DisableFootprints"] = {["DisplayTitle"] = "Disable Footprints", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["SmallerSpikeCollisions"] = {["DisplayTitle"] = "Smaller Spikes", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["AntiSlowness"] = {["DisplayTitle"] = "Anti Slowness", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["NoliControl"] = {["DisplayTitle"] = "Better Void Rush", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["ControllableDash"] = {["DisplayTitle"] = "Controllable Dash", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end}
    },
    ["Visuals"] = {
        ["ESP"] = {["DisplayTitle"] = "Master ESP", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["KillersESP"] = {["DisplayTitle"] = "Killers ESP", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["SurvivorsESP"] = {["DisplayTitle"] = "Survivors ESP", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["GeneratorsESP"] = {["DisplayTitle"] = "Generators ESP", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["ItemsESP"] = {["DisplayTitle"] = "Items ESP", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["DisableNoliNPC"] = {["DisplayTitle"] = "Disable Noli NPC", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["Disable007n7NPC"] = {["DisplayTitle"] = "Disable 007n7 NPC", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
    },
    ["Misc"] = {
        ["ShowChat"] = {["DisplayTitle"] = "Show Chat in Round", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) 
            if TextChatService:FindFirstChildOfClass("ChatWindowConfiguration") then TextChatService.ChatWindowConfiguration.Enabled = val end
        end},
        ["ShowPrivacy"] = {["DisplayTitle"] = "Show Privacy Info", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
        ["HideInjury"] = {["DisplayTitle"] = "Hide Injury UI", ["InstanceType"] = "BoolValue", ["Default"] = true, ["Func"] = function(val) 
            for i,v in PlayerGui:FindFirstChild("TemporaryUI") and PlayerGui.TemporaryUI:QueryDescendants("#redFlash,#injuredVignette") or {} do v.Visible = not val end
        end},
        ["DeleteRagdolls"] = {["DisplayTitle"] = "Delete Ragdolls", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) 
            if workspace:FindFirstChild("Ragdolls") and val then workspace.Ragdolls:ClearAllChildren() end
        end},
        ["SkyGlitch"] = {["DisplayTitle"] = "Sky Glitch (Host)", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) 
            if val and Network then Network:WaitForChild("RemoteEvent"):FireServer("ExecuteCommand", {"GiveStatus", "All", "Nausea", -1e11, 10}) end
        end},
        ["InstaKill"] = {["DisplayTitle"] = "Instant Kill (Host)", ["InstanceType"] = "BoolValue", ["Default"] = false, ["Func"] = function(val) end},
    }
}

-- Create Database Values
for category, features in pairs(FeatureLoadout) do
    local folder = Instance.new("Folder", PlusFolderSettings)
    folder.Name = category
    for name, data in pairs(features) do
        local val = Instance.new(data.InstanceType)
        val.Name = name
        val.Value = data.Default
        val.Parent = folder
        val.Changed:Connect(function() data.Func(val.Value) end)
    end
end

-- ==========================================
-- NEW CUSTOM PINK UI (CLEAN & SAFE)
-- ==========================================
local SG = Instance.new("ScreenGui")
SG.Name = "ForsakenPinkUI"
SG.ResetOnSpawn = false
local success = pcall(function() SG.Parent = CoreGui end)
if not success then SG.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Open/Close Button
local ToggleBtn = Instance.new("TextButton", SG)
ToggleBtn.Size = UDim2.new(0, 100, 0, 35)
ToggleBtn.Position = UDim2.new(0, 15, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- Hot Pink
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 14
ToggleBtn.Text = "OPEN MENU"
local UICornerBtn = Instance.new("UICorner", ToggleBtn)
UICornerBtn.CornerRadius = UDim.new(0, 6)

-- Main Frame
local MainFrame = Instance.new("Frame", SG)
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
local UICornerMain = Instance.new("UICorner", MainFrame)

local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- Hot Pink
local UICornerTitle = Instance.new("UICorner", TitleBar)
local FixSquare = Instance.new("Frame", TitleBar) -- Fix bottom corners of title bar
FixSquare.Size = UDim2.new(1, 0, 0.5, 0)
FixSquare.Position = UDim2.new(0, 0, 0.5, 0)
FixSquare.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
FixSquare.BorderSizePixel = 0

local TitleText = Instance.new("TextLabel", TitleBar)
TitleText.Size = UDim2.new(1, -15, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Forsaken Plus - Pink Edition"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Tab System
local TabContainer = Instance.new("Frame", MainFrame)
TabContainer.Size = UDim2.new(0, 120, 1, -40)
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.BorderSizePixel = 0

local TabListLayout = Instance.new("UIListLayout", TabContainer)
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local ContentContainer = Instance.new("Frame", MainFrame)
ContentContainer.Size = UDim2.new(1, -120, 1, -40)
ContentContainer.Position = UDim2.new(0, 120, 0, 40)
ContentContainer.BackgroundTransparency = 1

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "CLOSE MENU" or "OPEN MENU"
end)

local currentTab = nil
local function CreateTab(tabName)
    local TabBtn = Instance.new("TextButton", TabContainer)
    TabBtn.Size = UDim2.new(1, 0, 0, 35)
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabBtn.BorderSizePixel = 0
    TabBtn.Text = tabName
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 14

    local Scroll = Instance.new("ScrollingFrame", ContentContainer)
    Scroll.Size = UDim2.new(1, 0, 1, 0)
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.ScrollBarThickness = 4
    Scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 105, 180)
    Scroll.Visible = false
    
    local ScrollLayout = Instance.new("UIListLayout", Scroll)
    ScrollLayout.Padding = UDim.new(0, 5)
    ScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local Padding = Instance.new("UIPadding", Scroll)
    Padding.PaddingTop = UDim.new(0, 10)
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, child in pairs(ContentContainer:GetChildren()) do if child:IsA("ScrollingFrame") then child.Visible = false end end
        for _, child in pairs(TabContainer:GetChildren()) do if child:IsA("TextButton") then child.TextColor3 = Color3.fromRGB(200,200,200) child.BackgroundColor3 = Color3.fromRGB(35, 35, 35) end end
        Scroll.Visible = true
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    end)
    
    if currentTab == nil then
        Scroll.Visible = true
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        currentTab = tabName
    end

    return Scroll
end

local function CreateToggle(parentScroll, titleText, valueInstance)
    local ToggleFrame = Instance.new("Frame", parentScroll)
    ToggleFrame.Size = UDim2.new(0.95, 0, 0, 35)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    local UICorner = Instance.new("UICorner", ToggleFrame)
    UICorner.CornerRadius = UDim.new(0, 4)

    local Title = Instance.new("TextLabel", ToggleFrame)
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Color3.fromRGB(230, 230, 230)
    Title.Font = Enum.Font.Gotham
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Btn = Instance.new("TextButton", ToggleFrame)
    Btn.Size = UDim2.new(0, 50, 0, 20)
    Btn.Position = UDim2.new(1, -60, 0.5, -10)
    Btn.Text = valueInstance.Value and "ON" or "OFF"
    Btn.BackgroundColor3 = valueInstance.Value and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(70, 70, 70)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    local UICornerBtn = Instance.new("UICorner", Btn)
    UICornerBtn.CornerRadius = UDim.new(0, 4)

    Btn.MouseButton1Click:Connect(function()
        valueInstance.Value = not valueInstance.Value
        Btn.Text = valueInstance.Value and "ON" or "OFF"
        Btn.BackgroundColor3 = valueInstance.Value and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(70, 70, 70)
    end)
    
    -- Auto adjust scroll canvas size
    parentScroll.CanvasSize = UDim2.new(0, 0, 0, parentScroll.UIListLayout.AbsoluteContentSize.Y + 20)
end

-- Populate UI based on Database
for category, features in pairs(FeatureLoadout) do
    local scroll = CreateTab(category)
    for name, data in pairs(features) do
        local valueInstance = PlusFolderSettings:FindFirstChild(category):FindFirstChild(name)
        if valueInstance and valueInstance:IsA("BoolValue") then
            CreateToggle(scroll, data.DisplayTitle, valueInstance)
        end
    end
end

-- ==========================================
-- EXPLOIT LOGIC & BACKEND LOOPS
-- ==========================================

local ThreadManager = {Threads = {}}
function ThreadManager:Start(Name,Function,Interval)
    if ThreadManager.Threads[Name] then return end
    ThreadManager.Threads[Name] = task.spawn(function()
        while true do
            Function()
            task.wait(Interval)
        end
    end)
end

local function CreateDynamicHighlight(Enabled,ItemInstance,TargetRoot,Settings)
    Settings = type(Settings) == "table" and Settings or {["MaxDistance"] = 100,["MinDistance"] = 10,["Color"] = Color3.new(1,1,1)}
    local Highlight = ItemInstance:QueryDescendants("Highlight[$Dynamic]")
    if Enabled and GetValue("ESP") then
        if not Highlight[1] then
            Highlight = Instance.new("Highlight")
            Highlight.Name = HttpService:GenerateGUID(false)
            local H, S, V = Settings.Color:ToHSV()
            Highlight.FillColor = Color3.fromHSV(H, S, V * 0.8)
            Highlight.OutlineColor = Color3.fromHSV(H, S, V * 1.1)
            Highlight:SetAttribute("Dynamic",true)
            Highlight.Parent = ItemInstance
            Highlight.Adornee = ItemInstance
            Highlight.FillTransparency = 0.5
            Highlight.OutlineTransparency = 0
        else
            Highlight = Highlight[1]
            Highlight.FillTransparency = 0.5
        end
    elseif Highlight[1] then
        Highlight[1]:Destroy()
    end
end

local function ActionOnCharacter(Character)
    task.spawn(function()
        LocalCharacter = Character
        LocalHumanoid = LocalCharacter and (LocalCharacter:FindFirstChildOfClass("Humanoid") or LocalCharacter:WaitForChild("Humanoid",2)) or nil
        LocalHead = LocalCharacter and (LocalCharacter:FindFirstChild("Head") or LocalCharacter:WaitForChild("Head",2)) or nil
        LocalRoot = LocalCharacter and ((LocalHumanoid and LocalHumanoid.RootPart) or LocalCharacter:FindFirstChild("HumanoidRootPart") or LocalCharacter:WaitForChild("HumanoidRootPart",2)) or nil
        SpeedMultipliers = LocalCharacter and (Character:FindFirstChild("SpeedMultipliers") or Character:WaitForChild("SpeedMultipliers", 5)) or nil
        
        if SpeedMultipliers ~= nil and typeof(SpeedMultipliers) == "Instance" then
            SpeedMultipliers.ChildAdded:Connect(function(Child)
                if GetValue("AntiSlowness") then
                    if Child.Name == "DirectionalMovement" or Child.Name == "FixingGenerator" then
                        if Child.Value < 1 then Child.Value = 1 end
                    elseif Child.Value > 0.05 and Child.Value < 1 then
                        Child:Destroy()
                    end
                end
            end)
        end
        
        LocalRoot.ChildAdded:Connect(function(Child)
            if Child:IsA("LinearVelocity") and LocalHumanoid then
                local OriginalVelocityMag = Child.LineDirection.Magnitude
                if GetValue("ControllableDash") then
                    Child.LineDirection = LocalHumanoid.MoveDirection * OriginalVelocityMag
                end
                LocalHumanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
                    if GetValue("ControllableDash") then
                        Child.LineDirection = LocalHumanoid.MoveDirection * OriginalVelocityMag
                    end
                end)
            end
        end)
    end)
end

LocalPlayer.CharacterAdded:Connect(ActionOnCharacter)
if LocalCharacter then ActionOnCharacter(LocalCharacter) end

ThreadManager:Start("FeatureHandler", function()
    -- Auto Generator
    if LocalRoot and not IsFixingGenerator and GetValue("AutoGeneratorPuzzle") and GameMap then
        for i,Object in GameMap:QueryDescendants("Model#Generator:has(#Main)") do
            if LocalRoot and LocalRoot.Anchored ~= true and (Object:FindFirstChild("Main").Position - LocalRoot.Position).Magnitude < 6.7 then
                task.spawn(function()
                    IsFixingGenerator = true
                    local Remotes = Object:FindFirstChild("Remotes")
                    local Progress = Object:FindFirstChild("Progress")
                    local RemoteEvent = Remotes and Remotes:FindFirstChildOfClass("RemoteEvent")
                    if RemoteEvent and Progress and Progress.Value < 100 then
                        while Progress.Value < 100 do
                            if not IsFixingGenerator or not GetValue("AutoGeneratorPuzzle") then break end
                            task.wait(1.5)
                            RemoteEvent:FireServer()
                        end
                    end
                    IsFixingGenerator = false
                end)
                break
            end
        end
    end

    -- ESP & Auto Pickup Loop
    if InGame and GameMap then
        task.spawn(function()
            local Tools = InGame:QueryDescendants("#Map > Tool")
            for i,v in pairs(Tools) do
                CreateDynamicHighlight(GetValue("ItemsESP"), v, v:FindFirstChildWhichIsA("BasePart"), {["Color"] = ColorPresets["Gold"]})
                if GetValue("AutoPickup") and not LocalCharacter:FindFirstChild(v.Name) then
                    local ProximityPrompt = v:FindFirstChildWhichIsA("ProximityPrompt",true)
                    local Param = OverlapParams.new()
                    Param.FilterType = Enum.RaycastFilterType.Include
                    Param.FilterDescendantsInstances = {v}
                    local Result = workspace:GetPartBoundsInRadius(LocalRoot.Position, 4.5, Param)
                    if LocalRoot and #Result > 0 and ProximityPrompt then
                        fireproximityprompt(ProximityPrompt)
                    end
                end
            end
        end)
        for i,v in GameMap:QueryDescendants("Model#Generator:has(#Main)") do
            local prog = v:FindFirstChild("Progress")
            if prog and prog.Value >= 100 then
                CreateDynamicHighlight(false, v)
            elseif prog then
                CreateDynamicHighlight(GetValue("GeneratorsESP"), v, v:FindFirstChild("Main"), {["Color"] = ColorPresets["Cyan"]})
            end
        end
    end
    for i,v in workspace.Players:QueryDescendants("#Killers > Instance,#Survivors > Instance") do
        if v ~= LocalPlayer.Character and Players:GetPlayerFromCharacter(v) ~= nil then
            local ESPVal = v.Parent.Name == "Killers" and GetValue("KillersESP") or GetValue("SurvivorsESP")
            local Col = v.Parent.Name == "Killers" and ColorPresets["Red"] or ColorPresets["Green"]
            CreateDynamicHighlight(ESPVal, v, v:FindFirstChild("HumanoidRootPart"), {["Color"] = Col})
        else
            CreateDynamicHighlight(false, v)
        end
    end
end, 0.1)

-- Map Environment Disables
InGame.ChildAdded:Connect(function(Child)
    if Child:IsA("Folder") and (Child.Name):find("JohnDoeTrail") then
        task.wait()
        for i,v in Child:GetChildren() do if v:IsA("BasePart") then v.CanTouch = not GetValue("DisableToxicTrails") end end
    elseif Child:IsA("Folder") and (Child.Name):find("Shadows") then
        task.wait()
        for i,v in Child:GetChildren() do if v:IsA("BasePart") then v.CanTouch = not GetValue("DisableFootprints") end end
        Child.ChildAdded:Connect(function(GrandChild)
            if GrandChild:IsA("BasePart") then GrandChild.CanTouch = not GetValue("DisableFootprints") end
        end)
    elseif Child.Name == "SpikeCollision" then
        if GetValue("SmallerSpikeCollisions") then
            Child.Size = Vector3.new(10,3.25,3.25)
            Child.Shape = Enum.PartType.Cylinder
        end
    end
end)