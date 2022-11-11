require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'has characters to choose from' do
    expect(enigma.characters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
  end

  it 'can generate a random five digit key' do
    key = enigma.generate_keys.split('')
    key.each do |number|
      expect(enigma.numbers).to include(number)
    end
    expect(key.count).to eq(5)
    expect(enigma.generate_keys.class).to eq(String)
  end

  xit 'can split the five digit key' do
  end

  it 'can create an offset from a date' do
    expect(enigma.generate_offset("040895")).to eq([1, 0, 2, 5])
  end

  xit 'can encrpyt a message with a key and date' do
    expect(enigma.encrypt('hello world', '02715', '040895')).to be(
      {
          encryption: 'keder ohulw',
          key: '02715',
          date: '040895'
        })
  end

  xit 'can decrypt a message with a key and date' do
    expect(enigma.decrypt('keder ohulw', '02715', '040895')).to be(
      {
          decryption: 'hello world',
          key: '02715',
          date: '040895'
        })
  end

  xit 'can encrypt a message with a key (uses todays date)' do
    expect(enigma.encrypt('hello world', '02715')).to eq({})
  end

  xit 'can decrypt a message with a key (uses todays date)' do
    expect(enigma.decrypt(encrypted[:encryption], '02715')).to eq({})
  end

  xit 'can encrypt a message (generates random key and uses todays date)' do
    expect(enigma.encrypt('hello world')).to eq({})
  end
end