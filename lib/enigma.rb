require 'date'
require './lib/generator'

class Enigma < Generator

  def encrypt(string, option_key = generate_keys, option_date = date)
    encryption_hash = {}
    encryption_hash[:encryption] = encrypted_string(string, option_key, option_date)
    encryption_hash[:key] = option_key
    encryption_hash[:date] = option_date
    encryption_hash
  end

  def decrypt(string, option_key, option_date = date)
    decryption_hash = {}
    decryption_hash[:decryption] = decrypted_string(string, option_key, option_date)
    decryption_hash[:key] = option_key
    decryption_hash[:date] = option_date
    decryption_hash
  end
end