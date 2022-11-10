require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'has characters to choose from' do
    expect(enigma.characters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ''])
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