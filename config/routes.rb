Rails.application.routes.draw do
  get 'users/profil', 'users#profil'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
	  authenticated :user do
	  	root 'home#index', as: :authenticated_root
	  end

	  unauthenticated do
	  	root 'devise/sessions#new', as: :unauthenticated_root
	  end
  end

  resources :home
  resources :houses
  resources :users
  resources :testimonials
  # root :to => "devise/sessions#new"
end
