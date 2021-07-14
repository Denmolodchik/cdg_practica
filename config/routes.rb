Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'back/index', as: 'back_root'

  resources :users, only: [:show] do
    resources :posts
    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: [:create, :destroy]
  resources :feed_posts, only: [:index]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [:create, :destroy, :index]

  resources :posts, only: [:back]
end
