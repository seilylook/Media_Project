Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :intros
  resources :settings
  resources :messages
  resources :faqs
  resources :posts
  resources :pages
  resources :users
  resources :items
  resources :comments, only: [:create, :destroy]
  resources :user_items

  root 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
