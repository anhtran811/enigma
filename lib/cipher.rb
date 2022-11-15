require 'date'
require './lib/shift'

module Cipher
  def encrypted_string(message, rand_num, date)
    shift = Shift.new(rand_num, date)
    shift_numbers = shift.generate_shift.values
    shifted_character_collector = '' 
    message.downcase.split('').each do |character|
      if !letters.include?(character)
        shifted_character_collector += character
      else
        shift_value = letters.find_index(character) + shift_numbers.first
        while shift_value >= letters.length
          shift_value -= letters.length
        end
        the_shift = letters[shift_value]
        shifted_character_collector += the_shift 
        shift_numbers.rotate!
      end
    end
    shifted_character_collector
  end

  def decrypted_string(message, rand_num, date)
    shift = Shift.new(rand_num, date)
    shift_numbers = shift.generate_shift.values
    shifted_character_collector = ''
    message.downcase.split('').each do |character|
      if !letters.include?(character)
        shifted_character_collector += character
      else
        shift_value = letters.find_index(character) - shift_numbers.first
        while shift_value < 0
          shift_value += letters.length
        end
        the_shift = letters[shift_value]
        shifted_character_collector += the_shift 
        shift_numbers.rotate!
      end
    end
    shifted_character_collector
  end 
end