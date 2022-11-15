class EnigmaDefault
  attr_reader :letters

  def initialize
    @letters = letters
  end

  def letters
    set = ('a'..'z').to_a
    set.push(' ')
  end

  def generate_rand_num
    rand_num = ''
    number = Random.new
    5.times do
      rand_num += number.rand(0..9).to_s
    end
    rand_num
  end

  def formatted_date
    Date.today.strftime('%d%m%y')
  end
end