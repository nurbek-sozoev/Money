module Money
  class Dollar
    # @param [Integer] amount
    def initialize(amount)
      @amount = amount
    end

    # @param [Integer] multiplier
    def times(multiplier)
      Dollar.new(@amount * multiplier)
    end

    # @param [Dollar] object
    def eql?(object)
      @amount == object.instance_variable_get("@amount")
    end
  end

  class Franc
    # @param [Integer] amount
    def initialize(amount)
      @amount = amount
    end

    # @param [Integer] multiplier
    def times(multiplier)
      Franc.new(@amount * multiplier)
    end

    # @param [Franc] object
    def eql?(object)
      @amount == object.instance_variable_get("@amount")
    end
  end
end
