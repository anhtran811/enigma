require 'date'

module Cipher
  def encrypted_string(message, rand_num, date)
    shift = Shift.new(rand_num, date)
    shift_numbers = shift.generate_shift.values
    shifted_character_collector = '' 
    message.downcase.split('').each do |character|
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

  def decrypted_string(message, rand_num, date)
    shift = Shift.new(rand_num, date)
    shift_numbers = shift.generate_shift.values
    shifted_character_collector = ''
    message.downcase.split('').each do |character|
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