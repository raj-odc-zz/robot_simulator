class Robot

  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  TABLE_SIZE = 5

  attr_accessor :direction

  def initialize
    @pos_x = 0
    @pos_y = 0
    @direction = DIRECTIONS[0]
  end

  def rotate_left
    index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[index - 1]
  end

  def rotate_right
    index = DIRECTIONS.index(@direction)
    @direction = index >= DIRECTIONS.length-1 ? DIRECTIONS[0] : DIRECTIONS[index + 1]
  end

  def move_forward
    case @direction
    when 'NORTH'
        set_position(@pos_x, @pos_y + 1)
    when 'EAST'
        set_position(@pos_x + 1, @pos_y)
    when 'SOUTH'
        set_position(@pos_x, @pos_y - 1)
    when 'WEST'
        set_position(@pos_x - 1, @pos_y)
    end
  end

  def set_direction(direction=DIRECTIONS[0])
    if !DIRECTIONS.include? direction
      raise StandardError, direction + ' is an invalid direction'
    end
    @direction = direction
  end

  def get_position
    @pos_x.to_s + ',' + @pos_y.to_s
  end

  def set_position(x,y)
    if (0...TABLE_SIZE).include?(x) && (0...TABLE_SIZE).include?(y) 
      @pos_x = x
      @pos_y = y
    else 
      raise 'Cannot move to position'
    end
  end

end