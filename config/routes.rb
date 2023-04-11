Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/api/v1/report', to: 'report#index'

  # categories
  # namespace :api do
  #   namespace :v1 do
  #     resources  :categories, only:[:index, :show]
  #   end
  # end

  resources :categories, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/categories'
  resources :questions, only: [:index, :show, :destroy, :update, :create], path: '/api/v1/questions'

end
