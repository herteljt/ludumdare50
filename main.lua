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

  assets.images.narrator = love.graphics.newImage("graphics/narrator.png")
  assets.images.fight = love.graphics.newImage("graphics/fight.png")

  assets.images.characterBlank = love.graphics.newImage("graphics/characterBlank.png")

--end credits
  assets.images.end_credits = love.graphics.newImage("graphics/end_credits.png")


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




  -- fonts

--  assets.fonts.regular = love.graphics.newFont("fonts/IndieFlower-Regular.ttf", 28, "none")
--  assets.fonts.header = love.graphics.newFont("fonts/IndieFlower-Regular.ttf", 56, "none")
--  assets.fonts.dialogue = love.graphics.newFont("fonts/IndieFlower-Regular.ttf", 22, "none")

  assets.fonts.regular = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 28, "none")
  assets.fonts.header = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 56, "none")
  assets.fonts.dialogue = love.graphics.newFont("fonts/GermaniaOne-Regular.ttf", 22, "none")


  -- sounds
  assets.music.intro = love.audio.newSource("/sounds/twinklyspace.mp3", "static")
  assets.music.level = love.audio.newSource("/sounds/chill.mp3", "static")
  assets.music.encounter = love.audio.newSource("/sounds/action.mp3", "static")
  assets.music.win = love.audio.newSource("/sounds/win.mp3", "static")
  assets.music.incomingmessage = love.audio.newSource("/sounds/incomingmessage.mp3", "static")


  assets.music.state = assets.music.intro
  assets.music.state:setLooping(true)
  assets.music.state:setVolume(.15)
  --assets.music.state:play()


  -- Build world
  --buildLevel(0,141,numberObstacles)

  print("Game loaded! Let's go.")

  worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.SCENARIO1
  display_dialogue(dialogue.introduction)

end



-- runs continuously. logic and game state updates go here
function love.update(dt)

  -- Debug mode enables W/A/S/D movement and space rotates clockwise
  if worldData.state == enums.game_states.DEBUG then
    if (love.keyboard.isDown("right") or love.keyboard.isDown("d")) and keyState.right.pressed == false then
      player.x = player.x + player.step
      keyState.right.pressed = true
    elseif (love.keyboard.isDown("left") or love.keyboard.isDown("a")) and keyState.left.pressed == false then
      player.x = player.x - player.step
      keyState.left.pressed = true
    end
    if (love.keyboard.isDown("w") or love.keyboard.isDown("up")) and keyState.up.pressed == false and keyState.up.enabled == true then
      player.y = player.y - player.step
      keyState.up.pressed = true
    elseif (love.keyboard.isDown("s") or love.keyboard.isDown("down")) and keyState.down.pressed == false then
      player.y = player.y + player.step
      keyState.down.pressed = true
    end

    -- Using space to debug facing
    if love.keyboard.isDown('space') and keyState.space.pressed == false then
      player.facingIndex = (player.facingIndex + 1)%4
      keyState.space.pressed = true
      print("Turn clockwise")
      print("Player Facing: "..player.facingIndex)
      print(player.facingIndex%4)
      print("Player X: "..player.x)
      print("Player Y: "..player.y)
    end
  end



  if love.keyboard.isDown('`') and keyState.accent.pressed == false then
    if worldData.state == enums.game_states.DIALOGUE or worldData.state == enums.game_states.MAIN_ACTION then
      worldData.state = enums.game_states.DEBUG
      print("DEBUG MODE. W/A/S/D enabled")
    elseif worldData.state == enums.game_states.DEBUG then
      worldData.state = enums.game_states.MAIN_ACTION
      print("MAIN ACTION MODE. W/A/S/D disabled")
    end
    keyState.accent.pressed = true
  end


  -- trigger scenarios
  if worldData.state == enums.game_states.SCENARIO1 then
    print("Scenario1 State")
    display_dialogue(dialogue.scenario1intro)
    worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WAITINGFORRESPONSE
  end


  if worldData.state == enums.game_states.WAITINGFORRESPONSE then
    selectItem()
  end

  --[[
  if love.keyboard.isDown('p') then
      worldData.state = enums.game_states.SCENARIO1
      print("Scenario1 State")
      display_dialogue(dialogue.scenario1intro)
      print("The correct choice is:")
      worldData.choiceCorrect = 1
      print(worldData.choiceCorrect)
      selectItem ()
  end
]]--

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



-- runs continuously; this is the only place draw calls will work
function love.draw()
  love.graphics.draw(assets.images.background, 0, 0)

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


  -- love.graphics.draw(assets.images.player, 300, 400, player.facing)

  if worldData.state == enums.game_states.DIALOGUE then
    local prev_r, prev_g, prev_b, prev_a = love.graphics.getColor()

    -- overlay to dim the play grid while dialogue is happening
    love.graphics.setColor(0, 0, 0, 0.75)
    love.graphics.rectangle('fill', 0, 64 * 3, 1024, 768)

    -- render aventurer, cat, and text
    if worldData.current_dialogue then

      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(assets.images[worldData.current_dialogue.avatarUpper], 0, 0) --avatar image knight
      love.graphics.draw(assets.images[worldData.current_dialogue.avatarLower], 704, 576) --avatar image cat
      love.graphics.setColor(1, 1, 1, 1)
--      love.graphics.setColor(0, 0.8, 0, 1)
      --print_name(worldData.current_dialogue.name)
      local substr = string.sub(worldData.current_dialogue.text, 1, worldData.current_dialogue.len_to_print)
      print_dialogue_text(substr)
      print_dialogue_continue_caret()
    end

    love.graphics.setColor(prev_r, prev_g, prev_b, prev_a)
  end

  if worldData.state == enums.game_states.SCENARIO1 then
    print("Scenario1 started")
    local prev_r, prev_g, prev_b, prev_a = love.graphics.getColor()

    -- overlay to dim the play grid while dialogue is happening
    love.graphics.setColor(0, 0, 0, 0.75)
    love.graphics.rectangle('fill', 0, 64 * 3, 1024, 768)

    -- render aventurer, cat, and text
    if worldData.current_dialogue then

      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(assets.images[worldData.current_dialogue.avatarUpper], 0, 0) --avatar image knight
      love.graphics.draw(assets.images[worldData.current_dialogue.avatarLower], 704, 576) --avatar image cat
      love.graphics.setColor(1, 1, 1, 1)
--      love.graphics.setColor(0, 0.8, 0, 1)
      --print_name(worldData.current_dialogue.name)
      local substr = string.sub(worldData.current_dialogue.text, 1, worldData.current_dialogue.len_to_print)
      print_dialogue_text(substr)
      print_dialogue_continue_caret()
    end

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
function print_normal(text, x_pos, y_pos)
  love.graphics.print(text, assets.fonts.regular, x_pos, y_pos, 0, 1, 1)
end

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


function draw_in_grid(asset, grid_x, grid_y)
  local x, y = grid_coords_to_pixels(grid_x, grid_y)
  love.graphics.draw(asset, x, y)
end


-- convert play area grid coords to pixel space
-- hard-coding 1024x768 play window, since this is a game jam and there are no rules
function grid_coords_to_pixels(grid_x, grid_y)
  if (grid_x > worldData.grid.width - 1
      or grid_x < 0
      or grid_y > worldData.grid.height - 1
      or grid_y < 0) then
    print("ERROR: tried to compute grid coords out of bounds")
    return -1, -1
  end

  local top_of_grid = 3 * 64
  local left_of_grid = 0
  local right_of_grid = worldData.grid.width * 64
  local bottom_of_grid = worldData.grid.height * 64

  local pixels_x = grid_x * 64 + left_of_grid
  local pixels_y = grid_y * 64 + top_of_grid

  return pixels_x, pixels_y
end

-- Draw map

function drawMap()
   for i = 1, 9 do
      for j = 1, 16 do

         love.graphics.draw(assets.map[i][j],0,0)
      end
   end
end




--Functions to track key pressing
function love.keypressed( key )
  if key == "d" or key =="right" then
    text = "Right  -- pressed!"
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
  end
  if key == "2" then
    text = "Two  -- pressed!"
  end
  if key == "3" then
    text = "Three  -- pressed!"
  end
  if key == "4" then
    text = "Four  -- pressed!"
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
function selectItem ()
  print("Which item do you give the knight? (Select 1-9)")
  if love.keyboard.isDown("1") then
    print("You win!")
  else
    print("Make a selection")
  end


end

--[[
-- Build Level

function buildLevel (start, stop, numberObstacles)
  player.gridLocation = player.y*16 + player.x
  goal.gridLocation = goal.y*16 + goal.x
  print("Player grid location"..player.gridLocation)
  --player.gridLocation = love.math.random(start, stop)

  for i = 1,numberObstacles do
    local obstacle = love.math.random(start, stop)
    if obstacle > player.gridLocation or obstacle < player.gridLocation then
        assets.obstacle[i] = obstacle
    else
       print("Cannot place obstacle. Player collision conflict.")
       assets.obstacle[i] = 141
    end
  end

end


-- Check checkCollisions
function checkCollisions (x, y, obstacle, number)
  local playerLocation = (y)*16 + x
  print("Player Location: "..playerLocation)
  for i = 1, number do
    if playerLocation == obstacle[i] then
      print("COLLISION at "..obstacle[i])
      worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.EXPLODED
      display_dialogue(dialogue.collision)
    end
  end
end

-- Check Goal
function checkGoal (playerx, playery, goalx, goaly)
  if math.abs(playerx - goalx) <= 3 and math.abs(playery-goaly) <= 3 then --change to shrink finding region
    if playerx == goalx and playery==goaly then
      assets.music.state:stop()
      assets.music.state = assets.music.win -- Play win music
      assets.music.state:setLooping(true)
      assets.music.state:setVolume(.15)
      assets.music.state:play()

      print("You win!")
      worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.WIN
      display_dialogue(dialogue.win)
    else
      if not goal.is_visible then
        assets.music.state:stop()
        assets.music.state = assets.music.encounter --start playing encounter music
        assets.music.state:setLooping(false)
        assets.music.state:setVolume(.15)
        assets.music.state:play()

        worldData.current_dialogue.game_mode_after_dialogue_done = enums.game_states.RUNNING_COMMAND_QUEUE
        display_dialogue(dialogue.close_to_goal)
        goal.is_visible = true
      end
    end
  end
end
]]--
