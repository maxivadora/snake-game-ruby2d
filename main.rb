require 'ruby2d'

BOARD_WIDTH = 500
BOARD_HEIGHT = 500
UNIT_SIZE = 20

set width: BOARD_WIDTH, height: BOARD_HEIGHT

def rand_x_number
  rand(BOARD_WIDTH - 50)
end

def rand_y_number
  rand(BOARD_HEIGHT - 50)
end

x_movement = 0
y_movement = 0
s = Square.new(x: 0, y: 0, size: UNIT_SIZE, color: 'blue')
food = Square.new(x: rand_x_number, y: rand_y_number, size: UNIT_SIZE, color: 'red')
food_collected = 0

on :key_down do |event|
  case event.key
  when 'left'
    x_movement = -2
    y_movement = 0
  when 'right'
    x_movement = 2
    y_movement = 0
  when 'up'
    x_movement = 0
    y_movement = -2
  when 'down'
    x_movement = 0
    y_movement = 2
  when 'space'
    x_movement = 0
    y_movement = 0
  end
end

update do
  s.x += x_movement
  s.y += y_movement

  if s.contains?(food.x, food.y)
    food.remove
    food_collected += 1

    food = Square.new(x: rand_x_number, y: rand_y_number, size: UNIT_SIZE, color: 'red')
  end
end

show
