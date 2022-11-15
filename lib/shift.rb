class Shift
  def initialize(rand_num, date)
    @keys = split_keys(rand_num)
    @offsets = generate_offset(date)
    @shift_hash = {}
  end

  def split_keys(rand_num)
    split_key_hash = {}
    keys = rand_num.split('') 
    split_key_hash[:A] = keys[0] + keys[1]
    split_key_hash[:B] = keys[1] + keys[2]
    split_key_hash[:C] = keys[2] + keys[3]
    split_key_hash[:D] = keys[3] + keys[4]
    split_key_hash.values
  end
  
  def generate_offset(date)
    last_four = ((date.to_i)**2).to_s[-4..-1].split('')
    last_four.map do |number|
      number.to_i
    end
  end

  def generate_shift
    @shift_hash[:A] = @keys[0].to_i + @offsets[0]
    @shift_hash[:B] = @keys[1].to_i + @offsets[1]
    @shift_hash[:C] = @keys[2].to_i + @offsets[2]
    @shift_hash[:D] = @keys[3].to_i + @offsets[3]
    @shift_hash
  end
end