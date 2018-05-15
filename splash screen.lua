local composer = require( "composer" )

--give the name to the scene
sceneName = "splash_screen"

--creating scene object 
local scene = composer.newScene(sceneName)


--------------------------------------------------------------------------------------
--LOCAL VARIABLES
--------------------------------------------------------------------------------------
--local variables for this scene
--company logo
local bkg
local companyLogo
local companyFire
local companyFire2
local companyFire3
local companyFire4
local companyFire5
local companyFire6
local companyFire7
local companyFire8
local companyFire9

--copany name
local name1


--sound variables
local bkgSound
local bkgChannel
local titleSound
local titleChannel

--letters
local vLetter
local gLetter
--------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
--------------------------------------------------------------------------------------

local function setFire( )
    bkgChannel = audio.play(bkgSound)
   transition.to(gLetter, {alpha = 0, time = 1200})
   transition.to(vLetter, {alpha = 0, time = 1200})
   transition.to(companyFire2, {alpha = 1, time = 1300})
   transition.to(companyFire3,{alpha = 1, time = 1700})
   transition.to(companyFire2, {alpha = 0, time = 1700})
   transition.to(companyFire4, {alpha = 1, time = 1800})
   transition.to(companyFire3, {alpha = 0, time = 1800})
   transition.to(companyFire5, {alpha = 1, time = 1900})
   transition.to(companyFire4, {alpha = 0, time = 1900})
   transition.to(companyFire6, {alpha = 1, time = 1950})
   transition.to(companyFire5, {alpha = 0, time = 1950})
   transition.to(companyFire7, {alpha = 1, time = 2000})
   transition.to(companyFire6, {alpha = 0, time = 2000})
   transition.to(companyFire8, {alpha = 1, time = 2050})
   transition.to(companyFire7, {alpha = 0, time = 2050})
   transition.to(companyFire9, {alpha = 1, time = 2100})
   transition.to(companyFire8, {alpha = 0, time = 2100})
  
end

local function burnName( )
    transition.to(name1, {alpha = 1, time = 2000})
end

local function titlePlay( )
    titleChannel = audio.play(titleSound)
end

local function screenTransition( )
    composer.gotoScene("main_menu", {effect = "fade"})
end

local function moveLetters()
    transition.to(gLetter, {time = 1500, x = 400, y = 380})
    transition.to(vLetter, {time = 1500, x = 600, y = 400})
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --create the background of the scene
    bkg = display.newImageRect("Images/background.png", display.contentWidth, display.contentHeight+30)
    --set the position
    bkg.x = 510
    bkg.y = 390
    --associating displayed objects to these scene
    sceneGroup:insert(bkg)
    --set the background image to back
    bkg:toBack()

    --create the sound
    --background sound
    bkgSound = audio.loadStream("Sounds/fire.mp3")
    --title sound
    titleSound = audio.loadStream("Sounds/title.mp3")


    --------------------------------------------------------------------------------------------
    --OBJECT CREATION
    --------------------------------------------------------------------------------------------

    --create the first layer of the fire image
    companyFire2 = display.newImage("Images/fireText2.png")
    --set the position, the size and visibility
    companyFire2.x = display.contentWidth/2
    companyFire2.y = display.contentHeight/2-40
    companyFire2.width = 900
    companyFire2.height = 580
    companyFire2.alpha = 0
    sceneGroup:insert(companyFire2)

    --create the first layer of the fire image
    companyFire3 = display.newImage("Images/fireText3.png")
    --set the position, the size and visibility
    companyFire2.x = display.contentWidth/2
    companyFire3.y = display.contentHeight/2-40
    companyFire3.width = 900
    companyFire3.height = 580
    companyFire3.alpha = 0
    sceneGroup:insert(companyFire3)

    --create the first layer of the fire image
    companyFire4 = display.newImage("Images/fireText4.png")
    --set the position, the size and visibility
    companyFire4.x = display.contentWidth/2
    companyFire4.y = display.contentHeight/2-40
    companyFire4.width = 900
    companyFire4.height = 580
    companyFire4.alpha = 0
    sceneGroup:insert(companyFire4)

    --create the first layer of the fire image
    companyFire5 = display.newImage("Images/fireText5.png")
    --set the position, the size and visibility
    companyFire5.x = display.contentWidth/2
    companyFire5.y = display.contentHeight/2-40
    companyFire5.width = 900
    companyFire5.height = 580
    companyFire5.alpha = 0
    sceneGroup:insert(companyFire5)

    --create the first layer of the fire image
    companyFire6 = display.newImage("Images/fireText6.png")
    --set the position, the size and visibility
    companyFire6.x = display.contentWidth/2
    companyFire6.y = display.contentHeight/2-40
    companyFire6.width = 900
    companyFire6.height = 580
    companyFire6.alpha = 0
    sceneGroup:insert(companyFire6)

    --create the first layer of the fire image
    companyFire7 = display.newImage("Images/fireText7.png")
    --set the position, the size and visibility
    companyFire7.x = display.contentWidth/2
    companyFire7.y = display.contentHeight/2-40
    companyFire7.width = 900
    companyFire7.height = 580
    companyFire7.alpha = 0
    sceneGroup:insert(companyFire7)

    --create the first layer of the fire image
    companyFire8 = display.newImage("Images/fireText8.png")
    --set the position, the size and visibility
    companyFire8.x = display.contentWidth/2
    companyFire8.y = display.contentHeight/2-40
    companyFire8.width = 900
    companyFire8.height = 580
    companyFire8.alpha = 0
    sceneGroup:insert(companyFire8)

    --create the first layer of the fire image
    companyFire9 = display.newImage("Images/fireText9.png")
    --set the position, the size and visibility
    companyFire9.x = display.contentWidth/2
    companyFire9.y = display.contentHeight/2-40
    companyFire9.width = 900
    companyFire9.height = 580
    companyFire9.alpha = 0
    sceneGroup:insert(companyFire9)

    -- CREATE THE NAME OF THE COMPANY
    --create the first layer
   

    --create the nineth layer
    name1 = display.newImage("Images/GameVille9.png")
    --set the position, size and visibility
    name1.x = display.contentWidth/2-40
    name1.y = 700
    name1.width = 500
    name1.height = 100
    name1.alpha = 0
    sceneGroup:insert(name1)

    ------------------------------------------------------------------------------
    --CREATE THE LETTERS
    ------------------------------------------------------------------------------

    vLetter = display.newImage("Images/V letter.png")
    --set the possition, size and visibility
    vLetter.x = 900
    vLetter.y = 900
    vLetter.width = 500
    vLetter.height = 350
    sceneGroup:insert(vLetter)


    gLetter = display.newImage("Images/G letter.png")
    --set the possition, size and visibility
    gLetter.x = -200
    gLetter.y = -200
    gLetter.width = 500
    gLetter.height = 400
    sceneGroup:insert(gLetter)

 
    ----------------------------------------------------------------------------------------------------
    --CALL THE FUNCTIONS
    ----------------------------------------------------------------------------------------------------

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        timer.performWithDelay(0,  moveLetters)
        timer.performWithDelay(1500, setFire)
        timer.performWithDelay(1500, burnName)
        timer.performWithDelay(3000, titlePlay)
        timer.performWithDelay(5000, screenTransition)
 
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