Rails.application.routes.draw do

  get    "login"  => "sessions#new"
  post   "login"  => "sessions#create"
  delete "logout" => "sessions#destroy"
  get 'books/thongbao'
  get  "resigter" => "users#new"
  get  "addbook" => "books#new"
  get '/button', to: 'favorites#button', as: 'button'
  get "home" => "home_pages#index"
  get "wellcome" => "first_pages#index"


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


root 'first_pages#index'

  resources :books do
  resources :reads
  resources :reviews
  resources :comments
  resources :bookfavorites
  end


  resources :users do
  resources :follow1s
  resources :bookfavorites
  end
  resources :requires


end
