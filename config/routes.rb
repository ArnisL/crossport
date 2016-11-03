Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, only: [:new, :create, :update]
  get '/monthly_report', to: 'application#monthly_report'
  root 'application#show'
end
