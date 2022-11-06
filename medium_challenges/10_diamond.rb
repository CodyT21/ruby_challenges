class Diamond
  LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  
  def self.make_diamond(letter)
    # - determine index of letter
    # - loop from 'A' to the input letter
    #    - at index, only print 'A' with spaces before and after
    #    - for all other letters, print spaces before and inbetween
    #       - number of spaces before/after is the index of letter - current letter index
    #       - number of spaces between is equal to 2 * current index of letter - 1
    # - repeat in reverse from the letter before input letter back to 'A'
    diamond = ''
    last_letter_index = LETTERS.index(letter)
    diamond_letters = LETTERS[0..last_letter_index]
      
    # create top half of the diamond including middle layer
    diamond_letters.chars.each_index do |index|
      diamond += self.make_line(diamond_letters, index, last_letter_index)
    end

    # create bottom half of the diamond excluding middle layer
    start_index = last_letter_index - 1
    start_index.downto(0) do |index|
      diamond += self.make_line(diamond_letters, index, last_letter_index)
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
      line += "#{' ' * num_spaces_before_after}\n"
    end
  end
end