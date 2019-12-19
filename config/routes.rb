Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/hoomiesadmin', as: 'rails_admin'
  # mount RailsAdmin::Engine => '/superadmin', as: 'clientadmin'
  get 'users/profil', 'users#profil'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do
	 #  authenticated :user do
	 #  	root 'home#index', as: :authenticated_root
	 #  end

	 #  # unauthenticated do
	 #  # 	root 'devise/sessions#new', as: :unauthenticated_root
	 #  # end
  # end

  resources :home
  resources :houses do
      resources :comments
      resources :likes, only: [:create, :destroy]
  end
  resources :users
  resources :testimonials
  root :to => "home#index"
end
