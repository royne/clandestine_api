Rails.application.routes.draw do
  default_url_options :host => "http://localhost:4000"
  
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
        end
      end
    end
  end
end
