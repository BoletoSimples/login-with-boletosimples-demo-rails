# Login with Boleto Simples in Rails Demo

A login with Boleto Simples demo for Rails that uses Omniauth.

You can get a access token with app_id and app_secret using above function:

```
def get_access_token
  response = RestClient.post 'http://sandbox.boletosimples.com.br/api/v1/oauth2/token', {
    grant_type: 'client_credentials',
    client_id: ENV['APP_ID'],
    client_secret:  ENV['APP_TOKEN']
  }

  JSON.parse(response)["access_token"]
end
```

And then run this application specifing yours APP_ID, APP_TOKEN (app_secret) and APP_ACCESS_TOKEN

```
APP_ID=18cd60aef456d06c99941b262cfc33e22f10e84d3e335a95d8535a12dc65bd03 APP_TOKEN=9bcc4c7d81395e0b6ed1b16da85ed64121d47b00e90fe6058e058d4010f64104 APP_ACCESS_TOKEN=1c1e46f9df5a3c69db0807c76b443ac3aad43df1b8670a7661e2e43994fe0555 rails s
```

[Boleto Simples](https://boletosimples.com.br)