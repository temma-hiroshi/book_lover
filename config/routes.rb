Rails.application.routes.draw do
  get 'books/new'
  devise_for :users
  root :to => 'home#index'
  get 'home/index'
  resources :users, :only => [:show, :edit, :update, :destroy]
end
