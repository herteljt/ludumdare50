-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect( "platform.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local balloon = display.newImageRect("balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
