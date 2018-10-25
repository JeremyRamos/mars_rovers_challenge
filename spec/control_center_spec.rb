require 'spec_helper'
require 'control_center'

RSpec.describe ControlCenter do
  it 'returns the correct final destination' do
    file = File.read('command1.txt')
    expect(ControlCenter.get_final_coordinates(file)).to eq "1 3 N"
  end

  it 'returns the correct final destination' do
    file = File.read('command2.txt')
    expect(ControlCenter.get_final_coordinates(file)).to eq "5 1 E"
  end
end