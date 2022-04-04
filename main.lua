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
  assets.images.backgroundNumbers = love.graphics.newImage("graphics/numberGrid.png")
  assets.images.backgroundOverlay = love.graphics.newImage("graphics/overlay.png")

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
    assets.images.end_credits = love.graphics.newImage("graphics/end_credits.png")


  -- fonts
  assets.fonts.regular = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 28, "none")
  assets.fonts.header = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 56, "none")
  assets.fonts.dialogue = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 22, "none")

--[[
  -- sounds
  assets.musicA.intro = love.audio.newSource("/sounds/twinklyspace.mp3", "static")
  assets.musicB.intro = love.audio.newSource("/sounds/chill.mp3", "static")
  assets.musicA.encounter = love.audio.newSource("/sounds/action.mp3", "static")
  assets.musicA.win = love.audio.newSource("/sounds/win.mp3", "static")
  assets.musicA.incomingmessage = love.audio.newSource("/sounds/incomingmessage.mp3", "static")


  assets.musicA.state = assets.musicA.intro
  assets.musicA.state:setLooping(true)
  assets.musicA.state:setVolume(.15)
  assets.musicA.state:play()

  assets.musicB.state = assets.musicB.intro
  assets.musicB.state:setLooping(true)
  assets.musicB.state:setVolume(.15)
  assets.musicB.state:play()
]]--

  -- Build world
  --buildLevel(0,141,numberObstacles)

  print("Game loaded! Let's go.")

-- Comment out to test scenarios

-- Scenario Debugging
--worldData.scenarioSelected = 3
-- worldData.state = enums.game_states.INTRODUCTION

worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
display_dialogue(dialogue.introduction)
worldData.scenarioSelected = 1
end



-- runs continuously. logic and game state updates go here
function love.update(dt)

--[[
if worldData.state == enums.game_states.INTRODUCTION then
  worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
  display_dialogue(dialogue.introduction)
end
]]--



if worldData.state == enums.game_states.WAITINGFORRESPONSE then
    --  print("Waiting for reponse")
      --print(itemData.choiceSelected)

      if worldData.scenarioSelected == 1 then
          print("Psst: 2 is good, 1 is neutral")
          if selectItem(2, 1, 0, 3, 4, 5, 6, 7, 8, 9) == 1 then  -- item 3 good, 2 neutral
            display_dialogue(dialogue.scenarioOneGood)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMGOOD
            worldData.scenarioSelected = 2 --prepare for next scenario
            itemData.itemTwo.itemShow = 0
          elseif selectItem(2, 1, 0, 3, 4, 5, 6, 7, 8, 9) == 2 then
            display_dialogue(dialogue.scenarioOneNeutral)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMNEUTRAL
            worldData.scenarioSelected = 2 --prepare for next scenario
            itemData.itemOne.itemShow = 0
          elseif selectItem(2, 1, 0, 3, 4, 5, 6, 7, 8, 9) == 3 then
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
          elseif selectItem(4, 7, 1, 2, 3, 5, 6, 8, 9) == 2 then
            display_dialogue(dialogue.scenarioTwoNeutral)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.TRANSITIONFROMNEUTRAL
            worldData.scenarioSelected = 3 --prepare for next scenario
            itemData.itemSeven.itemShow = 0
          elseif selectItem(4, 7, 1, 2, 3, 5, 6, 8, 9) == 3 then
            display_dialogue(dialogue.scenarioTwoBad)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
          end
      elseif worldData.scenarioSelected == 3 then
          print("Psst: 0 is good, 5 is neutral")
          if selectItem(0, 5, 1, 2, 3, 4, 6, 7, 8, 9) == 1 then
            display_dialogue(dialogue.scenarioThreeGood)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.OUTRO
            worldData.scenarioSelected = 4 --prepare for next scenario
            itemData.itemZero.itemShow = 0
          elseif selectItem(0, 5, 1, 2, 3, 4, 6, 7, 8, 9) == 2 then
            display_dialogue(dialogue.scenarioTwoNeutral)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.OUTRO
            worldData.scenarioSelected = 4 --prepare for next scenario
            itemData.itemFive.itemShow = 0
          elseif selectItem(0, 5, 1, 2, 3, 4, 6, 7, 8, 9) == 3 then
            display_dialogue(dialogue.scenarioTwoBad)
            worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
          end
      end
  end


  if worldData.state == enums.game_states.TRANSITIONFROMGOOD then
    print("Transition from Good")
    print(worldData.scenarioSelected)
    display_dialogue(dialogue.transitionFromGoodOne)
    worldData.current_dialogue.game_mode_after_dialogue_done = worldData.scenarioSelected
    print("worldData value after")
    print(worldData.scenarioSelected)
  end

  if worldData.state == enums.game_states.TRANSITIONFROMNEUTRAL then
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
    display_dialogue(dialogue.scenarioOneIntro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end


  if worldData.state == enums.game_states.SCENARIO2 then
    print("Scenario2 State")
    display_dialogue(dialogue.scenarioTwoIntro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end

  if worldData.state == enums.game_states.SCENARIO3 then
    print("Scenario3 State")
    display_dialogue(dialogue.scenarioThreeIntro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end

  if worldData.state == enums.game_states.OUTRO then
    print("Scenario Outro")
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
    love.event.quit("restart")
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
    and worldData.state == enums.game_states.DIALOGUE
    and not keyState.space.pressed then
    keyState.space.pressed = true
    advance_dialogue()
  end
end


-- LOVE.DRAW --
-- runs continuously; this is the only place draw calls will work
function love.draw()
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
    love.graphics.draw(assets.images.end_credits, 0, 0)
    love.graphics.setColor(0, 0, 0, 1)
    print_header("You win!", 400, 300)
    print_header("Press 'r' to play again", 300, 400)
    print_header("or 'ESC' to quit.", 300, 450)
    love.graphics.setColor(1, 1, 1, 1)
    print_header("You win!", 402, 302)
    print_header("Press 'r' to play again", 302, 402)
    print_header("or 'ESC' to quit.", 302, 452)
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
    if itemData.itemZero.itemShow == 1 then
      itemData.itemZero.itemShow = 0
    else itemData.itemZero.itemShow = 1
    end
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


--[[

  if key == "w" or key =="up" then
    text = "Up  -- pressed!"
  end
  if key == "s" or key =="down" then
    text = "Down  -- pressed!"
  end
]]--

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

function resetItemStatus ()
  itemData.choiceSelected = 100
end
