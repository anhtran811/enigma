require './lib/shift'

RSpec.describe Shift do
  let!(:shift) {Shift.new('02715', '040895')}

  it 'exists' do
    expect(shift).to be_a(Shift)
  end

  it 'can create a shift' do
    expect(shift.generate_shift).to eq({
      A: 3,
      B: 27,
      C: 73,
      D: 20
    })
  end

  it 'can split the five digit key' do
    allow(shift).to receive(:generate_shift).and_return('02715')

    expect(shift.split_keys('02715')).to eq(['02', '27', '71', '15'])
  end

  it 'can generate an offset from a given date' do
    expect(shift.generate_offset('040895')).to eq([1, 0, 2, 5])
  end
end