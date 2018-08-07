require './lib/simulator'

describe Simulator do

  before :each do
    @simulator = Simulator.new
  end

  it 'move north report' do
    @simulator.execute_command('PLACE 0,0,NORTH')
    @simulator.execute_command('MOVE')
    expect(@simulator.execute_command('REPORT')).to eq '0,1,NORTH'
  end

  it 'rotate left report' do
    @simulator.execute_command('PLACE 0,0,NORTH')
    @simulator.execute_command('LEFT')
    expect(@simulator.execute_command('REPORT')).to eq '0,0,WEST'
  end

  it 'commands move, move, rotate left, move & report' do
    @simulator.execute_command('PLACE 1,2,EAST')
    @simulator.execute_command('MOVE')
    @simulator.execute_command('MOVE')
    @simulator.execute_command('LEFT')
    @simulator.execute_command('MOVE')
    expect(@simulator.execute_command('REPORT')).to eq '3,3,NORTH'
  end

end