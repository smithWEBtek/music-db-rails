Rails.application.routes.draw do
 
	root 'songs#index'
	get '/songs/:id/resources', to: 'songs#resources'
	get '/songs/:id/collections', to: 'songs#collections'

	get '/books', to: 'resources#books'

	namespace :api do 
	  resources :categories
		resources :songs
		resources :song_collections
		resources :collections
		resources :resources
	end
end
