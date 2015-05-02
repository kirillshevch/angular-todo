module OmniauthHelper
  def set_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider' => 'facebook',
      'uid' => '1234',
      'info' => {
        'email' => 'test@test.com'
      }
    })
  end
end