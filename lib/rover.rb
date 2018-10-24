require 'pry'

class Rover

  # DIRECTIONS = {
  #   'N' => 0,
  #   'E' => 90,
  #   'S' => 180,
  #   'W' => 270
  # }

  DIRECTIONS_MAP = {
     0 => 'N',
    90 => 'E',
    180 => 'S',
    270 => 'W'
  }

  def initialize(position)
    @x, @y, @direction = position
  end

  def starting_position
    [@x, @y, @direction]
  end

  def explore(command)
    case command
    when 'M' then move_in_direction
    when 'R' then @direction = DIRECTIONS_MAP[DIRECTIONS_MAP.invert[@direction] + 90]
    when 'L' then @direction = DIRECTIONS_MAP[DIRECTIONS_MAP.invert[@direction] + 270]
    end
    starting_position
  end

  private

    def move_in_direction
      case @direction
      when 'N' then @y += 1
      when 'S' then @y -= 1
      when 'W' then @x -= 1
      when 'E' then @x += 1
      end
    end
end