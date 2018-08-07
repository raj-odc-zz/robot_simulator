require './lib/robot'

describe Robot do

  before :each do
    @robot = Robot.new
  end

  it 'is valid direction' do
    expect(@robot.set_direction('NORTH')).to eq 'NORTH'
  end

  it 'is invalid direction' do
    expect { @robot.set_direction('NORTHWEST') }.to raise_error StandardError
  end

  it 'is rotate left' do
    expect(@robot.rotate_left).to eq 'WEST'
  end

  it 'is rotate right' do
    expect(@robot.rotate_right).to eq 'EAST'
  end

  it 'is in valid position' do
    @robot.set_position(0,0)
    expect(@robot.get_position).to eq '0,0'
  end

  it 'is invalid position raise an error and keep in same position' do
    expect { @robot.set_position(0,6) }.to raise_error "Cannot move to position"
  end

  it 'is move forward' do 
    @robot.move_forward
    expect(@robot.get_position).to eq '0,1'
  end

end