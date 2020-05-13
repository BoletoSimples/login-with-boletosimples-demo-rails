# frozen_string_literal: true

class DemoController < ApplicationController
  before_action :authenticate!, only: [:logged_in]

  def index; end

  def api; end

  def logged_in; end

  def access_api
    @user = BoletoSimples::Partner::User.create(email: params[:email])
  end

  def new_billet
    BoletoSimples.configure do |c|
      c.environment = :sandbox
      c.access_token = params[:application_access_token]
    end

    @bank_billet = BoletoSimples::BankBillet.create({
                                                      amount: 9.01,
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
                                                      expire_at: '2015-06-10'
                                                    })
  end
end
