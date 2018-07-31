module Money
  class Dollar
    attr_reader :amount

    # @param [Integer] amount
    def initialize(amount)
      @amount = amount
    end

    # @param [Integer] multiplier
    def times(multiplier)
      @amount *= multiplier
    end
  end
end
