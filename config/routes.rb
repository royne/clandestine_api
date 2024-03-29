Rails.application.routes.draw do
  Rails.application.routes.default_url_options = {host: ENV["BACK_HOST"] }
  
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'
      get 'users/current' => 'users#current'
      
      resources :users, only: [:index, :show, :update, :create, :destroy] do 
        collection do
          post :create_escort
        end
      end
      resources :escorts, only: [:index, :show, :update, :create, :destroy] do 
        collection do
          get :escorts_selected
          get :randon_premium
          get :counter
        end
      end

      resources :search, only: [:index]
      
    end
  end
end
