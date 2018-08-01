class BaseMoney
  # @param [Integer] amount
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  # @param [Integer] amount
  def self.dollar(amount)
    Dollar.new(amount, 'USD')
  end

  # @param [Integer] amount
  def self.franc(amount)
    Franc.new(amount, 'CHF')
  end

  # @param [BaseMoney] object
  def eql?(object)
    @amount == object.instance_variable_get("@amount") &&
      self.class.eql?(object.class)
  end

  def currency
    @currency
  end
end

class Dollar < BaseMoney
  # @param [Integer] multiplier
  def times(multiplier)
    BaseMoney.dollar(@amount * multiplier)
  end
end

class Franc < BaseMoney
  # @param [Integer] multiplier
  def times(multiplier)
    BaseMoney.franc(@amount * multiplier)
  end
end
