Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")  resources :movies
  # root "articles#index"
end
