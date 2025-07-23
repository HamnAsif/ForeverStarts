Rails.application.routes.draw do
  get "cards/new"
  get "cards/create"
  get "cards/show"
  post '/rate' => 'rater#create', :as => 'rate'
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
    resource :budget, only: [:show, :update]

    
    get 'guest', to: 'guests#new'
    post 'guest', to: 'guests#create'
    resources :guest, only: [:new, :create]

    resource :profile, only: [:show, :edit, :update]
    resources :findvendors, only: [:index, :show]
    resources :appointments, only: [:index, :create] do
      member do
        patch :cancel
        patch :complete
      end
    end
    resources :services, only: [:show]
    resources :cards do
      member do
        get :download_image
      end
    end

    resources :events do
      resources :todo_lists, only: [:create]
    end
    resources :todo_lists do
      member do
        patch :update_status
      end
    end

    

    

  end
  

  resources :ratings, only: [:create, :index]

  # Custom sign-up routes for vendors
  namespace :vendors do
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
    get 'dashboard', to: 'dashboard#show'
    resources :appointments, only: [:index] do
      member do
        patch :confirm
        patch :cancel
      end
    end

    resource :profile, only: [:show, :edit, :update]
    resources :registrations, only: [:new, :create, :edit, :update] 
    resources :services do
      member do
        delete 'images/:image_id', to: 'services#delete_image', as: 'image'
      end
    end
    


  end
end
