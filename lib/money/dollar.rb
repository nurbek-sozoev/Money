class BaseMoney
  attr_reader :amount

  # @param [Integer] amount
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  # @param [Integer] amount
  def self.dollar(amount)
    BaseMoney.new(amount, 'USD')
  end

  # @param [Integer] amount
  def self.franc(amount)
    BaseMoney.new(amount, 'CHF')
  end

  # @param [BaseMoney] object
  def eql?(object)
    @amount == object.amount && @currency == object.currency
  end

  # @param [Integer] multiplier
  def times(multiplier)
    BaseMoney.new(@amount * multiplier, @currency)
  end

  # @param [BaseMoney] addend
  def plus(addend)
    Sum.new(self, addend)
  end

  # @param [String] to
  def reduce(to)
    self
  end

  def currency
    @currency
  end

  def to_s
    "#{@amount} #{@currency}"
  end
end

class Bank
  # @param [Object] source
  # @param [String] to
  def reduce(source, to)
    source.reduce(to)
  end
end

class Sum
  attr_reader :augend, :addend

  # @param [BaseMoney] augend
  # @param [BaseMoney] addend
  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    BaseMoney.new(@augend.amount + @addend.amount, to)
  end
end
