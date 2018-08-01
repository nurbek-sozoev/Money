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
end
