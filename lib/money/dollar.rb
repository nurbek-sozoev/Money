module Money

  class Money
    # @param [Integer] amount
    def initialize(amount)
      @amount = amount
    end

    # @param [Money] object
    def eql?(object)
      @amount == object.instance_variable_get("@amount") &&
        self.class.eql?(object.class)
    end
  end

  class Dollar < Money
    # @param [Integer] multiplier
    def times(multiplier)
      Dollar.new(@amount * multiplier)
    end
  end

  class Franc < Money
    # @param [Integer] multiplier
    def times(multiplier)
      Franc.new(@amount * multiplier)
    end
  end
end
