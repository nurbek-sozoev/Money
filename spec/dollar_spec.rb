describe Money::Dollar do

    it 'should test multiplication' do
    five = Money::Dollar.new(5)
    product = five.times(2)
    expect(product.amount).to eql(10)
    product = five.times(3)
    expect(product.amount).to eql(15)
  end
end
