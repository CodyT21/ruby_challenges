class Verse
  attr_reader :bottle

  def initialize(bottle)
    @bottle = bottle
  end

  def lyrics
    case bottle
    when 0 then verse_0
    when 1 then verse_1
    when 2 then verse_2
    else
      verse_3_to_99(bottle)
    end
  end

  private

  def verse_0
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def verse_1
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse_2
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse_3_to_99(bottle)
    "#{bottle} bottles of beer on the wall, #{bottle} bottles of beer.\n" \
    "Take one down and pass it around, #{bottle - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(bottle)
    Verse.new(bottle).lyrics
  end

  def self.verses(start_bottle, last_bottle)
    output = []
    start_bottle.downto(last_bottle).each { |bottle| output << verse(bottle) }
    output.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
