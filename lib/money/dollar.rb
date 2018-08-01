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
      @currency == object.currency
  end

  # @param [Integer] multiplier
  def times(multiplier)
    BaseMoney.new(@amount * multiplier, @currency)
  end

  def currency
    @currency
  end

  def to_s
    "#{@amount} #{@currency}"
  end
end

class Dollar < BaseMoney
end

class Franc < BaseMoney
end
