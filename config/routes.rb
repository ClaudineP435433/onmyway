Rails.application.routes.draw do
  devise_for :users
  root to: 'deliveries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deliveries, only: [:show, :new, :create] do
    resources :bookings, only: [:create]
  end

  namespace :my do
    resources :deliveries, only: [:index, :show] do
      member do
        post :done
      end
    end
  end

  resources :bookings, only: [:index, :destroy]
end
