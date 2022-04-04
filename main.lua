require "./data"
require "./dialogue"


-- initialized at game launch
function love.load()
  print("Loading game...")
  waiting = true
  waitingTimer = 10



  -- world data
  worldData.grid.width = 16
  worldData.grid.height = 9
  worldData.grid.border = 0


-- background
  assets.images.background = love.graphics.newImage("graphics/background.png")
  assets.images.backgroundNumbers = love.graphics.newImage("graphics/backgroundNumberGrid.png")
  assets.images.backgroundOverlay = love.graphics.newImage("graphics/backgroundOverlay.png")
  assets.images.backgroundSplashScreen = love.graphics.newImage("graphics/backgroundSplashScreen.png")
  assets.images.backgroundCredits = love.graphics.newImage("graphics/backgroundCredits.png")

--narrator
  assets.images.narrator = love.graphics.newImage("graphics/narrator.png")
--fight
  assets.images.fight = love.graphics.newImage("graphics/fight.png")

  assets.images.characterBlank = love.graphics.newImage("graphics/characterBlank.png")

-- knight
  assets.images.knightNeutral = love.graphics.newImage("graphics/knightNeutral.png")
  assets.images.knightHappy = love.graphics.newImage("graphics/knightHappy.png")
  assets.images.knightScared = love.graphics.newImage("graphics/knightScared.png")
  assets.images.knightFail = love.graphics.newImage("graphics/knightFail.png")
  assets.images.knightAnnoyed = love.graphics.newImage("graphics/knightAnnoyed.png")

-- cat
  assets.images.catNeutral = love.graphics.newImage("graphics/catNeutral.png")
  assets.images.catHappy = love.graphics.newImage("graphics/catHappy.png")
  assets.images.catScared = love.graphics.newImage("graphics/catScared.png")
  assets.images.catAnnoyed = love.graphics.newImage("graphics/catAnnoyed.png")
  assets.images.catNeutralMew = love.graphics.newImage("graphics/catNeutralMew.png")
  assets.images.catNeutral = love.graphics.newImage("graphics/catNeutral.png")
  assets.images.catMrowDisappointed = love.graphics.newImage("graphics/catMrowDisappointed.png")
  assets.images.catHiss = love.graphics.newImage("graphics/catHiss.png")
  assets.images.catSleep = love.graphics.newImage("graphics/catSleep.png")
  assets.images.catHairball = love.graphics.newImage("graphics/catHairball.png")



--items
-- cat
  itemData.itemZero.image = love.graphics.newImage("graphics/itemPotato.png")
  itemData.itemOne.image= love.graphics.newImage("graphics/itemShark.png")
  itemData.itemTwo.image = love.graphics.newImage("graphics/itemPudding.png")
  itemData.itemThree.image = love.graphics.newImage("graphics/itemNeedle.png")
  itemData.itemFour.image = love.graphics.newImage("graphics/itemFish.png")
  itemData.itemFive.image = love.graphics.newImage("graphics/itemHorseshoe.png")
  itemData.itemSix.image = love.graphics.newImage("graphics/itemPerfume.png")
  itemData.itemSeven.image = love.graphics.newImage("graphics/itemBottle.png")
  itemData.itemEight.image = love.graphics.newImage("graphics/itemRope.png")
  itemData.itemNine.image = love.graphics.newImage("graphics/itemDracula.png")
  itemData.itemTen.image = love.graphics.newImage("graphics/itemKey.png")

  --end credits
    assets.images.backgroundEnding = love.graphics.newImage("graphics/backgroundEnding.png")


  -- fonts
  assets.fonts.regular = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 28, "none")
  assets.fonts.header = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 24, "none")
  assets.fonts.dialogue = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 22, "none")
  assets.fonts.ending = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 56, "none")


  -- sounds
  assets.musicBackground.file = love.audio.newSource("/sounds/LDJ_catinthebag_theme.mp3", "static")
  assets.musicScenarioOne.file = love.audio.newSource("/sounds/LDJ_catinthebag_fanfare.mp3", "static")
  assets.musicScenarioTwo.file = love.audio.newSource("/sounds/LDJ_catinthebag_fanfare.mp3", "static")
  assets.musicScenarioThree.file = love.audio.newSource("/sounds/LDJ_catinthebag_fanfare.mp3", "static")

  assets.musicBackground.state = assets.musicBackground.file
  assets.musicBackground.volume = .08
  assets.musicBackground.state:setLooping(true)
  assets.musicBackground.state:setVolume(assets.musicBackground.volume)
  assets.musicBackground.state:play()

  assets.musicScenarioOne.state = assets.musicScenarioOne.file
  assets.musicScenarioOne.volume = 0
  assets.musicScenarioOne.state:setLooping(true)
  assets.musicScenarioOne.state:setVolume(assets.musicScenarioOne.volume)
  assets.musicScenarioOne.state:play()

  assets.musicScenarioTwo.state = assets.musicScenarioTwo.file
  assets.musicScenarioTwo.volume = 0
  assets.musicScenarioTwo.state:setLooping(true)
  assets.musicScenarioTwo.state:setVolume(assets.musicScenarioTwo.volume)
  --assets.musicScenarioTwo.state:play()

  assets.musicScenarioThree.state = assets.musicScenarioThree.file
  assets.musicScenarioThree.volume = 0
  assets.musicScenarioThree.state:setLooping(true)
  assets.musicScenarioThree.state:setVolume(assets.musicScenarioThree.volume)
  --assets.musicScenarioThree.state:play()



  print("Game loaded! Let's go.")

-- Comment out to test scenarios

-- Scenario Debugging
--worldData.scenarioSelected = 3
-- worldData.state = enums.game_states.INTRODUCTION
--[[
worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
display_dialogue(dialogue.introduction)
worldData.scenarioSelected = 1
]]--
itemData.itemTen.itemShow = 0 --hide item ten because we are not using it.
worldData.state = enums.game_states.SPLASHSCREEN
end



-- runs continuously. logic and game state updates go here
function love.update(dt)

--[[
if worldData.state == enums.game_states.INTRODUCTION then
  worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
  display_dialogue(dialogue.introduction)
end
]]--

-- Update sound
  assets.musicBackground.state:setVolume(assets.musicBackground.volume)
  assets.musicScenarioOne.state:setVolume(assets.musicScenarioOne.volume)
  assets.musicScenarioTwo.state:setVolume(assets.musicScenarioTwo.volume)
  assets.musicScenarioThree.state:setVolume(assets.musicScenarioThree.volume)



if worldData.state == enums.game_states.WAITINGFORRESPONSE then
    --  print("Waiting for reponse")
      --print(itemData.choiceSelected)
      assets.musicScenarioOne.volume = 0.03

      if worldData.scenarioSelected == 1 then
          print("Psst: 2 is good, 1 is neutral")
          if selectItem(2, 1, 0, 3, 4, 5, 6, 7, 8, 9) == 1 then  -- item 3 good, 2 neutral
            display_dialogue(dialogue.scenarioOneGood)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMGOOD
            worldData.scenarioSelected = 2 --prepare for next scenario
            itemData.itemTwo.itemShow = 0
            assets.musicScenarioOne.volume = 0
          elseif selectItem(2, 1, 0, 3, 4, 5, 6, 7, 8, 9) == 2 then
            display_dialogue(dialogue.scenarioOneNeutral)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMNEUTRAL
            worldData.scenarioSelected = 2 --prepare for next scenario
            itemData.itemOne.itemShow = 0
            assets.musicScenarioOne.volume = 0
          elseif selectItem(2, 1, 0, 3, 4, 5, 6, 7, 8, 9) == 3 then
            assets.musicScenarioOne.volume = 0
            display_dialogue(dialogue.scenarioOneBad)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
          end
      elseif worldData.scenarioSelected == 2 then
          print("Psst: 4 is good, 7 is neutral")
          if selectItem(4, 7, 1, 2, 3, 5, 6, 8, 9) == 1 then
            display_dialogue(dialogue.scenarioTwoGood)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMGOOD
            worldData.scenarioSelected = 3 --prepare for next scenario
            itemData.itemFour.itemShow = 0
            assets.musicScenarioOne.volume = 0
          elseif selectItem(4, 7, 1, 2, 3, 5, 6, 8, 9) == 2 then
            assets.musicScenarioOne.volume = 0.03
            display_dialogue(dialogue.scenarioTwoNeutral)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMNEUTRAL
            worldData.scenarioSelected = 3 --prepare for next scenario
            itemData.itemSeven.itemShow = 0
            assets.musicScenarioOne.volume = 0
          elseif selectItem(4, 7, 1, 2, 3, 5, 6, 8, 9) == 3 then
            assets.musicScenarioOne.volume = 0
            display_dialogue(dialogue.scenarioTwoBad)
            assets.musicScenarioOne.volume = 0
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
          end
      elseif worldData.scenarioSelected == 3 then
          print("Psst: 0 is good, 5 is neutral")
          if selectItem(0, 5, 1, 2, 3, 4, 6, 7, 8, 9) == 1 then
            display_dialogue(dialogue.scenarioThreeGood)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.OUTRO
            worldData.scenarioSelected = 4 --prepare for next scenario
            itemData.itemZero.itemShow = 0
            assets.musicScenarioOne.volume = 0
          elseif selectItem(0, 5, 1, 2, 3, 4, 6, 7, 8, 9) == 2 then
            display_dialogue(dialogue.scenarioTwoNeutral)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.OUTRO
            worldData.scenarioSelected = 4 --prepare for next scenario
            itemData.itemFive.itemShow = 0
            assets.musicScenarioOne.volume = 0
          elseif selectItem(0, 5, 1, 2, 3, 4, 6, 7, 8, 9) == 3 then
            assets.musicScenarioOne.volume = 0
            display_dialogue(dialogue.scenarioTwoBad)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
          end
      end
  end


  if worldData.state == enums.game_states.TRANSITIONFROMGOOD then
    assets.musicScenarioOne.volume = 0
    print("Transition from Good")
    print(worldData.scenarioSelected)
    display_dialogue(dialogue.transitionFromGoodOne)
    worldData.current_dialogue.game_mode_after_dialogue_done = worldData.scenarioSelected
    print("worldData value after")
    print(worldData.scenarioSelected)
  end

  if worldData.state == enums.game_states.TRANSITIONFROMNEUTRAL then
    assets.musicScenarioOne.volume = 0
    print("Transition from Neutral")
    print(worldData.scenarioSelected)
    display_dialogue(dialogue.transitionFromNeutralOne)
    worldData.current_dialogue.game_mode_after_dialogue_done = worldData.scenarioSelected
    print("worldData value after")
    print(worldData.scenarioSelected)
  end


  -- trigger scenarios
  if worldData.state == enums.game_states.SCENARIO1 then
    print("Scenario1 State")
    assets.musicScenarioOne.volume = 0
    display_dialogue(dialogue.scenarioOneIntro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end


  if worldData.state == enums.game_states.SCENARIO2 then
    print("Scenario2 State")
    assets.musicScenarioOne.volume = 0
    display_dialogue(dialogue.scenarioTwoIntro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end

  if worldData.state == enums.game_states.SCENARIO3 then
    print("Scenario3 State")
    assets.musicScenarioOne.volume = 0
    display_dialogue(dialogue.scenarioThreeIntro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end

  if worldData.state == enums.game_states.OUTRO then
    print("Scenario Outro")
    assets.musicScenarioOne.volume = 0
    enums.game_states.ENDING = false
    display_dialogue(dialogue.scenarioOutro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
  end


  -- start
  if love.keyboard.isDown('s') then
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
    display_dialogue(dialogue.introduction)
  end

  -- item selection
  if love.keyboard.isDown('1') then

  end


  -- end program
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end

  -- reset program
  if love.keyboard.isDown('r') then
      resetGame()
    --love.event.quit("restart")
  end

  if not love.keyboard.isDown('space') then
    keyState.space.pressed = false
  end

  if worldData.state == enums.game_states.DIALOGUE then
    local full_len = string.len(worldData.current_dialogue.text)
    local chars_per_second = 45
    local len_to_print = chars_per_second * worldData.current_dialogue.time_since_started_printing
    worldData.current_dialogue.len_to_print = len_to_print
    worldData.current_dialogue.time_since_started_printing = dt + worldData.current_dialogue.time_since_started_printing

    if full_len > len_to_print then
      worldData.cursor_blink_time = 5000
    else
      worldData.cursor_blink_time = worldData.cursor_blink_time + dt
      if worldData.cursor_blink_time > 1 then
        worldData.cursor_blink_time = 0
      end
    end
  end

  if love.keyboard.isDown('space')
    and worldData.state == enums.game_states.SPLASHSCREEN
    then
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
    display_dialogue(dialogue.introduction)
    worldData.scenarioSelected = 1
  end

  if love.keyboard.isDown('space')
    and worldData.state == enums.game_states.DIALOGUE
    and not keyState.space.pressed then
    keyState.space.pressed = true
    advance_dialogue()
  end
end


-- LOVE.DRAW --
-- runs continuously; this is the only place draw calls will work
function love.draw()

if worldData.state == enums.game_states.SPLASHSCREEN then
  love.graphics.draw(assets.images.backgroundSplashScreen, 0, 0)
else
  love.graphics.draw(assets.images.background, 0, 0)
  love.graphics.draw(assets.images.backgroundNumbers, 0, 0)

  -- Use a for loop here if time
  --items
  if itemData.itemZero.itemShow == 1 then
    love.graphics.draw(itemData.itemZero.image, 128, 192)
  end
  if itemData.itemOne.itemShow == 1 then
    love.graphics.draw(itemData.itemOne.image, 320, 192)
  end
  if itemData.itemTwo.itemShow == 1 then
    love.graphics.draw(itemData.itemTwo.image, 512, 192)
  end
  if itemData.itemThree.itemShow == 1 then
    love.graphics.draw(itemData.itemThree.image, 704, 192)
  end
  if itemData.itemFour.itemShow == 1 then
    love.graphics.draw(itemData.itemFour.image, 128, 384)
  end
  if itemData.itemFive.itemShow == 1 then
    love.graphics.draw(itemData.itemFive.image, 320, 384)
  end
  if itemData.itemSix.itemShow == 1 then
    love.graphics.draw(itemData.itemSix.image, 512, 384)
  end
  if itemData.itemSeven.itemShow == 1 then
    love.graphics.draw(itemData.itemSeven.image, 704, 384)
  end
  if itemData.itemEight.itemShow == 1 then
    love.graphics.draw(itemData.itemEight.image, 128, 576)
  end
  if itemData.itemNine.itemShow == 1 then
    love.graphics.draw(itemData.itemNine.image, 320, 576)
  end
  if itemData.itemTen.itemShow == 1 then
    love.graphics.draw(itemData.itemTen.image, 512, 576)
  end
end

  local prev_r, prev_g, prev_b, prev_a = love.graphics.getColor()
  love.graphics.setColor(0.1, 0.1, 0.1, 1)
  love.graphics.setColor(1, 1, 1, 1)


  love.graphics.setColor(prev_r, prev_g, prev_b, prev_a)

-- Waiting for Response
if worldData.state == enums.game_states.WAITINGFORRESPONSE then
      local substr = string.sub(worldData.current_dialogue.text, 1, worldData.current_dialogue.len_to_print)
      love.graphics.draw(assets.images[worldData.current_dialogue.avatarUpper], 0, 0) --upper Avatar image. Changes with speaker
      love.graphics.draw(assets.images[worldData.current_dialogue.avatarLower], 704, 576) --Lower avatar image.
      print_dialogue_text("Which item will you give to Sir Spaciouspants? (Select 0-9)")
      --print_dialogue_continue_caret()
end



    if worldData.state == enums.game_states.DIALOGUE then
      local prev_r, prev_g, prev_b, prev_a = love.graphics.getColor()


      -- render aventurer, cat, and text
      if worldData.current_dialogue then

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(assets.images[worldData.current_dialogue.avatarUpper], 0, 0) --upper Avatar image. Changes with speaker
        love.graphics.draw(assets.images[worldData.current_dialogue.avatarLower], 704, 576) --Lower avatar image.
        love.graphics.setColor(1, 1, 1, 1)
  --      love.graphics.setColor(0, 0.8, 0, 1)
        --print_name(worldData.current_dialogue.name)
        local substr = string.sub(worldData.current_dialogue.text, 1, worldData.current_dialogue.len_to_print)
        print_dialogue_text(substr)
        print_dialogue_continue_caret()
      end

      -- overlay to dim lower area when making choice
      love.graphics.draw(assets.images.backgroundOverlay,0,0)
      --love.graphics.setColor(0, 0, 0, 0.5)
      --love.graphics.rectangle('fill', 0, 64 * 3, 1024, 768)


      love.graphics.setColor(prev_r, prev_g, prev_b, prev_a)
    end

  if worldData.state == enums.game_states.WIN then
    love.graphics.setColor(0, 0, 1, 0.5)
    love.graphics.rectangle('fill', 0, 0, 1024, 768)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(assets.images.backgroundCredits, 0, 0)

    --love.graphics.draw(assets.images.endCredits, 0, 0)
    love.graphics.setColor(0, 0, 0, 1)
    print_header("Your human has died!", 70, 50)
    print_header("But don’t worry, I’m sure you will be fine.", 70, 100)
    print_header("Maybe if you try again you can keep him safe!", 70, 150)
    print_header("Probably not though.", 70, 200)

    print_header("Cat in the Bag was made by:", 590, 50)
    print_header("Art:", 590, 100)
    print_header("--Aaron Uglum (FugitiveInkStudio.com)", 590, 150)
    print_header("--Sarah White (ordinaryhumanperson.com)", 590, 200)
    print_header("--Joanna (7) & Caroline (4) ", 590, 250)
    print_header("Music:", 590, 300)
    print_header("--Leo Krechmer (leokrechmer.itch.io)", 590, 350)
    print_header("Programming", 590, 400)
    print_header("--Josh Hertel (twitter.com/herteljt)", 590, 450)
    print_header("Story", 590, 500)
    print_header("--David Schallert (twitter.com/Fromage10x", 590, 550)
    print_header("                            twitch.tv/fromage10x)", 590, 575)
    print_header("--Juliette Welch (itch.io/profile/grimpuppet)", 590, 620)
    print_header("Press Enter", 500, 700)

    love.graphics.setColor(1, 1, 1, 1)
    print_header("Your human has died!", 70, 52)
    print_header("But don’t worry, I’m sure you will be fine.", 70, 102)
    print_header("Maybe if you try again you can keep him safe!", 70, 152)
    print_header("Probably not though.", 70, 202)

    print_header("Cat in the Bag was made by:", 592, 52)
    print_header("Art:", 592, 102)
    print_header("--Aaron Uglum (FugitiveInkStudio.com)", 592, 152)
    print_header("--Sarah White (ordinaryhumanperson.com)", 592, 202)
    print_header("--Joanna (7) & Caroline (4) ", 592, 252)
    print_header("Music:", 592, 302)
    print_header("--Leo Krechmer (leokrechmer.itch.io)", 592, 352)
    print_header("Programming", 592, 402)
    print_header("--Josh Hertel (twitter.com/herteljt)", 592, 452)
    print_header("Story", 592, 502)
    print_header("--David Schallert (twitter.com/Fromage10x", 592, 552)
    print_header("                            twitch.tv/fromage10x)", 592, 577)
    print_header("--Juliette Welch (itch.io/profile/grimpuppet)", 592, 622)
    print_header("Press Enter", 502, 702)

end


if worldData.state == enums.game_states.WIN and
enums.game_states.ENDING == true then

      love.graphics.setColor(0, 0, 1, 0.5)
      love.graphics.rectangle('fill', 0, 0, 1024, 768)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(assets.images.backgroundEnding, 0, 0)
      --love.graphics.draw(assets.images.endCredits, 0, 0)
  --          print_dialogue_text()
      love.graphics.setColor(0, 0, 0, 1)
      print_header("Game over! Press 'r' to play again or 'ESC' to quit", 300, 100)
      print_header("Joanna (7)", 250, 200)
      print_header("Caroline (4)", 665, 200)
      love.graphics.setColor(1, 1, 1, 1)
      print_header("Game over! Press 'r' to play again or 'ESC' to quit", 302, 102)
      print_header("Joanna (7)", 252, 202)
      print_header("Caroline (4)", 667, 202)

end



  end




-- helpers for rendering text to screen at a pixel position

--[[
function print_normal(text, x_pos, y_pos)
  love.graphics.print(text, assets.fonts.regular, x_pos, y_pos, 0, 1, 1)
end
]]--

function print_header(text, x_pos, y_pos)
  love.graphics.print(text, assets.fonts.header, x_pos, y_pos, 0, 1, 1)
end

function print_name(name)
  love.graphics.print(name, assets.fonts.regular, 400, 33)
end

function print_dialogue_text(text)
  love.graphics.printf(text, assets.fonts.dialogue, 375, 50, 600)
end


function print_dialogue_continue_caret()
  if worldData.cursor_blink_time < 0.5 then
    love.graphics.print(">", assets.fonts.regular, 975, 145)
  end
end


--Functions to track key pressing
function love.keypressed( key )
  if key == "d" or key =="right" then
    text = "Right  -- pressed!"
  end

  if key == "a" then
    text = "a  -- pressed!"

  end
  if key == "b" then
    text = "b  -- pressed!"

  end

  if key == "j" then
    text = "j  -- pressed!"
    worldData.scenarioSelected = 1
    worldData.state = enums.game_states.SCENARIO1
  end

  if key == "k" then
    text = "k  -- pressed!"
    worldData.scenarioSelected = 2
    worldData.state = enums.game_states.SCENARIO2
  end

  if key == "l" then
    text = "l  -- pressed!"
    worldData.scenarioSelected = 3
    worldData.state = enums.game_states.SCENARIO3
  end

  if key =="up" then
    text = "Up  -- pressed!"
--    assets.musicScenarioOne.volume = assets.musicScenarioOne.volume + .05
  end
  if key =="down" then
    text = "Down  -- pressed!"
  --  assets.musicScenarioOne.volume = assets.musicScenarioOne.volume - .05
  end


  if key == "space" then
    text = "Space  -- pressed!"
    itemData.choiceSelected = 100
  end
  if key == "1" then
    text = "One  -- pressed!"
    itemData.choiceSelected = 1
  end
  if key == "2" then
    text = "Two  -- pressed!"
    itemData.choiceSelected = 2
  end
  if key == "3" then
    text = "Three  -- pressed!"
    itemData.choiceSelected = 3
  end
  if key == "4" then
    text = "Four  -- pressed!"
    itemData.choiceSelected = 4
  end
  if key == "5" then
    text = "Five  -- pressed!"
    itemData.choiceSelected = 5
  end
  if key == "6" then
    text = "Six  -- pressed!"
    itemData.choiceSelected = 6

  end
  if key == "7" then
    text = "Seven  -- pressed!"
    itemData.choiceSelected = 7
  end
  if key == "8" then
    text = "Eight  -- pressed!"
    itemData.choiceSelected = 8
  end
  if key == "9" then
    text = "Nine  -- pressed!"
    itemData.choiceSelected = 9
  end
  if key == "0" then
    text = "Zero  -- pressed!"
    itemData.choiceSelected = 0

  end
  if key == "backspace" then
    text = "Backspace  -- pressed!"
    worldData.state = enums.game_states.WIN
  end
  if key == "return" then
    text = "Enter  -- pressed!"
    enums.game_states.ENDING = true
  end
  print(text) --Remove comment to debug keypress
end


function love.keyreleased( key )
  if key == "d" or key =="right" then
    text = "Right  -- released!"
    keyState.right.pressed = false
  end
  if key == "a" or key =="left" then
    text = "Left  -- released!"
    keyState.left.pressed = false
  end
  if key == "w" or key =="up" then
    text = "Up  -- released!"
    keyState.up.pressed = false
  end
  if key == "s" or key =="down" then
    text = "Down  -- released!"
    keyState.down.pressed = false
  end
  if key == "space" then
    text = "Space  -- released!"
    keyState.space.pressed = false
  end
  if key == "1" then
    text = "One  -- released!"
    keyState.one.pressed = false
  end
  if key == "2" then
    text = "Two  -- released!"
    keyState.two.pressed = false
  end
  if key == "3" then
    text = "Three  -- released!"
    keyState.three.pressed = false
  end
  if key == "4" then
    text = "Four  -- released!"
    keyState.four.pressed = false
  end
  if key == "backspace" then
    text = "Backspace  -- released!"
    keyState.backspace.pressed = false
  end
  if key == "`" then
    text = "`  -- released!"
    keyState.accent.pressed = false
  end
  if key == "return" then
    text = "Enter  -- released!"
    keyState.enter.pressed = false
  end
  --   print(text) --Remove comment to debug keypress
end


function display_dialogue(dialogue_chunk)
  worldData.state = enums.game_states.DIALOGUE
  worldData.current_dialogue.full_chunk = dialogue_chunk
  worldData.current_dialogue.chunk_index = 0
  local size = 0
  for i,x in ipairs(dialogue_chunk) do
    size = size + 1
  end
  worldData.current_dialogue.chunk_length = size
  advance_dialogue()
end

function advance_dialogue()
  local idx = worldData.current_dialogue.chunk_index + 1
  local dia = worldData.current_dialogue.full_chunk[idx]

  if idx > worldData.current_dialogue.chunk_length then
    worldData.state = worldData.current_dialogue.game_mode_after_dialogue_done
    return
  end

  worldData.current_dialogue.name = dia.name
  worldData.current_dialogue.text = dia.text
  worldData.current_dialogue.avatarUpper = dia.avatarUpper
  worldData.current_dialogue.avatarLower = dia.avatarLower
  worldData.current_dialogue.time_since_started_printing = 0
  worldData.current_dialogue.len_to_print = 0

  worldData.current_dialogue.chunk_index = idx
end

-- Select item
function selectItem (good, neutral, bad1, bad2, bad3, bad4, bad5, bad6, bad7, bad8, bad9)
--  print("Which item do you give the knight? (Select 0-9)")
  if itemData.choiceSelected == good then
      itemData.choiceStatus = good
      return 1
  elseif itemData.choiceSelected == neutral then
      itemData.choiceStatus = netural
      return 2
  elseif itemData.choiceSelected == bad1 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad2 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad3 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad4 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad5 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad6 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad7 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad8 then
      itemData.choiceStatus = 3
      return 3
  elseif itemData.choiceSelected == bad9 then
      itemData.choiceStatus = 3
      return 3
  end

end

function resetGame ()
  itemData.choiceSelected = 100

  itemData.itemZero.itemShow = 1
  itemData.itemOne.itemShow = 1
  itemData.itemTwo.itemShow = 1
  itemData.itemThree.itemShow = 1
  itemData.itemFour.itemShow = 1
  itemData.itemFive.itemShow = 1
  itemData.itemSix.itemShow = 1
  itemData.itemSeven.itemShow = 1
  itemData.itemEight.itemShow = 1
  itemData.itemNine.itemShow = 1

  assets.musicBackground.volume = .08
  assets.musicScenarioOne.volume = 0
  assets.musicScenarioTwo.volume = 0
  assets.musicScenarioThree.volume = 0

  enums.game_states.ENDING = false

  worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
  display_dialogue(dialogue.introduction)
  worldData.scenarioSelected = 1
end
