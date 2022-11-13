require 'date'
require './lib/generator'

RSpec.describe Generator do
  let!(:generator) {Generator.new}

  it 'exists' do
    expect(generator).to be_a(Generator)
  end

  it 'has characters to choose from' do
    expect(generator.characters).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' '])
  end

  it 'can generate a random five digit key' do
    key = generator.generate_keys.split('')
    key.each do |number|
      expect(generator.numbers).to include(number)
    end
    expect(key.count).to eq(5)
    expect(generator.generate_keys.class).to eq(String)
  end

  it 'can split the five digit key' do
    allow(generator).to receive(:generate_keys).and_return('02715')

    expect(generator.split_keys('02715')).to eq(['02', '27', '71', '15'])
  end

  it 'can generate an offset from a given date' do
    expect(generator.generate_offset('040895')).to eq([1, 0, 2, 5])
  end

  it 'can create a shift' do
    expect(generator.shift(['02', '27', '71', '15'], [1, 0, 2, 5])).to eq({
      A: 3,
      B: 27,
      C: 73,
      D: 20
    })
  end

  it 'can create an encrypted string when given a key and date' do
    expect(generator.encrypted_string('hello world', '02715', '040895')).to eq('keder ohulw')
    expect(generator.encrypted_string('hello woRld', '02715', '040895')).to eq('keder ohulw')
    expect(generator.encrypted_string('heLlo, woRld!', '02715', '040895')).to eq('keder, ohulw!')
  end

  # it 'can encrpyt a message with a key and date' do
  #   expect(generator.encrypt('hello world', '02715', '040895')).to eq(
  #     {
  #         encryption: 'keder ohulw',
  #         key: '02715',
  #         date: '040895'
  #       })
  # end

  it 'can create a decrypted string when given a key and date' do
    expect(generator.decrypted_string('keder ohulw', '02715', '040895')).to eq('hello world')
    expect(generator.decrypted_string('keDer ohUlw', '02715', '040895')).to eq('hello world')
    expect(generator.decrypted_string('keder@ ohulw!', '02715', '040895')).to eq('hello@ world!')
  end

  # it 'can decrypt a message with a key and date' do
  #   expect(generator.decrypt('keder ohulw', '02715', '040895')).to eq(
  #     {
  #       decryption: 'hello world',
  #       key: '02715',
  #       date: '040895'
  #     })
  # end

  # it 'can test for todays date formatted by ddmmyy' do
  #   expected_date = Date.today.strftime('%d%m%y')
  #   expect(generator.date).to eq(expected_date)
  # end
 
  # it 'can encrypt a message with a key (uses todays date)' do
  #   allow(generator).to receive(:date).and_return('121122')

  #   expect(generator.encrypt('heLlo woRld!', '02715')).to eq(
  #     {
  #       encryption: 'rmjdyhugatb!',
  #       key: '02715',
  #       date: '121122'
  #     })
  # end

  # it 'can decrypt a message with a key (uses todays date)' do
  #   allow(generator).to receive(:date).and_return('121122')
 
  #   expect(generator.decrypt('rmjdyhugatb', '02715')).to eq(
  #     {
  #       decryption: 'hello world',
  #       key: '02715',
  #       date: '121122'
  #     })
  # end

  # it 'can encrypt a message (generates random key and uses todays date)' do
  #   allow(generator).to receive(:date).and_return('121122')
  #   allow(generator).to receive(:generate_keys).and_return('08117')

  #   expect(generator.encrypt('hello world')).to eq(
  #     {
  #       encryption: 'xmdfdhoigtw',
  #       key: '08117',
  #       date: '121122'
  #   })
  # end
end