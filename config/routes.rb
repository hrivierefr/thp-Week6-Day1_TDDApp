Rails.application.routes.draw do
 
  get 'static/home'
	get 'users/show'

  	get '/', to: 'static#home', as: 'root'

	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'
	get '/club', to: 'users#index', as: 'club'

	get    '/login',   to: 'static#home'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'

	resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end