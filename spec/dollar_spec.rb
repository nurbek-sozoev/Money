describe Money::Dollar do

  it 'should test multiplication' do
    five = Money::Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eql(10)
    product = five.times(3)
    expect(product.amount).to eql(15)
  end

  it 'should test equality' do
    expect(Money::Dollar.new(5).equal?(Money::Dollar.new(5))).to be_truthy
    expect(Money::Dollar.new(5).equal?(Money::Dollar.new(6))).to be_falsey
  end
end
