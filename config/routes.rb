Rails.application.routes.draw do


  resources :users
  
  resources :posts do
    resources :comments, only:[:new, :create, :destroy]
  end

  get '/follow/:id', to: 'users#follow', as: 'follow_user'

  get '/unfollow/:id', to: 'users#unfollow', as: 'unfollow_user'

  # get '/posts/:post_id/', to: 'posts#show', as: 'post'
  # patch '/posts/:post_id', to: 'posts#update', as: 'post_update'
  root 'home#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
