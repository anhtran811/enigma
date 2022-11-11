class Enigma
  attr_reader :numbers
              :charaters

  def initialize
    @numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    @characters = characters
  end

  def characters
    set = ('a'..'z').to_a
    set.push(' ')
  end

  # def split(string)
  #   string.split('')
  # end

  def generator
    @numbers.sample(5).join
  end
  
  def encrpyt
  end

  def decrypt
  end
end