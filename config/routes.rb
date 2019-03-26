Rails.application.routes.draw do
  root 'movies#index'
  resources :reservations
  resources :users
  resources :movies

  namespace :api do
    namespace :v1 do
      resources :reservations, :defaults => { :format => :json }
      resources :users, :defaults => { :format => :json }
      resources :movies, :defaults => { :format => :json }
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
