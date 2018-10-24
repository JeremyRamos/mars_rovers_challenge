require 'spec_helper'
require 'control_center'

RSpec.describe ControlCenter do
  it 'returns the correct final destination ' do
    file = File.read('command1.txt')
    head, *tail = file
    rover = ControlCenter.new(file)
    expect(rover.get_final_destination).to eq [1, 3, 'N']
  end
end