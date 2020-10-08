Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:show, :index, :edit, :update, :create, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end

  get 'users/follows/:id' => 'users#follows', as: 'follows'
  get 'users/followers/:id' => 'users#followers', as: 'followers'

  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す


end