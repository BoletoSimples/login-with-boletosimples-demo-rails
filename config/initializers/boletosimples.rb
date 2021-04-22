# frozen_string_literal: true

BoletoSimples.configure do |c|
  c.environment = :sandbox
  c.api_token = Rails.application.secrets.app_access_token
  c.user_agent = 'email@minhaempresa.com.br'
end
