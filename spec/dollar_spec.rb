describe Money::Dollar do

  it 'should test multiplication' do
    five = Money::Dollar.new(5)
    five.times(2)
    expect(10).to eql(five.amount)
  end
end
