Blocipedia::Application.routes.draw do

  devise_for :users

  resources :subscriptions
  resources :posts
  resources :users, only: [:show] # create a route for users#show

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

end