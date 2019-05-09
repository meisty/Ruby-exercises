require 'minitest/autorun'
require './player'

class AuthTest < Minitest::Test

  attr_accessor :player

  def setup
    @player = Player.new('url', {LoginCredential: "username", Password: "password"})
  end

  def test_player_auth
    assert !player.player_auth.nil?
  end

  def test_site_is_up
    status = player.site_up('url')
    assert status == 200
  end

  def test_can_see_user_balance
    assert !player.player_balance.nil?
  end


end
