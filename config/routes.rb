Rails.application.routes.draw do
  get 'top/index'

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
  # root 'events#index'

  resources :users
  resources :projects do
    resources :progresses do
      resources :progress_comments
    end
    resources :events 
    resources :topics do
      resources :topic_comments
    end
  end


end
