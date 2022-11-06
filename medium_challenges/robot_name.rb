class Robot
  LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars
  NUMBERS = ('1'..'9').to_a

  @@robot_names = []

  attr_accessor :name

  def initialize
    @name = create_name
    @@robot_names << name
  end

  def reset
    @@robot_names.delete(name)
    self.name = create_name
    @@robot_names << name
  end

  private

  def create_name
    robot_name = ''

    loop do
      2.times { robot_name += LETTERS.sample }
      3.times { robot_name += NUMBERS.sample }

      break unless @@robot_names.include?(robot_name)
      robot_name = ''
    end

    robot_name
  end
end
