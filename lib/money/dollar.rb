class BaseMoney
  # @param [Integer] amount
  def initialize(amount)
    @amount = amount
  end

  # @param [Integer] amount
  def self.dollar(amount)
    Dollar.new(amount)
  end

  # @param [Integer] amount
  def self.franc(amount)
    Franc.new(amount)
  end

  # @param [BaseMoney] object
  def eql?(object)
    @amount == object.instance_variable_get("@amount") &&
      self.class.eql?(object.class)
  end
end

class Dollar < BaseMoney
  # @param [Integer] multiplier
  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end
end

class Franc < BaseMoney
  # @param [Integer] multiplier
  def times(multiplier)
    Franc.new(@amount * multiplier)
  end
end
