# ruby ./lib/decrypt.rb encrypted.txt decrypted.txt generated_random_number generated_date_as_string

require './lib/enigma'
require 'date'

enigma = Enigma.new

encrypted_file = File.open(ARGV[0], 'r')
encrypted_message = encrypted_file.read
encrypted_file.close

decrypted_message = enigma.decrypt(encrypted_message.chomp, ARGV[2], ARGV[3])

decryption = File.open(ARGV[1], 'w')
decryption.write(decrypted_message[:decryption])
decryption.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"

