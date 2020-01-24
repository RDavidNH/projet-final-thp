Rails.application.routes.draw do
  get 'offerservice/index'
  get 'charges/new'
  get 'charges/create'
  mount RailsAdmin::Engine => '/hoomiesadmin', as: 'rails_admin'
  
 
  get 'users/profil', 'users#profil'
  get 'users/contact', 'users#contact'

  get '/houses/filter', to: 'search#filter'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/omniauth/failure' => 'users/omniauth_callbacks#failure'
  end
  resources :home, only: [:index]
  resources :houses do
      resources :comments
      resources :likes, only: [:create, :destroy]
  end

  resources :users
  resources :testimonials, only: [:create, :edit, :update]
  resources :charges, only: [:new, :create]
  resources :offerservice, only: [:index]
  root :to => "home#index"
end
