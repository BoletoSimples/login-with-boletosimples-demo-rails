Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :boletosimples, ENV['APP_ID'], ENV['APP_TOKEN'], environment: 'sandbox', scope: "profile email", user_agent: 'Boleto Simples (suporte@boletosimples.com.br)'
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