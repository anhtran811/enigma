require 'date'
require './lib/generator'

RSpec.describe Generator do
  let!(:generator) {Generator.new}

  it 'exists' do
    expect(generator).to be_a(Generator)
  end

  it 'has letters to choose from' do
    expect(generator.letters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
  end

  it 'can test for todays date formatted by ddmmyy' do
    expected_date = Date.today.strftime('%d%m%y')
    expect(generator.date).to eq(expected_date)
  end
end