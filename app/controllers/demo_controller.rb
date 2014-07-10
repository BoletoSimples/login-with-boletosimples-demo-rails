class DemoController < ApplicationController
  before_filter :authenticate!, only: [:logged_in]

  def index
  end

  def api
  end

  def access_api

    client = oauth_client(ENV['APP_ACCESS_TOKEN'])

    # cria user com oauth
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

    client = oauth_client(params[:application_access_token])

    @billet = client.create_bank_billet({
      access_token: params[:application_access_token],
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

  private

  def oauth_client(access_token=Nil)
    credentials = {
      :token => access_token
    } if access_token

    client_options = {
      user_agent: 'Meu e-Commerce (meuecommerce@example.com)',
      base_uri: 'http://localhost:5000/api/v1'
    }

    BoletoSimples::OAuthClient.new(ENV['APP_ID'], ENV['APP_TOKEN'], credentials, client_options)
  end

end
