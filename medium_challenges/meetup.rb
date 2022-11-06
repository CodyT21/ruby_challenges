require 'date'

class Meetup
  # methods
  # initialize 
  #   - inputs
  #     - month number (int) 
  #     - year (int)
  # day
  #   - inputs
  #     - weekday
  #       - case insensitive
  #     - meeting day descriptor
  #       - one of first, second, third, fourth, fifith, last, or teenth
  #       - case insenstive
  #   - output
  #     - Date object of the meeting date

  attr_reader :month, :year

  def initialize(year, month)
    @month = month
    @year = year
  end

  def day(weekday, descriptor)
    # if last is descriptor
    #   - last day - 6 to last day
    # if first - fifth is descriptor
    #   - segment out month
    #     - first: 1 - 7
    #     - second: 8 - 14
    #     - third: 15 - 21
    #     - fourth: 22 - 28
    #     - fifth: 29 - 31 (maybe)
    # if teenth is descriptor
    #   - date range is 13 - 19
    case descriptor.downcase
    when 'first' then first(weekday)
    when 'second' then second(weekday)
    when 'third' then third(weekday)
    when 'fourth' then fourth(weekday)
    when 'fifth' then fifth(weekday)
    when 'last' then last(weekday)
    when 'teenth' then teenth(weekday)
    end
  end

  private

  def date_range_to_dates(start, last)
    (start..last).to_a.map do |day|
      Date.civil(year, month, day)
    end
  end

  def select_date(weekday, dates)
    dates.select do |date|
      date.send("#{weekday.downcase}?")
    end.first
  end

  def first(weekday)
    dates = date_range_to_dates(1, 7)
    select_date(weekday, dates)
  end

  def second(weekday)
    dates = date_range_to_dates(8, 14)
    select_date(weekday, dates)
  end

  def third(weekday)
    dates = date_range_to_dates(15, 21)
    select_date(weekday, dates)
  end

  def fourth(weekday)
    dates = date_range_to_dates(22, 28)
    select_date(weekday, dates)
  end

  def fifth(weekday)
    dates = []
    (29..31).each do |day|
      dates << Date.civil(year, month, day) unless day > Date.civil(year, month, -1).day
    end
    select_date(weekday, dates)
  end

  def last(weekday)
    dates = date_range_to_dates(-7, -1)
    select_date(weekday, dates)
  end

  def teenth(weekday)
    dates = date_range_to_dates(13, 19)
    select_date(weekday, dates)
  end
end