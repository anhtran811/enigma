require 'date'
require './lib/enigma'
require './lib/cipher'

RSpec.describe Enigma do
  let!(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrpyt a message with a key and date' do
    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(
      {
          encryption: 'keder ohulw',
          key: '02715',
          date: '040895'
        })
  end

  it 'can decrypt a message with a key and date' do
    expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(
      {
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      })
  end
 
  it 'can encrypt a message with a key (uses todays date)' do
    allow(enigma).to receive(:formatted_date).and_return('121122')

    expect(enigma.encrypt('heLlo woRld!', '02715')).to eq(
      {
        encryption: 'rmjdyhugatb!',
        key: '02715',
        date: '121122'
      })
  end

  it 'can decrypt a message with a key (uses todays date)' do
    allow(enigma).to receive(:formatted_date).and_return('121122')
 
    expect(enigma.decrypt('rmjdyhugatb', '02715')).to eq(
      {
        decryption: 'hello world',
        key: '02715',
        date: '121122'
      })
  end

  it 'can encrypt a message (generates random key and uses todays date)' do
    allow(enigma).to receive(:formatted_date).and_return('121122')
    allow(enigma).to receive(:generate_rand_num).and_return('08117')

    expect(enigma.encrypt('hello world')).to eq(
      {
        encryption: 'xmdfdhoigtw',
        key: '08117',
        date: '121122'
    })
  end
end