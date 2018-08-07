class Simulator
  require './lib/robot.rb'

  COMMANDS = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']

  def initialize
    @robot = Robot.new
  end

  def execute_command(command)
    (func, args) = command.upcase.split(' ',2)
    if !COMMANDS.include? func
    raise StandardError, func.to_s + ' is not a valid command'
    end

    case func
    when 'PLACE'
      cmd_place args
      return
    when 'MOVE'
      @robot.move_forward
      return
    when 'LEFT'
      @robot.rotate_left
      return
    when 'RIGHT'
      @robot.rotate_right
      return
    when 'REPORT'
      @robot.get_position + ',' + @robot.direction
    end
  end

  def cmd_place(args)
    return nil unless args
    (row, col, direction) = validate_place_input(args)
    raise "Enter valid position and direction" unless row && col && direction
    @robot.set_direction(direction)
    @robot.set_position(row, col)
  end

  private

  def validate_place_input(args)
    (row, col,direction) = args.split(',')
    row = (row.to_i if /\A\d+\Z/.match(row))
    col = (col.to_i if /\A\d+\Z/.match(col))
    return [row, col, direction]
  end

end