Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reports do
    resources :tickets, only: [:create]
    resources :comments, only: [:new, :create]
    resources :follows, only: [:create]
  end

  resources :follows, only: [:destroy]
  get "dashboard", to: "users#dashboard"
  # get "myreports", to: "users#reports"
  # get "mytickets", to: "users#tickets"

  resources :tickets, only: [:show, :update] do
    resources :notes, only: [:new, :create]
  end
end
