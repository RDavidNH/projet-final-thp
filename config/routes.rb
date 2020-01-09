Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/hoomiesadmin', as: 'rails_admin'
 
  get 'users/profil', 'users#profil'
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
  resources :testimonials
  root :to => "home#index"
end
