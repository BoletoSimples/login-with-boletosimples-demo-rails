Rails.application.routes.draw do
  get 'demo/index'
  get 'demo/api'

  get "/auth/boletosimples/callback", to: "sessions#create"

  resource :session

  root 'demo#index'
end
