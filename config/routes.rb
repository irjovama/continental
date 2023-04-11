Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/api/v1/report', to: 'report#index'

  get '/api/v1/users', to: 'user#index'
  get '/api/v1/users/:id', to: 'user#show'
  post '/api/v1/users', to: 'user#create'
  put '/api/v1/users/:id', to: 'user#update'
  delete '/api/v1/users/:id', to: 'user#destroy'

  get '/api/v1/tests', to: 'tests#index'
  get '/api/v1/tests/:id', to: 'tests#show'
  post '/api/v1/tests', to: 'tests#create'
  put '/api/v1/tests/:id', to: 'tests#update'
  delete '/api/v1/tests/:id', to: 'tests#destroy'
end
