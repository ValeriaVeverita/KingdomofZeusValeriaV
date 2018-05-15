-----------------------------------------------------------------------------------------
-- main.lua
-- Created by: Valeria Veverita
-- Date: May 10th, 2018
-- Description: This is the main menu, displaying the credits, instructions & play button

local composer = require( "composer" )

--give the name to the scene
sceneName = "main_menu"

--creating scene object 
local scene = composer.newScene(sceneName)

local widget = require ("widget")
  
--------------------------------------------------------------------------------------
--LOCAL VARIABLES
--------------------------------------------------------------------------------------
local menuBkg
local focusRect
local playButton
local creditsButton
local instructionsButton
local soundButtonOn
local soundButtonOff
local bkgSound
local bkgChannel
local title
local titleLight

-------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
------------------------------------------------------------------------------------
local function glowTitle()
  transition.to(titleLight, {alpha = 1, time = 900})
end

local function moveTitle( )
    transition.to(title, { y = 120, xScale = 1.7, yScale = 1.6, time = 1000})
    transition.to(titleLight, {  y = 120, xScale = 1.7, yScale = 1.8, time = 1000})
    transition.to(playButton, {alpha = 1, time = 1000})
    transition.to(creditsButton, {alpha = 1, time = 1000})
    transition.to(instructionsButton, {alpha = 1, time = 1000})
    transition.to(soundButtonOn, {alpha = 1, time = 1000})
end

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "CreditsScreen", {effect = "fade", time = 300}) 
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "fade", time = 300})
end    

-----------------------------------------------------------------------------------------

--creating Transition to Instructions Screen
local function InstructionsTransition()
  composer.gotoScene( "instructions_screen", {effect = "fade", time = 300})
end

------------------------------------------------------------------------------------------

--creating sound button function
local function soundOn()
   bkgChannel = audio.play(bkgSound)
   soundButtonOff.isVisible = false
   soundButtonOn.isVisible = true
end

--creating mute function
local function soundOff()
  audio.stop(bkgChannel)
  soundButtonOn.isVisible = false
  soundButtonOff.isVisible = true
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
   
   ----------------------------------------------------------------------------------------
   --CREATE OBJECTS
   -----------------------------------------------------------------------------------------
    
    --create the background image
    menuBkg = display.newImageRect ("MenuImages/MainMenuValeriaV.png", 0, 0, 0, 0)
    menuBkg.x = 500 
    menuBkg.y = 400
    menuBkg.width = display.contentWidth + 100
    menuBkg.height = display.contentHeight+50
    -- Associating display objects with this scene 
    sceneGroup:insert(menuBkg)

    --create the sound
    bkgSound = audio.loadStream("Sounds/mainS.mp3")

    --create the title brightness effect
    titleLight = display.newImage("MenuImages/TitleLight.png")
    titleLight.x = display.contentWidth/2+20
    titleLight.y = display.contentHeight/2+50
    titleLight:scale(1.8, 2)
    titleLight.alpha = 0
    -- Associating display objects with this scene
    sceneGroup:insert(titleLight)

    --create the title
    title = display.newImage("MenuImages/TitleValeriaV.png")
    title.x = display.contentWidth/2+10
    title. y = display.contentHeight/2+50
    title:scale(1.8, 1.7)
    -- Associating display objects with this scene
    sceneGroup:insert(title)
    
    --Creating Play Button
    playButton = widget.newButton(
      {
          --set its possition on the screen 
          x = display.contentWidth/2,
          y = display.contentHeight/2,

          --Insert the images here
          defaultFile = "ButtonImages/PlayButtonUnpressed.png",
          overFile = "ButtonImages/PlayButtonPressed.png",

          --set the size of the image
            width = 250,
            height = 150,

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition   

       })
    playButton.alpha = 0
    -- Associating display objects with this scene
    sceneGroup:insert(playButton)

    --Creating Credits Button
    creditsButton = widget.newButton(
      {
         --set its possition on the screen 
          x = display.contentWidth/2,
          y = display.contentHeight/2 + 150,

          --Insert the images here
          defaultFile = "ButtonImages/CreditsButtonUnpressed.png",
          overFile = "ButtonImages/CreditsButtonPressed.png",

          --set the size of the image
            width = 250,
            height = 150,

            -- When the button is released, call the Level1 screen transition function
            onRelease = CreditsTransition 


      })
    creditsButton.alpha = 0
    --Associating display objects with this scene
    sceneGroup:insert(creditsButton)

    --Creating Instructions Button
    instructionsButton = widget.newButton(
      {
        
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/2+300,

         --Insert the images
         defaultFile = "ButtonImages/InstructionsButtonUnpressed.png",
         overFile = "ButtonImages/InstructionsButtonPressed.png",

         --set the size of the image
         width = 250,
         height = 150,

         --When the button is released, call the Instructions screen transition function
         onRelease = InstructionsTransition
      })
    instructionsButton.alpha = 0
    --Associating display objects with this scene
    sceneGroup:insert(instructionsButton)

    --Creating Sounds Button
    soundButtonOn = widget.newButton(
     { 
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/3-20,

         --Insert the image
         defaultFile = "ButtonImages/SoundButton.png",

         --set the size of the image
         width = 110,
         height = 110,
         --when the button is released, call the soundOff function
         onRelease = soundOff

     })
    soundButtonOn.alpha = 0
    --Associating display objects with this scene
    sceneGroup:insert(soundButtonOn)

    --Creating Sounds Button
   soundButtonOff = widget.newButton(
     { 
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/3-20,

         --Insert the image
         defaultFile = "ButtonImages/MuteButton.png",

         --set the size of the image
         width = 110,
         height = 110,
         --when the button is released, call the soundOff function
         onRelease = soundOn

     })
    soundButtonOff.isVisible = false
    --Associating display objects with this scene
    sceneGroup:insert(soundButtonOff)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
         timer.performWithDelay(1000,  moveTitle)
         glowTitle()
         bkgChannel = audio.play(bkgSound)
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        audio.stop(bkgChannel)
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene