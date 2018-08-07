require './lib/simulator.rb'

simulator = Simulator.new

puts "Hey I'm ready to follow the instructions!\n\n" +
    "Please enter your command:\n\n"

prompt = '> '
print prompt

while command = gets.chomp
  break if command == 'exit'
  if command == ''
    puts 'Empty command'
    print prompt
    next
  end
  begin
    output = simulator.execute_command(command)
  rescue StandardError => e
    puts "Invalid command: #{e}"
    print prompt
    next
  end
  puts output if output
  print prompt
end
