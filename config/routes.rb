Rails.application.routes.draw do
  get 'top/index'

  get 'progress_comments/new'

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
  resources :topics
  resources :progresses



end
