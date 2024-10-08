# spec/support/omniauth.rb
OmniAuth.config.test_mode = true

def mock_google_oauth2
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    provider: 'google_oauth2',
    uid: '123456789',
    info: {
      email: 'user@example.com',
      name: 'John Doe',
      first_name: 'John',
      last_name: 'Doe'
    },
    credentials: {
      token: 'mock_token',
      refresh_token: 'mock_refresh_token',
      expires_at: Time.now + 1.week
    }
  })
end
