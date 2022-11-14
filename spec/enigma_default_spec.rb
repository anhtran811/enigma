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
end