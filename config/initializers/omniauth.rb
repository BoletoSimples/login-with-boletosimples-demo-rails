Rails.application.config.middleware.use OmniAuth::Builder do
  provider :boletosimples, Rails.application.secrets.app_id, Rails.application.secrets.app_secret,
           environment: 'sandbox', scope: "profile email write", user_agent: 'Your App (yourapp@example.com)'

  on_failure { |env| SessionsController.action(:failure).call(env) }
end

# OmniAuth.config.test_mode = true

# OmniAuth.config.mock_auth[:boletosimples] =  OmniAuth::AuthHash.new({
#   provider: "boletosimples",
#   uid: "12345",
#   info: {
#     full_name: "John Doe",
#     email: "john@example.com"
#   }
# })
