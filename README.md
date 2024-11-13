Paste the following into your executor:

local scriptURL = 'https://raw.githubusercontent.com/rasecde/Basketball-Legends-Script/refs/heads/main/CustomBasketballScript.lua'
local response = game:HttpGet(scriptURL)
local executeScript = loadstring(response)
executeScript()
