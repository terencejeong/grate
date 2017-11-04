Rails.application.routes.draw do
  resources :items
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show, :update, :index], controller: :profiles
  resource :profile
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
