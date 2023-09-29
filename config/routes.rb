Rottenpotatoes::Application.routes.draw do
  # devise_for :moviegoers
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/movies/:movie', to: 'movies#show'

  # tmdb search
  post '/movies/search_tmdb' => 'movies#search_tmdb', :as => 'search_tmdb'

  devise_for :moviegoers, controllers: {
    omniauth_callbacks: 'moviegoers/omniauth_callbacks',
    sessions: 'moviegoers/sessions',
    registrations: 'moviegoers/registrations'
  }

end
