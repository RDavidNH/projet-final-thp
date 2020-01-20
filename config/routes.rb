Rails.application.routes.draw do
  get 'charges/new'
  get 'charges/create'
  mount RailsAdmin::Engine => '/hoomiesadmin', as: 'rails_admin'
 
  get 'users/profil', 'users#profil'
  get 'users/contact', 'users#contact'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/omniauth/failure' => 'users/omniauth_callbacks#failure'
  end
  resources :home
  resources :houses do
      resources :comments
      resources :likes, only: [:create, :destroy]
  end
  resources :users
  resources :testimonials, only: [:create, :edit, :update]
  resources :charges, only: [:new, :create]
  root :to => "home#index"
end
