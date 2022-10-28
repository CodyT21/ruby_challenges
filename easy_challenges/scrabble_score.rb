class Scrabble
    LETTER_VALUES = {
        'aeioulnrst' => 1,
        'dg' => 2,
        'bcmp' => 3,
        'fhvwy' => 4,
        'k' => 5,
        'jx' => 8,
        'qz' => 10
    }

    attr_reader :word

    def initialize(word)
        @word = word ? word.downcase : '' 
    end

    def score
        total = 0
        word.each_char do |char|
            LETTER_VALUES.each do |letter_key, value|
                total += value if letter_key.include?(char)
            end
        end

        total
    end

    def self.score(word)
        self.new(word).score
    end
end
