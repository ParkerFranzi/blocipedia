Blocipedia::Application.routes.draw do

  devise_for :users

  resources :subscriptions
  resources :posts
  resources :users, only: [:show] # create a route for users#show

  get "about" => 'welcome#about'

  root to: 'welcome#index'

end