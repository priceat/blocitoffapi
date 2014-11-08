Blocitoff::Application.routes.draw do

  devise_for :users
  get "welcome/index"
  get "welcome/about"
  resources :todos, only: [:new]

  root to: 'welcome#index'

end
