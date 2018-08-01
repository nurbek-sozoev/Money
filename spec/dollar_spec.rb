describe Money::Dollar do

  it 'should test multiplication' do
    five = Money::Dollar.new(5)
    expect(Money::Dollar.new(10)).to eql(five.times(2))
    expect(Money::Dollar.new(15)).to eql(five.times(3))
    expect(Money::Dollar.new(10)).not_to eql(five.times(3))
  end

  it 'should test equality' do
    expect(Money::Dollar.new(5).eql?(Money::Dollar.new(5))).to be_truthy
    expect(Money::Dollar.new(5).eql?(Money::Dollar.new(6))).to be_falsey
  end
end
