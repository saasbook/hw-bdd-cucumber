Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/movies/:movie', to: 'movies#show'

  # tmdb search
  post '/movies/search_tmdb'


end
