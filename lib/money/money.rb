class Money
  attr_reader :amount, :currency

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
    amount == object.amount && currency == object.currency
  end

  # @param [Integer] multiplier
  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  # @param [Money] addend
  def plus(addend)
    Sum.new(self, addend)
  end

  # @param [String] to
  # @param [Bank] bank
  def reduce(bank, to)
    rate = bank.rate(currency, to)
    Money.new(amount / rate, to)
  end

  def to_s
    "#{amount} #{currency}"
  end
end

class Bank
  def initialize
    @rates = {}
  end

  # @param [Object] source
  # @param [String] to
  def reduce(source, to)
    source.reduce(self, to)
  end

  # @param [String] from
  # @param [String] to
  # @param [Integer] amount
  def add_rate(from, to, amount)
    @rates[[from, to]] = amount
  end

  # @param [String] from
  # @param [String] to
  def rate(from, to)
    return 1 if from == to
    @rates.fetch([from, to])
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

  # @param [Bank] bank
  # @param [String] to
  def reduce(bank, to)
    amount = augend.reduce(bank, to).amount + addend.reduce(bank, to).amount
    Money.new(amount, to)
  end

  # @param [Money] addend
  def plus(addend)
    Sum.new(self, addend)
  end
end
