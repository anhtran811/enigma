require 'date'
require './lib/enigma_default'

RSpec.describe EnigmaDefault do
  let!(:enigma_default) {EnigmaDefault.new}

  it 'exists' do
    expect(enigma_default).to be_a(EnigmaDefault)
  end

  it 'has letters to choose from' do
    expect(enigma_default.letters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
  end

  it 'can test for todays date formatted by ddmmyy' do
    expected_date = Date.today.strftime('%d%m%y')
    expect(enigma_default.formatted_date).to eq(expected_date)
  end

  # it 'can generate a random five digit key' do
#   key = generator.generate_keys.split('')
#   key.each do |number|
#     expect(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']).to include(number)
#   end
#   expect(key.count).to eq(5)
#   expect(generator.generate_keys.class).to eq(String)
# end
end