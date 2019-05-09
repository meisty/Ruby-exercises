require 'rest-client'
require 'base64'
require 'json'

class Auth
  attr_reader :url, :enc
  attr_accessor :credentials

  def initialize(url, credentials)
    @url = url
    @credentials = credentials
  end

  def parse_JSON
    post = RestClient.post url, credentials
    my_hash = JSON.parse(post)
    my_hash
  rescue RestClient::Exception
    "Error occurred"
  end

  def encode64
    my_hash = parse_JSON
    auth = my_hash['userId'].to_s + ':' + my_hash['crossCheck'].to_s
    enc = Base64.encode64(auth)
    enc = "Basic " + enc.to_s
    enc
  end

end
