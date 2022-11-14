class EnigmaDefault
  attr_reader :letters

  def initialize
    @letters = letters
  end

  def letters
    set = ('a'..'z').to_a
    set.push(' ')
  end

  def date
    Date.today.strftime('%d%m%y')
  end
end