class Player

  def initialize(name)
    @name = name
    @position = 0
  end

  attr_reader(:name, :position)
  attr_writer(:name, :position)

  def position
    return @position
  end

  def move(num)
    @position += num
  end

end
