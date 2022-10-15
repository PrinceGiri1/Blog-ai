Rails.application.routes.draw do
  root 'home#index'
  resources :home 
  resources :comments, only: :create 
  
  
  
  get "login", :to => "admin/sessions#new", as: :login
  get 'admin', to: 'admin/users#home'
  
  namespace :admin do
    resources :users
    resources :posts
    resources :tags
    resources :sessions
    resources :messages
    resources :notifications
    resources :settings
    resources :comments do
      member do
        patch :approve
        patch :disapprove
      end
      collection do
        get :publish
        get :pending 
      end
   end
  end
end
