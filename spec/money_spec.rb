describe Money do
  it 'should test multiplication' do
    five = Money.dollar(5)
    expect(Money.dollar(10)).to eql(five.times(2))
    expect(Money.dollar(15)).to eql(five.times(3))
  end

  it 'should test franc multiplication' do
    five = Money.franc(5)
    expect(Money.franc(10)).to eql(five.times(2))
    expect(Money.franc(15)).to eql(five.times(3))
  end

  it 'should test equality' do
    expect(Money.dollar(5).eql?(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5).eql?(Money.dollar(6))).to be_falsey
    expect(Money.franc(5).eql?(Money.franc(5))).to be_truthy
    expect(Money.franc(5).eql?(Money.franc(6))).to be_falsey
    expect(Money.franc(5).eql?(Money.dollar(5))).to be_falsey
  end

  it 'should test currency' do
    expect(Money.dollar(1).currency).to eql('USD')
    expect(Money.franc(1).currency).to eql('CHF')
  end

  it 'should test simple addition' do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
    expect(Money.dollar(10)).to eql(reduced)
  end

  it 'should test plus returns sum' do
    five = Money.dollar(5)
    sum = five.plus(five)
    expect(five).to eql(sum.augend)
    expect(five).to eql(sum.addend)
  end

  it 'should reduce sum' do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, 'USD')
    expect(Money.dollar(7)).to eql(result)
  end

  it 'should reduce money' do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), 'USD')
    expect(Money.dollar(1)).to eql(result)
  end

  it 'should reduce money in different currency' do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(Money.franc(2), 'USD')
    expect(Money.dollar(1)).to eql(result)
  end

  it 'should test identity rate' do
    expect(Bank.new.rate('USD', 'USD')).to eql(1)
  end

  it 'should test mixed addition' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
    expect(Money.dollar(10)).to eql(result)
  end

  it 'should test sum plus money' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
    result = bank.reduce(sum, 'USD')
    expect(Money.dollar(15)).to eql(result)
  end
end
