BoletoSimples.configure do |c|
  c.environment = :sandbox
  c.application_id = Rails.application.secrets.app_id
  c.application_secret = Rails.application.secrets.app_secret
  c.access_token = Rails.application.secrets.app_access_token
end