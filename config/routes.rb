Rails.application.routes.draw do

		resources :gossips
		resources :users
	  resources :cities
		resources :sessions, only: [:new, :create, :destroy]
		root 'gossips#index'
    get '/team', to: 'static_pages#team'
    get '/contact', to: 'static_pages#contact'
		get '/welcome/:id', to: 'static_pages#welcome' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
