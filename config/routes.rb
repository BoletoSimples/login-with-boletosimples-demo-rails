Rails.application.routes.draw do
  get 'demo/index'
  get 'demo/api'
  post 'demo/access_api'
  get 'demo/new_billet'

  get "/auth/boletosimples/callback", to: "sessions#create"

  resource :session

  root 'demo#index'
end
