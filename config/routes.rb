Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :care_notes
      resources :user_plants
      resources :favorites
      resources :plants
      resources :users
      post '/login', to: 'auth#create'
      get '/re_auth', to: 'auth#re_auth'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
