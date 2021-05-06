Rails.application.routes.draw do
  
  root 'tops#home'
  get '/signup', to:'users#new'
  get '/login',   to: 'sessions#new'
  post'/login',   to: 'sessions#create'
  get '/post', to:'questions#new'
  get '/search', to:'tops#search'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :questions, only:[:create,:destroy,:show]

end
