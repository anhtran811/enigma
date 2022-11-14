# require './lib/shift'

# RSpec.describe Shift do


# it 'can create a shift' do
#   expect(generator.shift(['02', '27', '71', '15'], [1, 0, 2, 5])).to eq({
#     A: 3,
#     B: 27,
#     C: 73,
#     D: 20
#   })
# end

# it 'can generate a random five digit key' do
#   key = generator.generate_keys.split('')
#   key.each do |number|
#     expect(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']).to include(number)
#   end
#   expect(key.count).to eq(5)
#   expect(generator.generate_keys.class).to eq(String)
# end

# it 'can split the five digit key' do
#   allow(generator).to receive(:generate_keys).and_return('02715')

#   expect(generator.split_keys('02715')).to eq(['02', '27', '71', '15'])
# end

# it 'can generate an offset from a given date' do
#   expect(generator.generate_offset('040895')).to eq([1, 0, 2, 5])
# end