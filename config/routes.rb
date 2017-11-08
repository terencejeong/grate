Rails.application.routes.draw do
  resources :offers

  resources :items do
    member do
      post 'charge'
    end
  end



  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show, :update, :index, :contact, :destroy], controller: :profiles do
    resources :reviews, controller: :reviews
  end
  resource :profile

  get 'equipment', to: 'items#equipment', as: 'equipment'

  get 'thanks', to: 'items#thanks', as: 'thanks'

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
