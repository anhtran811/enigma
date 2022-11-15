# ruby ./lib/encrypt.rb message.txt encrypted.txt
# ruby ./lib/encrypt.rb message.txt encrypted.txt optional_random_number optional_date_as_string

require './lib/enigma'
require 'date'

enigma = Enigma.new

encryption = File.open(ARGV[0], 'r')
message = encryption.read
encryption.close

encrypted_message = if ARGV[2] && ARGV[3]
                      enigma.encrypt(message.chomp, ARGV[2], ARGV[3])
                    else
                      enigma.encrypt(message.chomp)
                    end

encryption = File.open(ARGV[1], 'w')
encryption.write(encrypted_message[:encryption])
encryption.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"