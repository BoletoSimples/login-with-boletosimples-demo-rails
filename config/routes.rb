Rails.application.routes.draw do
  get "/auth/boletosimples/callback", to: "sessions#create"

  resource :session

  root 'sessions#show'
end
