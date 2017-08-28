Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :comments, only: :index
    resources :attendances, only: :index
  end

  devise_for :users

  resources :users, only: :show
  resources :categories, only: [:show]

root 'events#index'

  resources :events do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
    resources :attendances, only: [:create]
  end
end
