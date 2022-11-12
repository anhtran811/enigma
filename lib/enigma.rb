require 'date'

class Enigma
  attr_reader :numbers
              :characters

  def initialize
    @numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    @characters = characters
  end

  def characters
    set = ('a'..'z').to_a
    set.push(' ')
  end

  def generate_keys
    # regex? -> look at number set
    # or range
    # or rand
    @numbers.sample(5).join
  end
  
  def split_keys(key)
    split_key_hash = {}
    # generate_keys.split('')
    keys = key.split('')
    split_key_hash[:A] = keys[0] + keys[1]
    split_key_hash[:B] = keys[1] + keys[2]
    split_key_hash[:C] = keys[2] + keys[3]
    split_key_hash[:D] = keys[3] + keys[4]
    split_key_hash.values
    #returns strings of values
  end

  def generate_offset(date)
    date_squared_last_four_numbers = ((date.to_i)**2).to_s[-4..-1]
    offsets = date_squared_last_four_numbers.split('').map do |number|
      number.to_i
    end
    offsets
    #returns integers
  end

  def shift(keys, offsets)
    shift_hash = {}
    shift_hash[:A] = keys[0].to_i + offsets[0]
    shift_hash[:B] = keys[1].to_i + offsets[1]
    shift_hash[:C] = keys[2].to_i + offsets[2]
    shift_hash[:D] = keys[3].to_i + offsets[3]
    shift_hash
    #returns hash with integers
  end

  def encrypted_string(string, option_key = generate_keys, option_date = date)
    given_key = split_keys(option_key)
    given_date = generate_offset(option_date)
    
    shift_numbers = shift(given_key, given_date).values 
    shifted_letter_collector = ''
    string.downcase.split('').each do |letter|
      value_shift = characters.find_index(letter) + shift_numbers.first
      while value_shift >= characters.length
        value_shift -= characters.length
      end
      the_shift = characters[value_shift]
      shifted_letter_collector += the_shift 
      shift_numbers.rotate!
    end
    shifted_letter_collector
  end

  def encrypt(string, option_key = generate_keys, option_date = date)
    encryption_hash = {}
  
    encryption_hash[:encryption] = encrypted_string(string, option_key, option_date)
    encryption_hash[:key] = option_key
    encryption_hash[:date] = option_date

    encryption_hash
  end

  def decrypted_string(string, option_key, option_date = date)
    given_key = split_keys(option_key)
    given_date = generate_offset(option_date)

    shift_numbers = shift(given_key, given_date).values 
    shifted_letter_collector = ''
    string.downcase.split('').each do |letter|
      value_shift = characters.find_index(letter) - shift_numbers.first
      while value_shift < 0
        value_shift += characters.length
      end
      the_shift = characters[value_shift]
    
      shifted_letter_collector += the_shift 
      shift_numbers.rotate!
    end
    shifted_letter_collector
  end

  def decrypt(string, option_key, option_date = date)
    decryption_hash = {}
    decryption_hash[:decryption] = decrypted_string(string, option_key, option_date)
    decryption_hash[:key] = option_key
    decryption_hash[:date] = option_date
    decryption_hash
  end

  def date
    Date.today.strftime('%d%m%y')
  end
end