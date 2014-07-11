class DemoController < ApplicationController
  before_filter :authenticate!, only: [:logged_in]

  def index
  end

  def api
  end

  def logged_in
  end

  def access_api

    client = oauth_client(Rails.application.secrets.app_access_token)

    # cria user com oauth
    @user = client.partner_create_user(
      {
        user: {
          email: params[:email]
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
                                              customer_phone_number: '2112123434',
                                              customer_state: 'RJ',
                                              customer_zipcode: '12312-123',
                                              description: 'Despesas do contrato 0012',
                                              expire_at: '2014-01-01'
                                            }
                                        })

  end

  private

  def oauth_client(access_token=Nil)
    credentials = {
      :token => access_token
    } if access_token

    client_options = {
      user_agent: 'Meu e-Commerce (meuecommerce@example.com)'
    }

    BoletoSimples::OAuthClient.new(Rails.application.secrets.app_id,
                                   Rails.application.secrets.app_secret,
                                   credentials,
                                   client_options)
  end

end
