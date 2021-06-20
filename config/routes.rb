Rails.application.routes.draw do
  get 'top/index'

  get 'projects/new'
  get 'projects/index'
  get 'projects/show'

  get 'progresses/new'
  get 'progresses/index'

  get 'progress_comments/new'

  get 'topics/new'
  get 'topics/index'

  get 'topic_comments/new'

  get 'sessions/new'

  get 'calender/index'
  get 'calender/new'

  get 'notification/index'
  #ログインページへのroutes付け
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'

  resources :users
  resources :projects



end
