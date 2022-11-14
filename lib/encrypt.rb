require './lib/enigma'
require 'date'

enigma = Enigma.new

encryption = File.open(ARGV[0], 'r')
message = encryption.read
encryption.close

encrypted_message = enigma.encrypt(message.chomp, '02715')

encryption = File.open(ARGV[1], 'w')
encryption.write(encrypted_message[:encryption])
encryption.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"

