Rails.application.routes.draw do
  root 'main#index'

  get "users/omniauth_callbacks/facebook"

  devise_for :users, defaults: { format: :json }, controllers: {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  namespace :api, defaults: { format: :json } do
  end

end
