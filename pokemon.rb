require 'rest-client'
require 'json'

pikachu = RestClient.get("https://pokeapi.co/api/v2/pokemon/pikachu/")
pikachu = JSON.parse(pikachu)

puts pikachu["name"]
stats =  pikachu["stats"]


stats.each do |value|
  value.each do |key, value|
    if key == "stat"
      value.each do |key, value|
        puts "#{key} : #{value}"
      end
    else
      puts "#{key} : #{value}"
    end
  end
end
