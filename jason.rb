require 'json'

one = [1,2,3,4,5]

one.to_json

puts "Hello world"

puts JSON.load(one)

