Rails.application.routes.draw do
  devise_for :owners, controllers: {
    registrations: 'owners/registrations',
    sessions: 'owners/sessions',
    passwords: 'owners/passwords'
   }
   
  resources :owners
  resources :base_menus do
    resources :menu_items, only: [:create, :edit, :update, :destroy, :show] #This will allow owners to manage both menu and menu items from the same page
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "base_menus#index"
end
