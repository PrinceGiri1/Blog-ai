Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments, only: :create 
  end
  get "login", :to => "admin/sessions#new", as: :login
  get 'admin', to: 'admin/users#home'
  
  namespace :admin do
    resources :users
    resources :posts
    resources :tags
    resources :sessions
    resources :messages
    resources :notifications do 
      collection do 
        get :unread
      end
    end
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
