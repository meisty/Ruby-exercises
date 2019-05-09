require 'rest-client'
require 'json'
require 'pp'

access_token = RestClient.post "https://accounts.spotify.com/api/token", {grant_type: "client_credentials"},{Authorization: ""}
access_token = JSON.parse(access_token)
my_playlists = RestClient.get "https://api.spotify.com/v1/users/21st2yfoqz6jzxvu7iatjxzqq/playlists", {Authorization: "Bearer #{access_token["access_token"]}"}
my_playlists = JSON.parse(my_playlists)
items = my_playlists["items"]

items.each do |item|
  item.each do |key, value|
    if key == "name"
      puts value
    end
    if key == "tracks"
      puts "Total Tracks in Playlist #{value['total']}"
      puts "\n"
    end
  end
end


#puts my_playists
