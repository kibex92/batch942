require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username

puts "Which user are you looking for?"
nickname = gets.chomp

url = "https://api.github.com/users/#{nickname}"
serialized_user = URI.open(url).read
user = JSON.parse(serialized_user)

puts "#{user["name"]} - #{user["bio"]}"
