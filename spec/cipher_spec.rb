require 'date'
require './lib/cipher'
require './lib/enigma'
require './lib/generator'
require './lib/shift'

RSpec.describe Cipher do
  let!(:enigma) {Enigma.new}
 
  it 'can create an encrypted string when given a key and date' do
    expect(enigma.encrypted_string('hello world', '02715', '040895')).to eq('keder ohulw')
    expect(enigma.encrypted_string('he!!o woRld', '02715', '040895')).to eq('ke!!gtzojeg')
    expect(enigma.encrypted_string('heLlo, woRld!', '02715', '040895')).to eq('keder, ohulw!')
  end

  it 'can create a decrypted string when given a key and date' do
    expect(enigma.decrypted_string('keder ohulw', '02715', '040895')).to eq('hello world')
    expect(enigma.decrypted_string('keDer ohUlw', '02715', '040895')).to eq('hello world')
    expect(enigma.decrypted_string('keder@ ohulw!', '02715', '040895')).to eq('hello@ world!')
    expect(enigma.decrypted_string('ke@er@ ohulw!', '02715', '040895')).to eq('he@my@xopaiw!')
  end
end