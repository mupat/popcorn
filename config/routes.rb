Rails.application.routes.draw do
  resources :movies, except: [:show]

  root 'movies#index'
end
