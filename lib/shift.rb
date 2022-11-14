class Shift
  def initialize(rand_num, date)
    @keys = split_keys(rand_num)
    @offsets = generate_offset(date)
    @shift_hash = {}
  end

  def generate_shift
    @shift_hash[:A] = @keys[0].to_i + @offsets[0]
    @shift_hash[:B] = @keys[1].to_i + @offsets[1]
    @shift_hash[:C] = @keys[2].to_i + @offsets[2]
    @shift_hash[:D] = @keys[3].to_i + @offsets[3]
    @shift_hash
  end

  def generate_offset(date)
    date_squared_last_four_numbers = ((date.to_i)**2).to_s[-4..-1]
    offsets = date_squared_last_four_numbers.split('').map do |number|
      number.to_i
    end
    offsets
  end

  def split_keys(rand_num)
    split_key_hash = {}
    generate_rand_num.split('') #review this
    keys = rand_num.split('') #review this
    split_key_hash[:A] = keys[0] + keys[1]
    split_key_hash[:B] = keys[1] + keys[2]
    split_key_hash[:C] = keys[2] + keys[3]
    split_key_hash[:D] = keys[3] + keys[4]
    split_key_hash.values
  end

   def generate_rand_num
    rand_num = ''
    number = Random.new
    5.times do
      rand_num += number.rand(0..9).to_s
    end
    rand_num
  end

end