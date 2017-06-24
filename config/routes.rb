Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end

  devise_for :users

  resources :users, only: :show

root 'events#index'

  resources :events
end
