Rails.application.routes.draw do
  # Set your homepage
  root 'pages#home'

  # Devise routes, skipping the default registration routes
  devise_for :users

  # Custom sign-up routes for couples
  namespace :couples do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
  end

  # Custom sign-up routes for vendors
  namespace :vendors do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
  end
end
