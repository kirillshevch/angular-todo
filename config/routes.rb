Rails.application.routes.draw do
  root 'main#index'

  get 'users/omniauth_callbacks/facebook'

  devise_for :users, defaults: { format: :json }, controllers: {
    :omniauth_callbacks => 'users/omniauth_callbacks'
  }

  namespace :api, defaults: { format: :json } do
    resources :lists, except: [:show, :edit, :new] do
      resources :tasks, only: [:create, :update, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
    end
  end

end
