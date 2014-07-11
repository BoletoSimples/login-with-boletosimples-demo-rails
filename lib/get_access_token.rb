require 'rest-client'
require 'json'

response = RestClient.post 'https://sandbox.boletosimples.com.br/api/v1/oauth2/token', {
  grant_type: 'client_credentials',
  client_id: 'app_id',
  client_secret:  'app_secret'
}

app_access_token = JSON.parse(response)["access_token"]

puts "app_access_token: #{app_access_token}"
