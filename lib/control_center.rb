require_relative 'rover'

module ControlCenter

  def self.get_current_position(file)
    new_file = file.split.rotate(3)
    head, *tail = new_file
    tail[0..1] = tail[0..1].map(&:to_i)

    line_break
    puts "The rovers starting coordinates is: #{tail.join(' ')}"
    line_break
    puts "The Nasa commands are: #{head}"
    line_break

    rover = Rover.new(tail)
    head.split('').each do |command|
      rover.explore(command)
    end

    puts "The final coordinates is...............wait for it..............#{rover.current_position.join(' ')}"
    rover.current_position.join(' ')
  end

  def self.line_break
    puts '*' * 50
  end

  def self.welcome
    line_break
    puts 'Welcome to the Mars Rover challenge'
  end


  if $PROGRAM_NAME == __FILE__
    welcome
    puts "Enter file name with NASA commands. Valid options are: 'command1.txt' and 'command2.txt'"
    file_name = gets.chomp
    if file_name == 'command1.txt' || file_name == "command2.txt"
      file = File.read(file_name)
      ControlCenter.get_current_position(file)
    else
      puts "I told you already, the valid options are: 'command1.txt' and 'command2.txt'."
      puts 'Now you will have to do this all over.'
    end
  end
end