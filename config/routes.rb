require 'api_constraints'

FfApi::Application.routes.draw do
  devise_for :users
   # Api definition
   namespace :api, defaults: { format: :json },
                               constraints: { subdomain: 'api' }, path: '/'  do
     scope module: :v1,
               constraints: APIConstraints.new(version: 1, default: true) do
       # We are going to list our resources here
       resources :users, only: [:show]
        end
    end
end
