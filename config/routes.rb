Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'copies#index'
  resources :copies, only: [:index, :new, :create, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
