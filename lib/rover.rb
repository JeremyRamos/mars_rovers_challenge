require 'pry'

class Rover

  DIRECTIONS_MAP = {
     0 => 'N',
    90 => 'E',
    180 => 'S',
    270 => 'W'
  }

  def initialize(position)
    @x, @y, @direction = position
  end

  def position
    [@x, @y, @direction]
  end

  def explore(command)

    case command
    when 'M' then move_in_direction
    when 'R' then change_direction(DIRECTIONS_MAP.invert[@direction] + 90)
    when 'L' then change_direction(DIRECTIONS_MAP.invert[@direction] - 90)
    end

    position
  end

  
  private
  
    def change_direction(degrees)
      degrees = degrees == 360 ? 0 : degrees
      degrees = degrees == -90 ? 270 : degrees

      @direction = DIRECTIONS_MAP[degrees]
    end

    def move_in_direction
      case @direction
      when 'N' then @y += 1
      when 'S' then @y -= 1
      when 'W' then @x -= 1
      when 'E' then @x += 1
      end
    end
end