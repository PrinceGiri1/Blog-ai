Rails.application.routes.draw do
  get 'welcome/index'
  get "login", :to => "admin/sessions#new", as: :login

  root 'welcome#index'
  get 'admin', to: 'admin/users#home'
  get 'welcome/new', to: 'welcome#new', as: 'new_message'
  post 'welcome', to: 'welcome#create'


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
