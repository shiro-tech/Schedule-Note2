Rails.application.routes.draw do
  get 'top/index'
  get 'projects/new'
  get 'projects/index'
  get 'progresses/new'
  get 'progresses/index'
  get 'topics/new'
  get 'topics/index'
  get 'sessions/new'
  #ログインページへのroutes付け
  get '/login', to: 'sesions#new'
  get '/login', to: 'sesions#create'
  get '/login', to: 'sesions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'

  resources :users



end
