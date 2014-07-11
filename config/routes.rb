Rails.application.routes.draw do
  get 'demo/index'
  get 'demo/api'
  post 'demo/access_api'
  get 'demo/new_billet'
  get 'demo/logged_in'

  get "/auth/boletosimples/callback", to: "sessions#create"

  resource :session do
    collection do
      get :failure
    end
  end

  root 'demo#index'
end
