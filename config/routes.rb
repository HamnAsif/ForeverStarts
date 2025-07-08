Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Set your homepage
  root 'pages#home'

  # Devise routes, skipping the default registration routes
  devise_for :users

  # Custom sign-up routes for couples
  namespace :couples do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
    get 'dashboard', to: 'dashboard#show'
    get 'inspiration', to: 'inspirations#show'
    get 'budget', to: 'budgets#show'
    get 'card', to: 'cards#show'
    
    get 'findvendor', to: 'findvendors#show'
    get 'guest', to: 'guests#new'
    post 'guest', to: 'guests#create'
    resources :guest, only: [:new, :create]
    resources :events, only: [:new, :create]
    resource :profile, only: [:show, :edit, :update]

  end

  # Custom sign-up routes for vendors
  namespace :vendors do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
    get 'dashboard', to: 'dashboard#show'
    resource :profile, only: [:show, :edit, :update]
    resources :registrations, only: [:new, :create, :edit, :update] 

  end
end
