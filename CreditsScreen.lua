local composer = require( "composer" )

local widget = require("widget")

--give the name to the scene
sceneName = "CreditsScreen"

--creating scene object 
local scene = composer.newScene(sceneName)
  
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
 --------------------------------------------------------------------------------
 --LOCAL VARIABLES
 ----------------------------------------------------------------------------
 local bkg
 local backButton
 local bkgSound
 local bkgChannel
 -------------------------------------------------------------------------------------
 --LOCAL FUNCTIONS
 -----------------------------------------------------------------------------
 local function menuTransition()
    composer.gotoScene("main_menu", {effect = "fade", time = 300})
 end
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --create the background image
   bkg = display.newImageRect("CreditsImages/CreditsValeriaV.png", 0, 0, 0, 0)
   bkg.x = 510
   bkg.y = 385
   bkg.width = display.contentWidth
   bkg.height = display.contentHeight
   -- --Associating display objects with this scene
   sceneGroup:insert(bkg)
    
   --create the sound
    bkgSound = audio.loadStream("Sounds/mainS.mp3")

   --create the back button
   backButton = widget.newButton(
     { 
     --load the image files
     defaultFile = "ButtonImages/BackButtonUnpressed.png",
       overFile = "ButtonImages/BackButtonPressed.png",
     --set the possition
     x = 120,
     y = 100,
     --set the size
     width = 200,
     height = 200,
     -- when the button is pressed call the function go to main scene
     onRelease = menuTransition
      })
     sceneGroup:insert(backButton)



   
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
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