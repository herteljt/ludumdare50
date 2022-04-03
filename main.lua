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

--items
-- cat
  itemData.itemOne.image = love.graphics.newImage("graphics/itemFish.png")
  itemData.itemTwo.image= love.graphics.newImage("graphics/itemShark.png")
  itemData.itemThree.image = love.graphics.newImage("graphics/itemPudding.png")
  itemData.itemFour.image = love.graphics.newImage("graphics/itemPotato.png")
  itemData.itemFive.image = love.graphics.newImage("graphics/itemPotato.png")
  itemData.itemSix.image = love.graphics.newImage("graphics/itemKey.png")
  itemData.itemSeven.image = love.graphics.newImage("graphics/itemPerfume.png")
  itemData.itemEight.image = love.graphics.newImage("graphics/itemBottle.png")
  itemData.itemNine.image = love.graphics.newImage("graphics/itemRope.png")
  itemData.itemTen.image = love.graphics.newImage("graphics/itemFish.png")
  itemData.itemEleven.image = love.graphics.newImage("graphics/itemKey.png")


  --end credits
    assets.images.end_credits = love.graphics.newImage("graphics/end_credits.png")



  -- fonts

--  assets.fonts.regular = love.graphics.newFont("fonts/IndieFlower-Regular.ttf", 28, "none")
--  assets.fonts.header = love.graphics.newFont("fonts/IndieFlower-Regular.ttf", 56, "none")
--  assets.fonts.dialogue = love.graphics.newFont("fonts/IndieFlower-Regular.ttf", 22, "none")

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
--worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
--display_dialogue(dialogue.introduction)



-- Scenario Debugging
worldData.scenarioSelected = 2
worldData.state = enums.game_states.SCENARIO2

end



-- runs continuously. logic and game state updates go here
function love.update(dt)

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

--[[
  if worldData.state == enums.game_states.WAITINGFORRESPONSE then
    print("Waiting for reponse")
    print(itemData.choiceStatus)

    if selectItem(1, 2) == 1 then
      display_dialogue(dialogue.scenarioOneGood)
      worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO2
    elseif selectItem(1, 2) == 2 then
      display_dialogue(dialogue.scenarioOneNeutral)
      worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO2
    elseif selectItem(1, 2) == 3 then
      display_dialogue(dialogue.scenarioOneBad)
      worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
    end
  end
]]--

  if worldData.state == enums.game_states.WAITINGFORRESPONSE then
    print("Waiting for reponse")
    print(itemData.choiceStatus)

    if worldData.scenarioSelected == 1 then
      if selectItem(3, 4) == 1 then
        display_dialogue(dialogue.scenarioOneGood)
        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO2
        itemData.itemThree.itemShow = 0
      elseif selectItem(3, 4) == 2 then
        display_dialogue(dialogue.scenarioOneNeutral)
        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO2
        itemData.itemFour.itemShow = 0
      elseif selectItem(3, 4) == 3 then
        display_dialogue(dialogue.scenarioOneBad)
        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
      end
  elseif worldData.scenarioSelected == 2 then
      if selectItem(1, 2) == 1 then
        display_dialogue(dialogue.scenarioTwoGood)
        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
        itemData.itemOne.itemShow = 0
        print_dialogue_continue_caret()
      elseif selectItem(1, 2) == 2 then
        display_dialogue(dialogue.scenarioTwoNeutral)
        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
        itemData.itemTwo.itemShow = 0
        print_dialogue_continue_caret()
      elseif selectItem(1, 2) == 3 then
        display_dialogue(dialogue.scenarioTwoBad)
        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
      end
    end
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
if itemData.itemOne.itemShow == 1 then
  love.graphics.draw(itemData.itemOne.image, 128, 192)
end
if itemData.itemTwo.itemShow == 1 then
  love.graphics.draw(itemData.itemTwo.image, 320, 192)
end
if itemData.itemThree.itemShow == 1 then
  love.graphics.draw(itemData.itemThree.image, 512, 192)
end
if itemData.itemFour.itemShow == 1 then
  love.graphics.draw(itemData.itemFour.image, 704, 192)
end
if itemData.itemFive.itemShow == 1 then
  love.graphics.draw(itemData.itemFive.image, 128, 384)
end
if itemData.itemSix.itemShow == 1 then
  love.graphics.draw(itemData.itemSix.image, 320, 384)
end
if itemData.itemSeven.itemShow == 1 then
  love.graphics.draw(itemData.itemSeven.image, 512, 384)
end
if itemData.itemEight.itemShow == 1 then
  love.graphics.draw(itemData.itemEight.image, 704, 384)
end
if itemData.itemNine.itemShow == 1 then
  love.graphics.draw(itemData.itemNine.image, 128, 576)
end
if itemData.itemTen.itemShow == 1 then
  love.graphics.draw(itemData.itemTen.image, 320, 576)
end
if itemData.itemEleven.itemShow == 1 then
  love.graphics.draw(itemData.itemEleven.image, 512, 576)
end


  local prev_r, prev_g, prev_b, prev_a = love.graphics.getColor()
  love.graphics.setColor(0.1, 0.1, 0.1, 1)
  love.graphics.setColor(1, 1, 1, 1)


  love.graphics.setColor(prev_r, prev_g, prev_b, prev_a)

-- Waiting for Response
if worldData.state == enums.game_states.WAITINGFORRESPONSE then
      local substr = string.sub(worldData.current_dialogue.text, 1, worldData.current_dialogue.len_to_print)
      print_dialogue_text("Which item will you give to the knight? (Select 1-9)")
      print_dialogue_continue_caret()
end



    if worldData.state == enums.game_states.DIALOGUE then
      local prev_r, prev_g, prev_b, prev_a = love.graphics.getColor()


      -- render aventurer, cat, and text
      if worldData.current_dialogue then

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(assets.images[worldData.current_dialogue.avatarUpper], 0, 0) --upper Avatar image. Changes with speaker
        love.graphics.draw(assets.images.catNeutral, 704, 576) --Lower avatar image. Set statically to cat currently
        love.graphics.setColor(1, 1, 1, 1)
  --      love.graphics.setColor(0, 0.8, 0, 1)
        --print_name(worldData.current_dialogue.name)
        local substr = string.sub(worldData.current_dialogue.text, 1, worldData.current_dialogue.len_to_print)
        print_dialogue_text(substr)
        print_dialogue_continue_caret()
      end

      -- overlay to dim the play grid while dialogue is happening
      love.graphics.setColor(0, 0, 0, 0.5)
      love.graphics.rectangle('fill', 0, 64 * 3, 1024, 768)
      

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
    if itemData.itemOne.itemShow == 1 then
      itemData.itemOne.itemShow = 0
    else itemData.itemOne.itemShow = 1
    end
  end
  if key == "a" or key =="left" then
    text = "Left  -- pressed!"
  end
  if key == "w" or key =="up" then
    text = "Up  -- pressed!"
  end
  if key == "s" or key =="down" then
    text = "Down  -- pressed!"
  end
  if key == "space" then
    text = "Space  -- pressed!"
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
    itemData.choiceSelected = 10
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
function selectItem (good, neutral)
--  print("Which item do you give the knight? (Select 0-9)")
--  print(keyValue)
  if itemData.choiceSelected == good then
    itemData.choiceStatus = 1
    return 1
  elseif itemData.choiceSelected == neutral then
     itemData.choiceStatus = 2
     return 2
  elseif itemData.choiceSelected == 3 then
      itemData.choiceStatus = 3
      return 3
  end

end

function resetItemStatus ()
  itemData.choiceSelected = 0
end
