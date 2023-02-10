Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  get 'profile', to: 'users#show', as: :profile
  resources :events, only: [:index, :new, :create, :show, :edit, :update] do
    resources :attendances, only: [:new, :create]
  end
  resources :users, only: [:show]
end
