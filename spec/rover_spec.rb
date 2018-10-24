require 'spec_helper'
require 'rover'

RSpec.describe Rover do
  it 'has a starting position' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.position).to eq [0, 0, 'N']
  end

  it 'the rover can move forward' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.explore('M')).to eq [0, 1, 'N']
  end

  it 'the rover change direction 90 left from current direction' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.explore('L')).to eq [0, 0, 'W']
  end

  it 'the rover change direction 90 right from current direction' do
    rover = Rover.new([0, 0, 'N'])
    expect(rover.explore('R')).to eq [0, 0, 'E']
  end
end