require 'pry'

class Rover

  DIRECTIONS_MAP = {
     0 => 'N',
    90 => 'E',
    180 => 'S',
    270 => 'W'
  }

  def initialize(initial_position)
    @x, @y, @facing_direction = initial_position
  end

  def current_position
    [@x, @y, @facing_direction]
  end

  def explore(command)

    case command
    when 'M' then move_in_direction
    when 'R' then change_in_direction(DIRECTIONS_MAP.invert[@facing_direction] + 90)
    when 'L' then change_in_direction(DIRECTIONS_MAP.invert[@facing_direction] - 90)
    end

    current_position
  end

  
  private
  
    def change_in_direction(degrees)
      degrees = degrees == 360 ? 0 : degrees
      degrees = degrees == -90 ? 270 : degrees

      @facing_direction = DIRECTIONS_MAP[degrees]
    end

    def move_in_direction
      case @facing_direction
      when 'N' then @y += 1
      when 'S' then @y -= 1
      when 'W' then @x -= 1
      when 'E' then @x += 1
      end
    end
end