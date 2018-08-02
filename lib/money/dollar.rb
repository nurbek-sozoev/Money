class Money
  attr_reader :amount

  # @param [Integer] amount
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  # @param [Integer] amount
  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  # @param [Integer] amount
  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  # @param [Money] object
  def eql?(object)
    @amount == object.amount && @currency == object.currency
  end

  # @param [Integer] multiplier
  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  # @param [Money] addend
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

  # @param [Money] augend
  # @param [Money] addend
  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    Money.new(@augend.amount + @addend.amount, to)
  end
end
