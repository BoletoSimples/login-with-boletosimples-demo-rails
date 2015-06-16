# Boleto Simples demo app

## Start the server

To start the server you need these environment variables set in config/secrets.yml:

* **app_id** - Your application id/uid 
* **app_secret** - Your application secret
* **app_access_token** - Your application access token (that allows you to create new users) please read further on how to obtain it

Register you application in Boleto Simples at https://sandbox.boletosimples.com.br/conta/api/aplicacoes

### Getting your application access token

Check lib/get_access_token.rb

```ruby
require 'boletosimples'

BoletoSimples.configure do |c|
  c.environment = :sandbox
  c.application_id = 'app_id'
  c.application_secret = 'app_secret'
end

puts BoletoSimples.configuration.client_credentials
```
