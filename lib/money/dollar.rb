module Money
  class Dollar
    attr_reader :amount

    # @param [Integer] amount
    def initialize(amount)
      @amount = amount
    end

    # @param [Integer] multiplier
    def times(multiplier)
      Dollar.new(@amount * multiplier)
    end

    # @param [Dollar] object
    def equal?(object)
      @amount == object.amount
    end
  end
end
