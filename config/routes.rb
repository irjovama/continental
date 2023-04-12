Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/api/v1/report', to: 'report#index'

  # get '/api/v1/users/:user_id/tests', to: 'user_tests#index'
  # get '/api/v1/users/:user_id/tests/:test_id', to: 'user_tests#show'
  post '/api/v1/magic-link', to: 'user#magic_link'
  resources :tests, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/tests'
  resources :user, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/users'

  resources :categories, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/categories'
  resources :questions, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/questions'
  resources :options, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/options'
  resources :descriptions, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/descriptions'
  resources :results, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/results'
  resources :user_questions, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/user_questions'

end
