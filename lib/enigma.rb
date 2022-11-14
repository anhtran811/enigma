require 'date'
require './lib/enigma_default'
require './lib/cipher'
require './lib/shift'

class Enigma < EnigmaDefault
  include Cipher

  def encrypt(string, rand_num = generate_rand_num, date = formatted_date)
    encryption_hash = {}
    encryption_hash[:encryption] = encrypted_string(string, rand_num, date)
    encryption_hash[:key] = rand_num
    encryption_hash[:date] = date
    encryption_hash
  end

  def decrypt(string, rand_num, date = formatted_date)
    decryption_hash = {}
    decryption_hash[:decryption] = decrypted_string(string, rand_num, date)
    decryption_hash[:key] = rand_num
    decryption_hash[:date] = date
    decryption_hash
  end
end