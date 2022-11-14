class Generator
  attr_reader :letters

  def initialize
    @letters = letters
  end

  def letters
    set = ('a'..'z').to_a
    set.push(' ')
  end

  def generate_keys
    key = ''
    number = Random.new
    5.times do
      key += number.rand(0..9).to_s
    end
    key
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

  def date
    Date.today.strftime('%d%m%y')
  end
end