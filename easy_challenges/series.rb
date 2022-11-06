class Series
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def slices(segment_length)
    raise ArgumentError if segment_length > sequence.size

    sliced_array = []
    seq_array = sequence.split('').map(&:to_i)
    last_index = sequence.size - segment_length

    0.upto(last_index) do |index|
      sliced_array << seq_array[index...(index + segment_length)]
    end

    sliced_array
  end
end
