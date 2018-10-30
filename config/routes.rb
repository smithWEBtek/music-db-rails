Rails.application.routes.draw do
	
	root 'songs#index'
	get '/songs/:id/docs', to: 'songs#docs'
	get '/songs/:id/collections', to: 'songs#collections'

	get '/books', to: 'docs#books'

	resources :categories
	resources :songs
	resources :song_collections
	resources :collections
	resources :docs
	resources :resources
	
	get '/resources/:id/destroy', to: 'resources#destroy'
	get '/resources/destroy_confirmation', to: 'resources#destroy_confirmation'
end
