# Boleto Simples demo app

## Start the server

To start the server you need these environment variables set in config/secrets.yml:

* **app_id** - Your application id/uid 
* **app_secret** - Your application secret
* **app_access_token** - Your application access token (that allows you to create new users) please read further on how to obtain it

Ask your credential in Boleto Simples http://suporte.boletosimples.com.br

### Getting your application access token

Check lib/get_access_token.rb

```ruby
response = RestClient.post 'https://sandbox.boletosimples.com.br/api/v1/oauth2/token', {
grant_type: 'client_credentials',
client_id: Rails.application.secrets.app_id,
client_secret:  Rails.application.secrets.app_secret
}

app_access_token=JSON.parse(response)["access_token"]
```
