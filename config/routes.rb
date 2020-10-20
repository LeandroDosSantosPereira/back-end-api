Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  namespace :api do
    namespace :v1 do
     resources :users
     post 'users/login'
     post 'users/create'
    #  Rotas do post
    post "/posts", to: 'posts#create'
    get "/posts", to: "posts#index"
    end
  end
end
