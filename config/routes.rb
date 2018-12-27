Rails.application.routes.draw do
  # Backend routes for admin panel + admin login
  namespace :admin do
    # Post CRUD
    get '/posts' => 'posts#index'
    get '/posts/new' => 'posts#new'
    get '/posts/:id' => 'posts#show'
    post '/posts' => 'posts#create'
    get '/posts/:id/edit' => 'posts#edit'
    patch '/posts/:id' => 'posts#update'
    get '/posts/:id/delete' => 'posts#delete'
    delete '/posts/:id' => 'posts#destroy'

    # User/login routes
    get '/dashboard/' => 'users#show'
    get '/users/:id/edit' => 'users#edit'
    patch '/users/:id' => 'users#update'
    get '/login' => 'sessions#new'
    post '/sessions' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end

  # Front end routes for public api
  namespace :api do
    get '/posts' => 'posts#index'
    get '/posts/:id' => 'posts#show'

    resources :categories, except: [:destroy]
  end
end
