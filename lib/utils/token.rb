class Token
  attr_reader :value

  def initialize(value = nil)
    if value.nil?

      letters = []

      random = Random.new

      16.times do
        letters << (random.rand(1..26) + 64).chr
      end

      @value = letters.join
    else
      @value = value
    end
  end

  def to_s
    self.value
  end
end
