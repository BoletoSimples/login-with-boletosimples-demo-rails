class DemoController < ApplicationController
  before_filter :authenticate!, only: [:logged_in]

  def index
  end

  def api
  end

  # require 'rest-client'
  # require 'json'
  #
  # client_id = '9d2d6a60debbb49cafa946aa097be73c273c2007edcc10150c5f498bb3e5329e'
  # client_secret = 'c2eba7b34956d51b49161e22453c3322b098040767d2c7c2d6924682ca8bb623'
  #
  # response = RestClient.post 'http://localhost:5000/oauth/token', {
  #   grant_type: 'client_credentials',
  #   client_id: client_id,
  #   client_secret: client_secret
  # }

  def access_api
    client = BoletoSimples::Client.new('dirceuu@gmail.com', '', {user_agent: 'Meu e-Commerce (meuecommerce@example.com)'})

    @user = client.partner_create_user(
      {
        user: {
          email: params[:email],
          notification_url: 'http://example.com.br/notify'
        }
      }
    )
  end

  def new_billet

    credentials = {
      :token => params[:application_access_token]
    }
    client_options = {
      user_agent: 'Meu e-Commerce (meuecommerce@example.com)',
      base_uri: 'http://localhost:5000/api/v1'
    }

    oauth_client = BoletoSimples::OAuthClient.new('9d2d6a60debbb49cafa946aa097be73c273c2007edcc10150c5f498bb3e5329e', 'c2eba7b34956d51b49161e22453c3322b098040767d2c7c2d6924682ca8bb623', credentials, client_options)

    @billet = oauth_client.create_bank_billet({
      bank_billet:
      {
        amount: 41.01,
        customer_address: 'Rua quinhentos',
        customer_address_complement: 'Sala 4',
        customer_address_number: '111',
        customer_city_name: 'Rio de Janeiro',
        customer_cnpj_cpf: '012.345.678-90',
        customer_email: 'cliente@bom.com',
        customer_neighborhood: 'Sao Francisco',
        customer_person_name: 'Joao da Silva',
        customer_person_type: 'individual',
        customer_phone_number: '2112123434',
        customer_state: 'RJ',
        customer_zipcode: '12312-123',
        description: 'Despesas do contrato 0012',
        expire_at: '2014-01-01',
        notification_url: 'http://example.com.br/notify',
      }
    })

  end

end