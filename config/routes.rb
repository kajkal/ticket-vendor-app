Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :tickets
  resources :events, :only => [:index, :show, :new, :create]
end
