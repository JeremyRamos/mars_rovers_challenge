require 'rover'

class ControlCenter
  def initialize(file)
    @file = file
  end

  def get_final_destination
    new_file = file.split.rotate(3)
    head, *tail = new_file
    tail[0..1] = tail[0..1].map(&:to_i)

    rover = Rover.new(tail)
    head.split('').each do |letter|
      rover.explore(letter)
    end
    rover.position
  end

  private 
    attr_reader :file
end