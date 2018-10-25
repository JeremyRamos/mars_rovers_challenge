require 'spec_helper'
require 'rover'

RSpec.describe Rover do
  it 'returns the current position' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.current_position).to eq [0, 0, 'N']
  end

  it 'can move forward' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.explore('M')).to eq [0, 1, 'N']
  end

  it 'changes direction, 90 left from current direction' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.explore('L')).to eq [0, 0, 'W']
  end

  it 'changes direction, 90 right from current direction' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.explore('R')).to eq [0, 0, 'E']
  end
end