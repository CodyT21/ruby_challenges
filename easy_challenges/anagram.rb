class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(arr_of_words)
    # input - array of words
    # output - array of words that are anagrams of @word
    # rules
    #   - anagrams are case insensitive
    # algorithm
    #   - loop through each word in the input array
    #   - make a count of each unique character
    #   - compare counts to char counts in @word
    #   - if all counts match, append word to output array

    anagrams = []
    arr_of_words.each do |w|
      next if w.downcase == word.downcase
      counts = count_letters(w)
      if counts.keys.all? { |char| word.downcase.count(char) == counts[char] }
        anagrams << w unless w.size != word.size
      end
    end
    anagrams
  end

  private

  def count_letters(word)
    counts = Hash.new(0)
    word.each_char do |char|
      counts[char.downcase] += 1
    end
    counts
  end
end
