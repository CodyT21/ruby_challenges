class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes=0)
    @hours = hours == 24 ? 0 : hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def to_s
    format("%02d:%02d", hours, minutes)
  end

  def +(num_minutes)
    num_hours, num_minutes = calc_num_minutes_and_hours(num_minutes)

    self.hours += 1 if minutes + num_minutes > 60
    self.hours += num_hours
    self.hours %= 24 if hours > 24
    self.minutes = (minutes + num_minutes) % 60

    self.class.at(hours, minutes)
  end

  def -(num_minutes)
    num_hours, num_minutes = calc_num_minutes_and_hours(num_minutes)

    if num_minutes > minutes
      self.hours -= 1
      self.minutes = 60 - (num_minutes - minutes)
    else
      self.minutes -= num_minutes
    end
    self.hours -= num_hours
    self.hours = 24 + hours if hours < 0

    self.class.at(hours, minutes)
  end

  def ==(other)
    self.hours == other.hours && self.minutes == other.minutes
  end

  private

  def calc_num_minutes_and_hours(num_minutes)
    num_hours, num_minutes = num_minutes.divmod(60)
    num_hours = num_hours % 24
    [num_hours, num_minutes]
  end
end
