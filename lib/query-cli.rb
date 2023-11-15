puts "1 - Search for a client's name"
puts "2 - Find clients with the same email"
puts "Select action: "
action = gets.to_i

puts "Action: #{action}"
if action == 1
  puts "Search for: "
  search = gets.chomp.downcase
  result = Client::Query.new.search(search)
elsif action == 2
  result = Client::Query.new.find_duplicate
else
  puts "Incorrect action."
end

puts result
