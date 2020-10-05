Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :edit, :update, :create, :destroy]

  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
end