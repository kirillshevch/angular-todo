Rails.application.routes.draw do
  root 'main#index'

  devise_for :users, defaults: { format: :json }

  namespace :api, defaults: { format: :json } do
  end

end
