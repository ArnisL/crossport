Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, only: [:new, :create, :update]
  root 'application#show'
end
