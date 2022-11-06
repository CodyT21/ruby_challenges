class Diamond
  LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  def self.make_diamond(letter)
    diamond = ''
    last_letter_index = LETTERS.index(letter)
    diamond_letters = LETTERS[0..last_letter_index]

    # create top half, then bottom half of diamond
    diamond_letters.chars.each_index do |index|
      diamond += make_line(diamond_letters, index, last_letter_index)
    end

    (last_letter_index - 1).downto(0) do |index|
      diamond += make_line(diamond_letters, index, last_letter_index)
    end
    diamond
  end

  class << self
    private

    def make_line(letters, index, last_letter_index)
      line = ""
      num_spaces_before_after = last_letter_index - index
      num_spaces_between = (2 * index) - 1

      line += ' ' * num_spaces_before_after
      line += letters[index]
      line += "#{' ' * num_spaces_between}#{letters[index]}" unless index == 0
      line + "#{' ' * num_spaces_before_after}\n"
    end
  end
end
