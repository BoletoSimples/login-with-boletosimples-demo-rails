# frozen_string_literal: true

require 'boletosimples'

BoletoSimples.configure do |c|
  c.environment = :sandbox
  c.application_id = 'app_id'
  c.application_secret = 'app_secret'
end

puts BoletoSimples.configuration.client_credentials
