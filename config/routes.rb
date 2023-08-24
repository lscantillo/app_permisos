Rails.application.routes.draw do
  resources :posts
  resources :permissions
  resources :roles do
    member do
      get 'edit_permissions'
      patch 'update_permissions'
    end
  end
  devise_for :users, controllers: { registrations: 'registrations/registrations' }
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
