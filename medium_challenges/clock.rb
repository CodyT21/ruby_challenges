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
    "%02d:%02d" % [hours, minutes]
  end

  def +(num_minutes)
    num_hours, num_minutes = num_minutes.divmod(60)
    num_hours = num_hours % 24

    # add new minutes before hours
    if minutes + num_minutes > 60
      self.hours += hours == 23 ? 0 : 1
      self.minutes += num_minutes - 60
    else
      self.minutes += num_minutes
    end 

    if hours + num_hours > 24
      self.hours += num_hours - 24
    else
      self.hours += num_hours
    end
    
    self.class.at(hours, minutes)
  end

  def -(num_minutes)
    num_hours, num_minutes = num_minutes.divmod(60)
    num_hours = num_hours % 24

    # add new minutes before hours
    if num_minutes > minutes
      self.hours = hours == 0 ? 23 : hours - 1
      self.minutes = 60 - num_minutes + minutes
    else
      self.minutes -= num_minutes
    end 

    if num_hours > hours
      self.hours = 24 - (num_hours - hours) 
    else
      self.hours -= num_hours
    end
    
    self.class.at(hours, minutes)
  end

  def ==(other)
    self.hours == other.hours && self.minutes == other.minutes
  end
end