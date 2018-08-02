describe BaseMoney do
  it 'should test multiplication' do
    five = BaseMoney.dollar(5)
    expect(BaseMoney.dollar(10)).to eql(five.times(2))
    expect(BaseMoney.dollar(15)).to eql(five.times(3))
  end

  it 'should test franc multiplication' do
    five = BaseMoney.franc(5)
    expect(BaseMoney.franc(10)).to eql(five.times(2))
    expect(BaseMoney.franc(15)).to eql(five.times(3))
  end

  it 'should test equality' do
    expect(BaseMoney.dollar(5).eql?(BaseMoney.dollar(5))).to be_truthy
    expect(BaseMoney.dollar(5).eql?(BaseMoney.dollar(6))).to be_falsey
    expect(BaseMoney.franc(5).eql?(BaseMoney.franc(5))).to be_truthy
    expect(BaseMoney.franc(5).eql?(BaseMoney.franc(6))).to be_falsey
    expect(BaseMoney.franc(5).eql?(BaseMoney.dollar(5))).to be_falsey
  end

  it 'should test currency' do
    expect(BaseMoney.dollar(1).currency).to eql('USD')
    expect(BaseMoney.franc(1).currency).to eql('CHF')
  end

  it 'should test simple addition' do
    five = BaseMoney.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
    expect(BaseMoney.dollar(10)).to eql(reduced)
  end

  it 'should test plus returns sum' do
    five = BaseMoney.dollar(5)
    sum = five.plus(five)
    expect(five).to eql(sum.augend)
    expect(five).to eql(sum.addend)
  end

  it 'should reduce sum' do
    sum = Sum.new(BaseMoney.dollar(3), BaseMoney.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, 'USD')
    expect(BaseMoney.dollar(7)).to eql(result)
  end

  it 'should reduce money' do
    bank = Bank.new
    result = bank.reduce(BaseMoney.dollar(1), 'USD')
    expect(BaseMoney.dollar(1)).to eql(result)
  end

end
