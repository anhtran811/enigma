class EnigmaDefault
  attr_reader :letters

  def initialize
    @letters = letters
  end

  def letters
    set = ('a'..'z').to_a
    set.push(' ')
  end

  def formatted_date
    Date.today.strftime('%d%m%y')
  end
end