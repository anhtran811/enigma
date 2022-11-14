class Generator

  attr_reader :numbers
              :letters

  def initialize
    @numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    @letters = letters
  end

  def letters
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
    generate_keys.split('')
    keys = key.split('')
    split_key_hash[:A] = keys[0] + keys[1]
    split_key_hash[:B] = keys[1] + keys[2]
    split_key_hash[:C] = keys[2] + keys[3]
    split_key_hash[:D] = keys[3] + keys[4]
    split_key_hash.values
  end

  def generate_offset(date)
    date_squared_last_four_numbers = ((date.to_i)**2).to_s[-4..-1]
    offsets = date_squared_last_four_numbers.split('').map do |number|
      number.to_i
    end
    offsets
  end

  def shift(keys, offsets)
    shift_hash = {}
    shift_hash[:A] = keys[0].to_i + offsets[0]
    shift_hash[:B] = keys[1].to_i + offsets[1]
    shift_hash[:C] = keys[2].to_i + offsets[2]
    shift_hash[:D] = keys[3].to_i + offsets[3]
    shift_hash
  end
  
  def date
    Date.today.strftime('%d%m%y')
  end

end