# Boleto Simples demo app

## Start the server

To start the server you need these environment variables set:

* **APP_ID** - Your application id/uid
* **APP_TOKEN** - Your application secret
* **APP_ACCESS_TOKEN** - Your application access token (that allows you to create new users) please read further on how to obtain it

### Getting your application access token

```ruby
response = RestClient.post 'http://sandbox.boletosimples.com.br/api/v1/oauth2/token', {
grant_type: 'client_credentials',
client_id: ENV['APP_ID'],
client_secret:  ENV['APP_TOKEN']
}

JSON.parse(response)["access_token"]
```
