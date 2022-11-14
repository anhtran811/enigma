require 'date'
require './lib/generator'
require './lib/shift'


module Cipher

  def encrypted_string(string, option_key = generate_keys, option_date = date)
    given_key = split_keys(option_key)
    given_date = generate_offset(option_date)
    
    shift = Shift.new(given_key, given_date)
    shift_numbers = shift.shift.values
    shifted_character_collector = '' 
    string.downcase.split('').each do |character|
      if !letters.include?(character)
        shifted_character_collector += character
      else
        value_shift = letters.find_index(character) + shift_numbers.first
        while value_shift >= letters.length
          value_shift -= letters.length
        end
        the_shift = letters[value_shift]
        shifted_character_collector += the_shift 
        shift_numbers.rotate!
      end
    end
    shifted_character_collector
  end

  def decrypted_string(string, option_key, option_date = date)
    given_key = split_keys(option_key)
    given_date = generate_offset(option_date)

    shift = Shift.new(given_key, given_date)
    shift_numbers = shift.shift.values
    shifted_character_collector = ''
    string.downcase.split('').each do |character|
      if !letters.include?(character)
        shifted_character_collector += character
      else
        value_shift = letters.find_index(character) - shift_numbers.first
        while value_shift < 0
          value_shift += letters.length
        end
        the_shift = letters[value_shift]
        shifted_character_collector += the_shift 
        shift_numbers.rotate!
      end
    end
    shifted_character_collector
  end 
end