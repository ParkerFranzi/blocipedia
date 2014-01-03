Blocipedia::Application.routes.draw do

  get "subscriptions/new"

  get "subscriptions/create"

  get "subscriptions/show"

  get "plans/index"

  devise_for :users

  resources :posts
  resources :users, only: [:show] # create a route for users#show

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'

end