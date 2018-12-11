Rails.application.routes.draw do
  namespace :api do
    get '/posts' => 'posts#index'
    post '/posts' => 'posts#create'
    get '/posts/:id' => 'posts#show'
    patch '/posts/:id' => 'posts#update'
    delete '/posts/:id' => 'posts#destroy'
  end

  namespace :admin do
    get '/posts' => 'posts#index'
    get '/posts/new' => 'posts#new'
    get '/posts/:id' => 'posts#show'
    post '/posts' => 'posts#create'
    get '/posts/:id/edit' => 'posts#edit'
    patch '/posts/:id' => 'posts#update'
    get '/posts/:id/delete' => 'posts#delete'
    delete '/posts/:id' => 'posts#destroy'
  end
end
