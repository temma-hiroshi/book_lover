Rails.application.routes.draw do
  get 'comments/create'
  get 'books/new'
  devise_for :users
  root :to => 'home#index'
  get 'home/index'
  post 'home/guest_sign_in'
  resources :users, :only => [:show, :edit, :update, :destroy]
  resources :books, :only => [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      get "search"
    end
  end
  resources :comments, :only => [:create, :edit, :update, :destroy]
end
