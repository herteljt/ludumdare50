

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
  musicBackground = {
    state = nil,
    file = nil,
    volume = nil,
  },
  musicScenarioOne = {
    state = nil,
    file = nil,
    volume = nil,
  },
  musicScenarioTwo = {
    state = nil,
    file = nil,
    volume = nil,
  },
  musicScenarioThree = {
    state = nil,
    file = nil,
    volume = nil,
  },
  musicScenarioFour = {
    state = nil,
    file = nil,
    volume = nil,
  },
  fonts = {
    regular = nil,
    header = nil,
    dialogue = nil,
  },
}

enums = {
  game_states = {
    SPLASHSCREEN= 0,
    DIALOGUE = 11,
    SCENARIO1 = 1,
    SCENARIO2 = 2,
    SCENARIO3 = 3,
    TRANSITIONFROMGOOD = 5,
    TRANSITIONFROMNEUTRAL = 6,
    WAITINGFORRESPONSE = 9,
    OUTRO = 10,

  }
}

worldData = {
  state = enums.game_states.MAIN_ACTION,
  scenarioSelected = nil, --keep track of selected scenario
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
    scenaro_after_dialogue_done = enums.game_states.MAIN_ACTION,
  },
  cursor_blink_time = 0,
  numberGrid = 0, -- 0 off, 1 display
  grayScreen = nil,
}

itemData = {
  choiceGood = nil,
  choiceNeutral = nil,
  choiceBad = nil,
  choiceSelected = 100,
  choiceStatus = 0, -- 1 correct, 2 neutral, 0 reset, 3 incorrect

  itemZero = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },

  itemOne = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemTwo = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemThree = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemFour = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemFive = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemSix = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemSeven = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemEight = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemNine = {
    image = nil,
    itemShow = 1,
    itemHide = nil,
    choiceGood = nil,
    choiceNeutral = nil,
  },
  itemTen = {
    image = nil,
    itemShow = 1,
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
