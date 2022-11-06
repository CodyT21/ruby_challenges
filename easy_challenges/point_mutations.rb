class DNA
  attr_reader :dna

  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(other_dna)
    # input: str
    # output: int
    # rules
    #   - use shorter of string lengths if larger is provided to method call
    #   - return number of differing bases in provided dna strands
    # algorithm
    #   - loops through each index of smaller string
    #   - at each index compare bases
    #   - if differing bases, add one to count
    #   - return count after loop execution

    last_index = [dna.size, other_dna.size].min
    differing_bases = 0
    (0...last_index).each do |index|
      differing_bases += 1 if dna[index] != other_dna[index]
    end

    differing_bases
  end
end
