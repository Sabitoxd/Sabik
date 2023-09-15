local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

--окно
local Window = Library:CreateWindow({
    Title = 'Esp by sabik',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

--табы
local Tabs = {
    Main = Window:AddTab('Main'),
}

--бокс группа
local LeftGroupBox = Window.Tabs.Main:AddLeftGroupbox('Esp')
local MyButton = LeftGroupBox:AddButton({
    Text = 'Esp on',
    Func = function()
pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ShutUpRimuru/RobloxESP/main/ESP.lua'))() end)
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Speedhack on',
    Func = function()
getgenv().WalkSpeedValue = 80 --set your desired walkspeed her
game:service'Players'.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
end)
game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})

LeftGroupBox:AddSlider('MySlider', {
    Text = 'Speed Hack',
    Default = 16,
    Min = 16,
    Max = 1000,
    Rounding = 1,
    Compact = false,

    Callback = function(Value)
        getgenv().WalkSpeedValue = Value --set your desired walkspeed her
        game:service'Players'.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
        game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end)
        game:service'Players'.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Enable Inf spin',
    Func = function()
game:GetService("Players").LocalPlayer.startevent:FireServer("band", "\128") 
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Off inf spin ',
    Func = function()
game:GetService("Players").LocalPlayer.startevent:FireServer("band", "Eye") 
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
local MyButton = LeftGroupBox:AddButton({
    Text = 'Rejoin',
    Func = function()
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})
--UI Settings
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox('UI Settings')
--выклбчить гуи
LeftGroupBox2:AddButton('Unload', function() Library:Unload() end)
--бинд менюшки
LeftGroupBox2:AddLabel('Menu keybind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind
