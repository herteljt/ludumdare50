

-- global data. declared here, initialized in love.load
assets = {
  obstacle = {
  },
  images = {
    background = nil,
    obstacle = nil,
    fake_avatar = nil,
    forward = nil,
    left = nil,
    right = nil,
    blank = nil,
    avatarLower = nil,
    avatarupper = nil,
    narrator = nil,
    fight = nil,
    end_credits = nil,
  },
  player ={

  },
  musicA = {
    state = nil,
    intro = nil,
    level = nil,
    encounter = nil,
    win = nil,
    incomingmessage = nil,
  },
  musicB = {
    state = nil,
    intro = nil,
    level = nil,
    encounter = nil,
    win = nil,
    incomingmessage = nil,
  },
  fonts = {
    regular = nil,
    header = nil,
    dialogue = nil,
  },
}

enums = {
  game_states = {
    MAIN_ACTION = 0,
    DIALOGUE = 11,
    SCENARIO1 = 1,
    SCENARIO2 = 2,
    SCENARIO3 = 3,
    WAITINGFORRESPONSE = 9

  }
}

worldData = {
  state = enums.game_states.MAIN_ACTION,
  grid = {
    width = nil,
    height = nil,
    border = nil,
  },
  current_dialogue = {
    name = nil,
    avatarUpper = nil,
    avatarLower = nil,
    text = nil,
    time_since_started_printing = 0,
    len_to_print = 0,
    full_chunk = nil,
    chunk_index = 1,
    chunk_length = 0,
    game_mode_after_dialogue_done = enums.game_states.MAIN_ACTION,
  },
  cursor_blink_time = 0,
  numberGrid = 0, -- 0 off, 1 display
  scenarioSelected = nil,
}

itemData = {
  choiceGood = nil,
  choiceNeutral = nil,
  choiceBad = nil,
  choiceSelected = nil,
  choiceStatus = 0, -- 1 correct, 2 neutral, 0 reset, 3 incorrect

  itemOne = {
    itemShow = nil,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemTwo = {
    itemShow = nil,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
}


-- Keeping track of keyboard state. If key is not pressed, state is false.
keyState = {
  up = {
    pressed = false,
    enabled = true
  },
  down = {
    pressed = false,
    enabled = true
  },
  left = {
    pressed = false,
    enabled = true
  },
  right = {
    pressed = false,
    enabled = true
  },
  space = {
    pressed = false,
    enabled = true
  },
  one = {
    pressed = false,
    enabled = true
  },
  two = {
    pressed = false,
    enabled = true
  },
  three = {
    pressed = false,
    enabled = true
  },
  four = {
    pressed = false,
    enabled = true
  },
  five = {
    pressed = false,
    enabled = true
  },
  six = {
    pressed = false,
    enabled = true
  },
  seven = {
    pressed = false,
    enabled = true
  },
  eight = {
    pressed = false,
    enabled = true
  },
  nine = {
    pressed = false,
    enabled = true
  },
  backspace = {
    pressed = false,
    enabled = true
  },
  accent = {
    pressed = false,
    enabled = true
  },
  enter = {
    pressed = false,
    enabled = true
  }
}

player = {
  x = nil,
  y = nil,
  width = nil,
  height = nil,
  speed = nil,
  score = nil,
  step = nil,
  facingIndex = nil,
  gridPosition = nil, -- Location as a single number on the grid

}

goal = {
  x = nil,
  y = nil,
  gridPosition = nil, -- Location as a single number on the grid
  is_visible = false,  -- Is the goal visible
}
